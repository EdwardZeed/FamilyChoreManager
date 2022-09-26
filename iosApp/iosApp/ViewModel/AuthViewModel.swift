//
//  AuthViewModel.swift
//  iosApp
//
//  Created by Edward Zheng on 13/9/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import Foundation
import SwiftUI
import Firebase
import GoogleSignIn
import shared
import CryptoKit
import AuthenticationServices

class AuthViewModel: ObservableObject{
    @Published var nonce = ""
    
    @Published var userSession:FirebaseAuth.User?
    @Published var currentUser: Parent?
    
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
    @AppStorage("loggedInWithThirdParty") var loggedInWithThirdParty: Bool = false
    
    var service = UserService()
    
    init(){
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
    }
    
    func loginWithEmail(email: String, password: String){
        self.progressing = true
        Auth.auth().signIn(withEmail: email, password: password){
            auth,err in
            if let error = err{
                self.loginFailed = true
                self.progressing = false
                print("DEBUG:\(error.localizedDescription)")
            }
            else{
                guard let user = auth?.user else {return}
                self.progressing = false
                self.userSession = user
                self.fetchUser()
                
               
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
                print("DEBUG: \(user.displayName)")
                
                self.userSession = user
//                self.currentUser = Parent(userID: user.uid, name: user.displayName ?? "", dateOfBirth: "", chooseTheme: nil, avatarPic: "")
                self.fetchUser()
                
                if self.currentUser == nil{
                    print("DEBUG: registring for third party google")
                    self.registerForThirdparty(email: user.email ?? "", name: user.displayName ?? "", userId: user.uid)
                    self.fetchUser()
                }
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
                self.fetchUser()
                
            }
            
        }
    }
    
    func registerForThirdparty(email: String, name: String, userId: String){
        let data = ["email": email, "name": name, "userId": userId]
        Firestore.firestore().collection("users")
            .document(userId)
            .setData(data)
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
    
    func fetchUser(){
        guard let uid = self.userSession?.uid else {return}
        
        self.service.fetchUser(uid: uid) { user in
            self.currentUser = user
        }
        
    }
    
    func authenticateWithApple (credential: ASAuthorizationAppleIDCredential, currentNonce: String){
        guard let token = credential.identityToken else{
            print("error with firebase")
            return
        }
        print("I am tokemn: \n",token)
        guard let tokenString = String(data:token, encoding: .utf8) else{
            print("Error with token")
            return
        }
        
        let firebaseCredential = OAuthProvider.credential(withProviderID: "apple.com", idToken: tokenString, rawNonce: currentNonce)
        
        Auth.auth().signIn(with: firebaseCredential){
            result, error in
            if let error = error{
                print("DEBUG: \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else{return}
            print("DEBUG: \(user.displayName)")
            
            self.userSession = user
            self.loggedInWithThirdParty = true
            let fullname = (credential.fullName?.givenName ?? "") + " " + (credential.fullName?.familyName ?? "")
            let email = credential.email
           
            self.currentUser = Parent(userID: user.uid, name: fullname , dateOfBirth: "", chooseTheme: nil, avatarPic: "")
            print(user.uid)
            
            let data = ["email": email, "name": fullname, "dateOfBirth": "", "userId": user.uid]
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data)
            self.fetchUser()
        }
    }
    
}




