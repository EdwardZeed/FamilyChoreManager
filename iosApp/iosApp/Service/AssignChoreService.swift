//
//  AssignChoreService.swift
//  iosApp
//
//  Created by chris on 18/10/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage
import shared
import Kingfisher

struct AssignChoreService{
    
    func AssignChore(currentChildID: String, choreName: String, imageStringData: String , point: Int, completion: @escaping (Bool, [FinishedChore]) -> Void){
        
        //        let fileName = UUID().uuidString
        //        let path = "choreImages/\(fileName).jpg"
        //        let ref = Storage.storage().reference().child(path)
        let uid = Auth.auth().currentUser?.uid
        let dummyDate = "fake date"
        
        let assignChoreDocument = Firestore.firestore().collection("users").document(uid!).collection("children").document(currentChildID).collection("finishedChore")
        
        let newAssignedChoreData = ["name": choreName, "childID": currentChildID, "choreImg": imageStringData, "point":point, "finishedDate": dummyDate] as [String : Any]
        
        Firestore.firestore().collection("users").document(uid!).collection("children").document(currentChildID).collection("finishedChore").addDocument(data: newAssignedChoreData){ error in
            if let error = error {
                print("DEBUG: Assign finished Chore Failed \(error.localizedDescription)")
                self.fetchAssignedChores(currentChildID: currentChildID) { result in
                    completion(false, result)
                }
                
                return
            }
            else{
                print("successfully assign finished chore tp this child")
                self.fetchAssignedChores(currentChildID: currentChildID) { result in
                    completion(true, result)
                }
                return
            }
            
        }
    }
    
    
    func fetchAssignedChores(currentChildID: String, compeltion: @escaping([FinishedChore]) -> Void) {
        var finishedChoreResult = [FinishedChore]()
        
        let uid = Auth.auth().currentUser?.uid
        
        Firestore.firestore().collection("users").document(uid!).collection("children").document(currentChildID).collection("finishedChore").getDocuments { snapshot, error in
            if let error = error{
                print("DEBUG: failed to fetch finished chores. \(error.localizedDescription)")
                return
            }
            print("DEBUG: fetching finished chores")
            snapshot?.documents.forEach({ doc in
                let choreName = doc["name"] as? String ?? ""
                let childId = doc["childID"] as? String ?? ""
                let point = doc["point"] as? Int ?? 0
                let choreImgString = doc["choreImg"] as? String ?? ""
                
                let singleFinishChore = FinishedChore(choreID: doc.documentID , name: choreName, finishedDate: "fake date", point: Int32(point), choreImg: choreImgString)

                finishedChoreResult.append(singleFinishChore)
            })
            compeltion(finishedChoreResult)
            
        }
    }
    
    func fetchAssignedChoresInChildVer(currentParentID: String, currentChildID: String, compeltion: @escaping([FinishedChore]) -> Void){
        var finishedChoreResult = [FinishedChore]()
        
        Firestore.firestore().collection("users").document(currentParentID).collection("children").document(currentChildID).collection("finishedChore").getDocuments { snapshot, error in
            if let error = error{
                print("DEBUG: failed to fetch finished chores. \(error.localizedDescription)")
                return
            }
            print("DEBUG: fetching finished chores")
            snapshot?.documents.forEach({ doc in
                let choreName = doc["name"] as? String ?? ""
                let childId = doc["childID"] as? String ?? ""
                let point = doc["point"] as? Int ?? 0
                let choreImgString = doc["choreImg"] as? String ?? ""
                
                let singleFinishChore = FinishedChore(choreID: doc.documentID , name: choreName, finishedDate: "fake date", point: Int32(point), choreImg: choreImgString)

                finishedChoreResult.append(singleFinishChore)
            })
            compeltion(finishedChoreResult)
            
        }
        
        
    }
    
}
