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
    let service = DashBoardService()
    
    init() {
        print("DEBUG: dashboard view model initializing")
        self.fetchChildren()
    }
    
    func addChild(name: String, dateOfBirth: Date?, theme: String) {
        
        service.addChild(name: name, dateOfBirth: dateOfBirth, theme: theme) { success, result in
            self.success = success
            if success {
                self.children = result
            }
            print("DEBUG: \(self.children)")
        }
        
    }
    
    func fetchChildren(){
        service.fetchChildren { result in
            self.children = result
        }
    }
    
}
