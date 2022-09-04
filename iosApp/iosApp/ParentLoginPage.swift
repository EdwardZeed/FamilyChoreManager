//
//  ContentView.swift
//  onTaskArchiever
//
//  Created by chris on 22/8/2022.
//

import SwiftUI
import shared

var child1 = Child(userID: 1, name: "Linda", dateOfBirth: "2012/02/14", chooseTheme: Theme(name: "Disney"), avatarPic: "Poly")

var child2 = Child(userID: 2, name: "Anna", dateOfBirth: "2012/03/14", chooseTheme: Theme(name: "Marvel"), avatarPic: "IronMan")

var child3 = Child(userID: 3, name: "Bulankin", dateOfBirth: "2012/05/14", chooseTheme: Theme(name: "T-34"), avatarPic: "PP_50")

var child4: Child = Child(userID: 4, name: "Frank", dateOfBirth: "2001", chooseTheme: nil, avatarPic: "Default")

var child5: Child = Child(userID: 5, name: "Frank", dateOfBirth: "2001", chooseTheme: nil, avatarPic: "Default")

struct ParentLoginPage: View {
    
    @State var userName: String = ""
    @State var password: String = ""
    @State var goToScan = false
    @State var valid: Float = 0
    @State var goToDashboard = false
    
    
    
    func goToHomeSecond(){
        if let window = UIApplication.shared.windows.first
        {
            window.rootViewController = UIHostingController(rootView: ChildLoginPage())
            window.makeKeyAndVisible()
        }
    }
    
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Image("Background").resizable().scaledToFill().ignoresSafeArea().opacity(0.2)
                
//                another way to navigate with button and NavigationLink
                Button(action: {
                    goToScan = true
                }, label: {
                    Image("QrCodeScan")
                })
                .frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.9, alignment: .topTrailing)
                .zIndex(100)
                
                NavigationLink(destination: ChildLoginPage(), isActive: $goToScan){
                    EmptyView()
                }
                .navigationBarHidden(true)
                
                VStack {
                    
                    ProfilePhoto()
                    
                    
                    WelcomeAndSignUpText()
                    
               
//                    CustomizedTextField(inputStream: $userName, label: "Name: ",placeholder: "Email Address")
//                        .padding(.bottom, UIScreen.main.bounds.height*0.04)
//
//                    CustomizedSecureField(inputStream: $password, label: "Password: ", placeholder: "Password")
//                        .padding(.bottom,UIScreen.main.bounds.height*0.02)
                    EntryField(textValue: $userName, icon: Image("emailIcon"), placeholder: "Email Address", prompt: "", validation: $valid, isPassword: false)
                        .padding(.bottom, 3)
                    EntryField(textValue: $password, icon: Image("locksign"), placeholder: "Password: ", prompt: "", validation: $valid, isPassword: true)
                        
                    
                    
                    Text("Forgot your password?")
                        .font(.caption)
                        .fontWeight(.light)
                        .foregroundColor(Color.blue)
                        .padding(.bottom, UIScreen.main.bounds.height*0.05)
                    
                    
                    Button(action: {goToDashboard=true}, label: {
                        Image("loginBtn")
                    })
                    .padding(.bottom, UIScreen.main.bounds.height*0.03)
                    
                  
                    var li = [child1, child2, child3, child4, child5]
                    NavigationLink(destination: NavigationBarView(userName: userName,childrenlist: li).ignoresSafeArea(), isActive: $goToDashboard){
                        EmptyView()
                    }.navigationBarHidden(true)
                    
                    Image("separateLine")
                        .padding(.bottom, UIScreen.main.bounds.height*0.03)
                    
                    ThirdPartyLogo()
                }
            }
            .onTapGesture {
                hideKeyboard()
            }
            
        }
        .navigationBarHidden(true)
      
        
    }
}


struct ParentLoginPage_Previews: PreviewProvider {
    static var previews: some View {
        ParentLoginPage()
    }
}




struct CustomizedTextField: View{
    @Binding var inputStream: String
    let label: String
    let placeholder: String
    
    var body: some View{
        
        VStack{
     
            TextField(placeholder, text: $inputStream)
            //                .padding(.horizontal)
                .background(Image("emailTextField-1"))
                .frame(width: UIScreen.main.bounds.width*0.69, height: 40)
               
            
            
            
        }
        
    }
}

struct CustomizedSecureField: View{
    @Binding var inputStream: String
    let label: String
    let placeholder: String
    
    var body: some View{
        
        VStack{
            
            
            SecureField(placeholder, text: $inputStream)
            //                .padding(.horizontal)
                .background(Image("passwordTextField-1"))
                .frame(width: UIScreen.main.bounds.width*0.69, height: 40)
        }
    }
}


struct ProfilePhoto: View {
    var body: some View {
        ZStack{
            
            
            Image("photoframe")
                .frame(alignment: .center)
            
            
            Image("userPhoto")
                .frame(alignment: .center)
        }
    }
}

struct WelcomeAndSignUpText: View {
    var body: some View {
        HStack {
            VStack {
                Text("   Welcome back!")
                    .fontWeight(.thin)
                    .multilineTextAlignment(.leading)
                
                
                HStack {
                    Text("If you dont have account,")
                        .fontWeight(.thin)
                    
                    
                    NavigationLink(destination: SignUpPage(), label: {
                        Text("Sign up")
                    })
                }
            }
            
        }
        .padding(.bottom, 10)
    }
}

struct ThirdPartyLogo: View {
    var body: some View {
        HStack{
            Spacer()
            Image("AppleLoginBtn")
            Spacer()
            Image("GoogleLoginBtn")
            Spacer()
            Image("FacebookLoginBtn")
            Spacer()
        }
    }
}

