//
//  AddChildViewModelForChild.swift
//  iosApp
//
//  Created by chris on 7/10/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import Foundation
import Firebase
import shared

class ChildAuthViewModel: ObservableObject{
    @Published var children = [Child]()
    @Published var success = false
    
    @Published var userID: String
    let service = ChildrenDashBoardService()
    
    
    
    init() {
        print("DEBUG: dashboard view model initializing")
        self.fetchChildren()
        
        //add listener to children collection
        self.service.listenChildren(viewModel: self, currentUserID: userID)
    }
    
    func fetchChildren(){
        service.fetchChildren(currentUserID: userID) { result in
            self.children = result
        }
    }
    
    
    
    
}
