//
//  AddChorePage.swift
//  iosApp
//
//  Created by Frank Shi on 4/9/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import Foundation
import Foundation
import SwiftUI
import shared
import UIKit

struct Preview_AddChorePage: PreviewProvider {
    
    static var previews: some View {
        AddChorePage(choreName: "")
    }
}


struct AddChorePage: View {
    @State var choreName: String = ""
    var body: some View {
        
        GeometryReader{ geo in
            Image("Background").resizable()
                .ignoresSafeArea()
                .opacity(0.2)
                
            
            ScrollView {
                VStack{
                    HStack{
                        Image("AddChoreIcon")
                            .frame(width: UIScreen.main.bounds.width*0.3,alignment: .leading)
                        
                        Text("Add chore")
                            .fontWeight(.heavy)
                            .frame(width: UIScreen.main.bounds.width*0.6,alignment: .leading)
                        
                    }
                    
                    VStack{
                        HStack{
                            Image("laundry-machineIcon")
                            Text("Name: ")
                                .fontWeight(.thin)
                        }.frame(width: UIScreen.main.bounds.width*0.9,alignment: .leading)
                        TextField("  name", text: $choreName)
                            .frame(width: UIScreen.main.bounds.width*0.9,
                                   height:UIScreen.main.bounds.height*0.05,alignment: .leading)
                            .border(Color.gray, width: 2)
                            .cornerRadius(6)
                        
                        
                    }.frame(height: UIScreen.main.bounds.height*0.2)
                    VStack{
                        HStack{
                            Image("ChorseIconSelectionIcon")
                            Text("Add chore")
                                .fontWeight(.thin)
                            
                        }.frame(width: UIScreen.main.bounds.width*0.9,alignment: .leading)
                        
                        Image("Rectangle 44")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200, alignment: .center)
                    }
                    
                    Button(action: {
                        
                        
                        //            var con = ContractCreator()
                        //            var result = con.rewardList[0].name
                        //            print("This is result:" + result)
                        
                        
                        
                    }, label: {
                        Text("ADD CHORE")
                            .fontWeight(.bold)
                            .frame(width: UIScreen.main.bounds.width*0.8, height:50)
                            .background(Color.blue.opacity(0.7))
                            .foregroundColor(Color.white)
                            .cornerRadius(8)
                    })
                }.frame(width: UIScreen.main.bounds.width)
            }.frame(width: UIScreen.main.bounds.width, alignment: .center)
            
        }
        
        
        
    }
}


