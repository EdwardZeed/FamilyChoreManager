//
//  ChildQRCodePage.swift
//  iosApp
//
//  Created by chris on 5/9/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI
import shared



struct ChildQRCodePage: View {
    var child : Child
    
    var body: some View {
        ZStack{
            Image("Background").resizable().edgesIgnoringSafeArea(.all)
                .opacity(0.2)
            VStack{
                Image("QRCodeView")
                Text("Please scan the QR code using " + child.name + " device")
                
            }
        }
       
    }
   
   
    
    
    
}

struct ChildQRCodePage_Previews: PreviewProvider {
    static var previews: some View {
        ChildQRCodePage(child: Child(userID: 0, name: "Chris", dateOfBirth: "1234/05/06", chooseTheme: Theme(name: "Devil May Cry"), avatarPic: "Nero"))
        
    }
}
