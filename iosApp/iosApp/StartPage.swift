//
//  StartPage.swift
//  onTaskArchiever
//
//  Created by chris on 22/8/2022.
//

import SwiftUI

struct StartPage: View {
    var body: some View {
        ParentChildButton()
    }
}

struct StartPage_Previews: PreviewProvider {
    static var previews: some View {
        StartPage()

    
    }
}


struct ParentChildButton: View{
    var body: some View{
        
        NavigationView{
            
            ZStack {
                Image("Background").resizable().scaledToFill().ignoresSafeArea()
                
                VStack {
                Spacer()
                NavigationLink(destination: ParentLoginPage()){
                
                        Image("ParentsButton")
                        .padding(.bottom, -80.0)

                    
                }

                
                Spacer()
                    NavigationLink(destination: ChildLoginPage()){
                    
                        Image("ChildButton")
                        .padding(.bottom, 10.0)
                      
                    
                }
              
                Spacer()
                }
            }
    }
    }
}

