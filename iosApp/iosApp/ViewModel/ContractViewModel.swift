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
    var childID: String
    @Published var checkSuccessAdded = false
    @Published var maxpoint = 0
    @Published var totalCheckpoint = 0
    init(childID: String){
        self.childID = childID
//        self.getResult()
    }
    
    
    func getContractDetail(completion: @escaping (Array<Int>) -> Void){
        var result = [0]
        let contract = Firestore.firestore().collection("contract")
        contract.whereField("ChildID", isEqualTo: childID)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Debug: Error getting documents: \(err)")
                    completion([])
                } else {
                    for document in querySnapshot!.documents {
                        result = document["PointArray"]as? Array<Int> ?? [0]
                        print("Debug: in loop ",result)
                        completion(result)
                    }
                }
            }
        
    }
    
    func getResult(completion: @escaping (Bool) -> Void){
        
        self.getContractDetail() {result in

            if(result.count >= 1){
                self.maxpoint = result[result.count - 1]
                self.totalCheckpoint = result.count
                print("DEBUG: maxpoint \(self.maxpoint)")
                completion(true)
            }else{
                
                self.maxpoint = 0
                
                self.totalCheckpoint = 0
                completion(false)
            }
        }
    }
}
