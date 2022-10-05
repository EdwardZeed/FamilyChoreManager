//
//  DashBoardViewModel.swift
//  iosApp
//
//  Created by Edward Zheng on 29/9/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import Foundation
import Firebase
import shared

class AddChildViewModel: ObservableObject{
    @Published var children = [Child]()
   
    @Published var parents = [Parent]()
    @Published var success = false
    
    @Published var nameValid: Float = 0
    @Published var dateValid: Float = 0
    let service = DashBoardService()
    
    init() {
        print("DEBUG: dashboard view model initializing")
        self.fetchChildren()
        
//        add listener to children collection
        self.service.listenChildren(viewModel: self)
    }
    
    func addChild(name: String, dateOfBirth: Date?, theme: String) {
        
        if !checkValid(name: name, date: dateOfBirth, theme: theme){
            return
        }
        
        service.addChild(name: name, dateOfBirth: dateOfBirth, theme: theme) { success, result in
            self.success = success
            if success {
                self.children = result
            }
            print("DEBUG: \(self.children)")
        }
        
    }
    
    func fetchChildren(){
        service.fetchChildren() { result in
            self.children = result
        }
    }
    
    func checkValid(name: String?, date: Date?, theme: String?) -> Bool{
        guard name != "" else{nameValid = 2; return false}
        guard date != nil else {dateValid = 2; return false}
        guard theme != nil else{return false}
        return true
    }
    
}
