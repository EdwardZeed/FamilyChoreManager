//
//  childLoginPage.swift
//  onTaskArchiever
//
//  Created by chris on 22/8/2022.
//

import SwiftUI
import shared

var child100 = Child(userID: 1, name: "Linda", dateOfBirth: "2012/02/14", chooseTheme: Theme(name: "Disney"), avatarPic: "Poly")

var child101 = Child(userID: 2, name: "Anna", dateOfBirth: "2012/03/14", chooseTheme: Theme(name: "Marvel"), avatarPic: "IronMan")

var child102 = Child(userID: 3, name: "Bulankin", dateOfBirth: "2012/05/14", chooseTheme: Theme(name: "T-34"), avatarPic: "PP_50")


struct ChildLoginPage: View {
    var child : Child
    var body: some View {
       ShowQRCode(currentChild: child)
    }
}



struct ChildLoginPage_Previews: PreviewProvider {
    static var previews: some View {
        ChildLoginPage(child: Child(userID: 999, name: "dinasour", dateOfBirth: "1000century", chooseTheme: Theme(name: "rocket"), avatarPic: "Dinasour"))
    }
}

struct ShowQRCode: View {
    @State var goToChildDashboard = false
    var currentChild : Child
    var body: some View{
        ZStack{
            Image("Background").resizable().scaledToFill().ignoresSafeArea().opacity(0.2)
            VStack{
                Image("QRCodeView")
                Button(action: {goToChildDashboard = true}, label: {Text("Please scan the QR code using " + currentChild.name + " device")})

                var li = [child100, child101, child102]
                NavigationLink(destination: ChildNavigationBarView(username: currentChild.name,childList: li).ignoresSafeArea(), isActive: $goToChildDashboard){
                    EmptyView()
                }.navigationBarHidden(true)
            
        
            }
        }
    }
}

