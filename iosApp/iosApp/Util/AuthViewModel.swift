//
//  AuthViewModel.swift
//  iosApp
//
//  Created by Edward Zheng on 13/9/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import Foundation
import Firebase
import GoogleSignIn

class AuthViewModel: ObservableObject{
    
    @Published var userSession:FirebaseAuth.User?
    
    @Published var emailValid: Float = 0
    @Published var emailPrompt = ""
    @Published var passwordValid: Float = 0
    @Published var passwordPrompt = ""
    @Published var nameValid: Float = 0
    @Published var namePrompt = ""
    @Published var dateOfBirthValid: Float = 0
    @Published var dateOfBirthPrompt = ""
    
    @Published var loginFailed = false
    @Published var progressing = false
    
    @Published var username = ""
    
    init(){
        self.userSession = Auth.auth().currentUser
    }
    
    func loginWithEmail(email: String, password: String){
        self.progressing = true
        Auth.auth().signIn(withEmail: email, password: password){
            auth,err in
            if let error = err{
                self.loginFailed = true
                print("DEBUG:\(error.localizedDescription)")
            }
            else{
                guard let user = auth?.user else {return}
                self.progressing = false
                self.userSession = user
                self.username = user.displayName ?? ""
                print(auth!.autoContentAccessingProxy)
            }
        }
    }
    
    func loginWithGoogle(){
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        
        GIDSignIn.sharedInstance.signIn(with: config, presenting: ApplicationUtil.rootViewController){user, error in
            if let error = error{
                print("DEBUG: LOGIN FAILED WITH GOOGLE, \(error.localizedDescription)")
                return
            }
            
            guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
              else {
                return
              }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                             accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential){
                result, error in
                if let error = error{
                    print("DEBUG: \(error.localizedDescription)")
                    return 
                }
                
                guard let user = result?.user else{return}
                print(user.displayName)
                
                self.username = user.displayName ?? ""
                self.userSession = user
            }
            
        }
    }
    
    func register(email: String, password: String, name: String, dateOfBirth: Date?) {
        
        if checkValid(email: email, password: password, name: name, dateOfBirth: dateOfBirth) == false{
            return
        }
       
        let dateFormatter = DateFormatter()
        let birthday = dateFormatter.string(from: dateOfBirth!)
        print("DEBUG: \(birthday)")
        
        Auth.auth().createUser(withEmail: email, password: password){result,err in
            if err != nil{
                if err?.localizedDescription == "The email address is already in use by another account."{
                    self.emailValid = 2
                    self.emailPrompt = "this email has already registered, please try another one."
                }
            }
            else{
                guard let user = result?.user else {return}
                self.userSession = user
                
                let data = ["email": email, "name": name, "dateOfBirth": birthday, "userId": user.uid]
                Firestore.firestore().collection("users")
                    .document(user.uid)
                    .setData(data)
                
                self.username = user.displayName ?? ""
            }
            
        }
    }
    
    func signOut(){
        self.userSession = nil
        try? Auth.auth().signOut()
        print("DEBUG: \(userSession)")
    }
    
    func checkValid(email: String, password: String, name: String, dateOfBirth: Date?) -> Bool{
//        check email format
               let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
               let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
               var valid = true
               
               if !emailTest.evaluate(with: email){
                   self.emailValid = 2
                   self.emailPrompt = "please enter a correct email format."
                   valid = false
               }
               else{
                   self.emailValid = 0
                   self.emailPrompt = ""
               }
               
       //        check password length
               if password.count < 6{
                   passwordValid = 2
                   passwordPrompt = "password cannot must be 6 characters long or more."
                   valid = false
               }
               else{
                   self.passwordValid = 0
                   self.passwordPrompt = ""
               }
               
               if name == "" {
                   nameValid = 2
                   namePrompt = "name can not be empty."
                   valid = false
               }
               else{
                   nameValid = 0
                   namePrompt = ""
               }
               
               if dateOfBirth == nil{
                   dateOfBirthPrompt = "date of birth can not be empty."
                   dateOfBirthValid = 2
                   valid = false
               }
               else{
                   dateOfBirthValid = 0
                   dateOfBirthPrompt = ""
               }
        
        return valid
               
    }
}

