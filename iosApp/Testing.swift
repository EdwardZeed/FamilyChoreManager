//
//  Testing.swift
//  iosApp
//
//  Created by Edward Zheng on 31/8/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import Combine
import SwiftUI
import shared

struct Testing: View {
    
    @State var text = ""
    @ObservedObject var user = User()
    @ObservedObject var userArray = UserArray()
    
    var body: some View {
        ScrollView{
            ForEach(userArray.array.indices, id: \.self) { index in
                TextField("type here", text: $userArray.array[index].username)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width*0.5,
                           height:UIScreen.main.bounds.height*0.05)
                    .border(.green)
                Text(userArray.array[index].username)
            }
        }
    }
}

struct Testing_Previews: PreviewProvider {
    static var previews: some View {
        Testing()
    }
}

class User: ObservableObject, Identifiable {
   
    @Published var username = ""
}

class UserArray: ObservableObject{
    @Published var array: [User] = []
    
    init(){
        @ObservedObject var user = User()
        array.append(user)
    }
    
}
