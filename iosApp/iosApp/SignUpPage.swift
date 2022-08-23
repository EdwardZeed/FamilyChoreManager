//
//  SignUpPage.swift
//  iosApp
//
//  Created by Edward Zheng on 22/8/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI

struct SignUpPage: View {
    @State var name = ""
    @State var email = ""
    @State var password = ""
    @State var dateOfBirth = ""
    
    var body: some View {
        ZStack{
            Image("Background").resizable().scaledToFill().ignoresSafeArea().opacity(0.2)
            
            VStack{
                
                Text("Let's Get Started")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Create account with On Task Achievers")
                    .font(.caption2)
                    .fontWeight(.thin)
                    .padding(.bottom)
                
                
                CustomizedTextField(inputStream: $email, label: "Email: ", placeholder: "email")
                
                CustomizedTextField(inputStream: $password, label: "Password: ", placeholder: "password")
                
                CustomizedTextField(inputStream: $name, label: "Name: ", placeholder: "name")
               
                CustomizedTextField(inputStream: $dateOfBirth, label: "Date of birth: ", placeholder: "date")
                
                
                HStack {
                    Text("Have an account? ")
                        .font(.footnote)
                        .fontWeight(.thin)
                    
                    Button(action: {}, label: {
                        Text("Login")
                            .font(.footnote)
                            .fontWeight(.thin)
                    })
                }
                .frame(width: UIScreen.main.bounds.width*0.8, alignment: .leading)
                
                
                Button(action: {}, label: {
                    Image("signUpBtn")
                })
                .frame(width: UIScreen.main.bounds.width*0.8)
                .cornerRadius(8)
                
                
                Image("separateLine")
                
                
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
            
    }
}

struct SignUpPage_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPage()
    }
}

