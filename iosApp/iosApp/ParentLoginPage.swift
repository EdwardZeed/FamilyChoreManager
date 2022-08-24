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
    
    func goToHomeSecond(){
            if let window = UIApplication.shared.windows.first
            {
                window.rootViewController = UIHostingController(rootView: ChildLoginPage())
                window.makeKeyAndVisible()
            }
        }
    
    
    var body: some View {
    

       
        ZStack {
            Image("Background").resizable().scaledToFill().ignoresSafeArea().opacity(0.2)
            
            
                Button(action: goToHomeSecond, label: {
                                      Image("QrCodeScan")
                                   })
               

//                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .topTrailing)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/4/*@END_MENU_TOKEN@*/)
                .position(x: UIScreen.main.bounds.width*0.9,y:UIScreen.main.bounds.height*0.05)
                .zIndex(100)
               
                .ignoresSafeArea()
                
                

            
            
            VStack {
                
                ZStack{
                    Image("QrCodeScan")
                        
                    
                    Image("photoframe")
                        .frame(alignment: .center)
                        
                    
                    Image("userPhoto")
                        .frame(alignment: .center)
                }
                Text("\t\t   Welcome back!\n"+"If you dont have account, Sign up")
                    .fontWeight(.thin)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, UIScreen.main.bounds.height*0.05)
                
              
                    
        

                CustomizedTextField(inputStream: $userName, label: "Name: ",placeholder: "Email Address")
                    .padding(.bottom, UIScreen.main.bounds.height*0.04)
                
                CustomizedSecureField(inputStream: $password, label: "Password: ", placeholder: "Password")
                    .padding(.bottom,UIScreen.main.bounds.height*0.02)
                
                
                Text("Forgot your password?")
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundColor(Color.blue)
                    .padding(.bottom, UIScreen.main.bounds.height*0.05)
                
                
                Image("LoginBtn")
                    .padding(.bottom, UIScreen.main.bounds.height*0.03)
                
                Image("separateLine")
                    .padding(.bottom, UIScreen.main.bounds.height*0.03)
                
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

