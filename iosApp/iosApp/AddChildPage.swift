//
//  AddChildPage.swift
//  iosApp
//
//  Created by Edward Zheng on 1/9/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI

struct AddChildPage: View {
    @State var childName = ""
    @State var dateOfBirth: Date?
    @State var valid: Float = 0
    @State var textFieldHeight: CGFloat = 0
    @State var theme = ""
    var themes: [String] = ["default", "basketball"]
    
    var body: some View {
        ZStack {
            Image("Background").resizable()
                .ignoresSafeArea()
                .opacity(0.2)
            
            VStack{
                
                Image("AddUserIcon")
                    .padding(.top, UIScreen.main.bounds.height*0.05)
                    .padding(.bottom, UIScreen.main.bounds.height*0.1)
                EntryField(textValue: $childName, icon: Image("userIcon"), placeholder: "child name", prompt: "", validation: $valid, isPassword: false)
                    .overlay(GeometryReader{
                        proxy -> AnyView in
                        DispatchQueue.main.async {
                            textFieldHeight = proxy.size.height
                        }
                        return AnyView(EmptyView())
                        
                    })
                HStack {
                    Image("dateIcon")
                    DatePickerTextField(placeholder: "date of birth", date: $dateOfBirth)
                    
                }
                .padding(8)
                .background(Color(UIColor.secondarySystemBackground))
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                .frame(width: UIScreen.main.bounds.width*0.8,height: textFieldHeight, alignment: .leading)
                
                
                
                HStack {
                    Picker(selection: $theme, content: {
                        ForEach(themes, id: \.self){
                            theme in
                            Text(theme)
                            
                        }
                    }, label: {
                        Text("Choose a theme")
                    })
                    
                }
                .frame(width: UIScreen.main.bounds.width*0.8,height: textFieldHeight, alignment: .center)
                .background(Color(UIColor.secondarySystemBackground))
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                
                
                Button {
                    
                } label: {
                    Text("Add child")
                        .font(.title)
                        .frame(width: UIScreen.main.bounds.width*0.8,height: textFieldHeight, alignment: .center)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
                
                Spacer(minLength: UIScreen.main.bounds.width*0.3)
        
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
        
    }
}

struct AddChildPage_Previews: PreviewProvider {
    static var previews: some View {
        AddChildPage()
    }
}
