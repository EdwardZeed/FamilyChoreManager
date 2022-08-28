//
//  ContentView.swift
//  onTaskArchiever
//
//  Created by chris on 22/8/2022.
//

import SwiftUI

struct ParentLoginPage: View {
    
    @State var userName: String = ""
    @State var password: String = ""
    @State var goToScan = false

    
    
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
                    
               
                    CustomizedTextField(inputStream: $userName, label: "Name: ",placeholder: "Email Address")
                        .padding(.bottom, UIScreen.main.bounds.height*0.04)
                    
                    CustomizedSecureField(inputStream: $password, label: "Password: ", placeholder: "Password")
                        .padding(.bottom,UIScreen.main.bounds.height*0.02)
                    
                    
                    Text("Forgot your password?")
                        .font(.caption)
                        .fontWeight(.light)
                        .foregroundColor(Color.blue)
                        .padding(.bottom, UIScreen.main.bounds.height*0.05)
                    
                    
                    Button(action: {}, label: {
                        Image("LoginBtn")
                    })
                    .padding(.bottom, UIScreen.main.bounds.height*0.03)
                    
                    Image("separateLine")
                        .padding(.bottom, UIScreen.main.bounds.height*0.03)
                    
                    ThirdPartyLogo()
                }
            }
            .navigationBarHidden(true)
        }
        
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
