//
//  Testing.swift
//  iosApp
//
//  Created by Edward Zheng on 31/8/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI

struct Testing: View {
    
    
    @ObservedObject var r = R()
//    var array: [R] = [r]
    
    @State var text = ""
    
    var body: some View {
        VStack{
//            TextField("Type here", text: $rs.array[0].name)
//                .padding()
//                .border(Color.black, width: 3)
////                .onChange(of: rs.array[0].$name){ text in
////                    self.rs.changeName(index: 0, name: $text)
////
////                }
            
//            ForEach(rs.array){ r in
//                VStack {
//                    Text(r.name)
//                }
//            }
            
            TextField("Type here", text: $text)
                .padding()
                .border(Color.black, width: 3)
            
            Text(text)
            
            
                
            
        }
    }
}

struct Testing_Previews: PreviewProvider {
    static var previews: some View {
        Testing()
    }
}

class R: ObservableObject{
    
//    let id: String = UUID().uuidString
    @Published var name: String
    init(){
        self.name = " "
    }
    
}

//class RS: ObservableObject{
//    @Published var array: [R] = []
//
//    init() {
//        array.append(R(name: "PS5"))
//        array.append(R(name: "PC"))
//    }
//
//    func changeName(index: Int, name: String){
//        array[index].name = name
//    }
//
//}

