//
//  ContractViewModel.swift
//  iosApp
//
//  Created by Frank Shi on 5/10/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import Foundation
import Firebase
import shared

class ContractViewModel: ObservableObject{
    @Published var checkSuccessAdded = false
    
    func getContractDetail(childID: String){
        let contract = Firestore.firestore().collection("contract")
        contract.whereField("ChildID", isEqualTo: childID)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Debug: Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("Debug: \(document.documentID) => \(document.data())")
                    }
                }
            }
        
    }
}
