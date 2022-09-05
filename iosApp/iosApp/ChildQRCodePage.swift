//
//  ChildQRCodePage.swift
//  iosApp
//
//  Created by chris on 5/9/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI
import shared

var child10 = Child(userID: 1, name: "Linda", dateOfBirth: "2012/02/14", chooseTheme: Theme(name: "Disney"), avatarPic: "Poly")

var child11 = Child(userID: 2, name: "Anna", dateOfBirth: "2012/03/14", chooseTheme: Theme(name: "Marvel"), avatarPic: "IronMan")

var child12 = Child(userID: 3, name: "Bulankin", dateOfBirth: "2012/05/14", chooseTheme: Theme(name: "T-34"), avatarPic: "PP_50")



struct ChildQRCodePage: View {
    var child : Child
    @State var goToChildDashboard = false
    
    var body: some View {
        ZStack{
            Image("Background").resizable().edgesIgnoringSafeArea(.all)
                .opacity(0.2)
            VStack{
                Image("QRCodeView")
                Button(action: {goToChildDashboard = true}, label: {Text("Please scan the QR code using " + child.name + " device")})
                
            }
        }
        var li = [child10, child12, child11]
        NavigationLink(destination: ChildNavigationBarView(username: child.name,childList: li).ignoresSafeArea(), isActive: $goToChildDashboard){
            EmptyView()
        }.navigationBarHidden(true)
    }
   
   
    
    
    
}

struct ChildQRCodePage_Previews: PreviewProvider {
    static var previews: some View {
        ChildQRCodePage(child: Child(userID: 0, name: "Chris", dateOfBirth: "1234/05/06", chooseTheme: Theme(name: "Devil May Cry"), avatarPic: "Nero"))
        
    }
}
