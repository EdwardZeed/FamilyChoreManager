//
//  ContentView.swift
//  onTaskArchiever
//
//  Created by chris on 22/8/2022.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)

struct ParentLoginPage: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        
        
        
        ZStack {
            Image("Background").resizable().scaledToFill().ignoresSafeArea()
            VStack {
                
                ShowUserImage()
                
                TextField("userName", text:  $username)
                    .padding(.horizontal, 100)
                    .background(Image("userNameTextField"))
                    .padding(.bottom, 50)
                
                
                SecureField("password", text:  $password)
                    .padding(.horizontal, 100)
                    .background(Image("passwordTextField"))
                    .padding(.bottom, 50)
                
                ShowLoginBtn()
                Image("separateLine")
                    .padding(.top, 60)
                ShowSignUpBtn()
                
                
            }
        }
        
        
    }
        
}

struct  ParentLoginPage_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Image("Background").resizable().scaledToFill()
            ParentLoginPage()
                
        }
    }
}


struct ShowLoginBtn: View {
    var body: some View {
        Button(" "){}
            .background(Image("loginBtn"))
            .padding(.top, 30)
    
    }
}


struct ShowSignUpBtn: View {
    var body: some View {
//        Button(" "){}
//            .background(Image("signUpBtn"))
//            .padding(.top, 50)
//        Button(action: goToSignUp, label: {
//            Image("signUpBtn")
//        })
//        .padding(.top, 50)
        
        NavigationLink(destination: SignUpPage(), label: {
            Image("signUpBtn")
                .padding(.top, 50)
        })
    
    }
    
    func goToSignUp(){
        if let window = UIApplication.shared.windows.first
            {
                window.rootViewController = UIHostingController(rootView: SignUpPage())
                window.makeKeyAndVisible()
            }
    }
}




struct ShowUserImage: View {
    var body: some View {
        Image("parentImage")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.top, -30.0)
            .padding(.bottom, 40.0)
            .shadow(radius: 5)
    
    }
}

struct ShowBackgroundImg: View {
    var body: some View {
        Image("Background")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
    }
}
//
//struct ShowUserNameTextField(username: String): View {
//    var body: some View {
//        TextField("userName", text: username)
//            .padding(.horizontal, 80)
//            .background(Image("userNameTextField"))
//
//    }
//}


struct ButtonContent: View{
    var body: some View{
        Text("< back")
    }
}

