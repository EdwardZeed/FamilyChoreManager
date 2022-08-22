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
    @State var re_password = ""
    
    var body: some View {
        
            
//            read parent view's size
        GeometryReader { proxy in
            VStack {
                Spacer()
//                    name input field
                VStack{
                    Text("Name:")
                        .font(.title)
                        .fontWeight(.regular)
                        .frame(width: proxy.size.width*0.75, alignment: .leading)
                        .padding(.bottom, -1)

                        
                    Image("Textfield")
                        .overlay(Image("usersign").frame(width: proxy.size.width*0.70, alignment: .leading))
                        .overlay(TextField("name", text: $name).frame(width: proxy.size.width*0.45))
                        .frame(width:proxy.size.width, alignment: .center)
                }

//                    email input field
                VStack{
                    Text("Email:")
                        .font(.title)
                        .fontWeight(.regular)
                        .frame(width: proxy.size.width*0.75, alignment: .leading)
                        .padding(.bottom, -1)
                        
                    Image("Textfield")
                        .overlay(Image("atsign").frame(width: proxy.size.width*0.70, alignment: .leading))
                        .overlay(TextField("email", text: $email).frame(width: proxy.size.width*0.45))
                        .frame(width:proxy.size.width, alignment: .center)
                        
                }
                
//                    password input field
                VStack{
                    Text("Password:")
                        .font(.title)
                        .fontWeight(.regular)
                        .frame(width: proxy.size.width*0.75, alignment: .leading)
                        .padding(.bottom, -1)
                        
                        
                    Image("Textfield")
                        .overlay(Image("locksign").frame(width: proxy.size.width*0.70, alignment: .leading))
                        .overlay(SecureField("password", text: $password).frame(width: proxy.size.width*0.45))
                        .frame(width:proxy.size.width, alignment: .center)
                
                }
                
//                    confirm password input field
                VStack{
                    Text("Confirm password:")
                        .font(.title)
                        .fontWeight(.regular)
                        .frame(width: proxy.size.width*0.75, alignment: .leading)
                        .padding(.bottom, -1)
                        
                    Image("Textfield")
                        .overlay(Image("locksign").frame(width: proxy.size.width*0.70, alignment: .leading))
                        .overlay(SecureField("password", text: $re_password)
                            .frame(width: proxy.size.width*0.45))
                        .frame(width:proxy.size.width, alignment: .center)
                }
                
//                Spacer()
                
                Button(action: {}, label: {
                    Image("signUpBtn")
                })
                .padding(.top, 20)
                
                Spacer()
                
            }
            
        }
        .background(Image("Background")
        .resizable()
        .scaledToFill()
        .ignoresSafeArea())
//        .navigationTitle("")
//        .navigationBarHidden(true)
//        .navigationBarBackButtonHidden(true)
        
        
        
            
            
            
        
    }
}

struct SignUpPage_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPage()
    }
}
