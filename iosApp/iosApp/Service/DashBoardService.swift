//
//  DashBoardService.swift
//  iosApp
//
//  Created by Edward Zheng on 3/10/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import Foundation
import Firebase
import shared

struct DashBoardService{
    
    func addChild(name: String, dateOfBirth: Date?, theme: String, completion: @escaping (Bool, [Child]) -> Void){
        let uid = Auth.auth().currentUser?.uid
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YYYY"
        let birthday = dateFormatter.string(from: dateOfBirth!)
        
        let data = ["name": name, "dateOfBirth": birthday, "theme": theme, "parentId": uid]
        
        
        Firestore.firestore().collection("users").document(uid!).collection("children").addDocument(data: data as [String : Any]){ error in
            if let error = error {
                print("DEBUG: add child failed \(error.localizedDescription)")
                self.fetchChildren { result in
                    completion(false, result)
                }

                return
            }
            else{
                print("DEBUG: added child")
                self.fetchChildren { result in
                    completion(true, result)
                }
                return
            }
        }
        
        
        
    }
    
    func fetchChildren(compeltion: @escaping([Child]) -> Void) {
        var result = [Child]()
        
        let uid = Auth.auth().currentUser?.uid
        
        Firestore.firestore().collection("users").document(uid!).collection("children").getDocuments { snapshot, error in
            if let error = error{
                print("DEBUG: failed to fetch children. \(error.localizedDescription)")
                return
            }
            print("DEBUG: fetching children")
            snapshot?.documents.forEach({ doc in
                let parentId = doc["parentId"] as? String ?? ""
                let name = doc["name"] as? String ?? ""
                let dateOfBirth = doc["dateOfBirth"] as? String ?? ""
                let theme = Theme(name: doc["theme"] as? String ?? "")
                
                let child = Child(userID: doc.documentID, name: name, dateOfBirth: dateOfBirth, chooseTheme: theme, avatarPic: "")
                result.append(child)
                
                
            })
            compeltion(result)
        }
        
        
        
    }
    
    func listenChildren(viewModel: AddChildViewModel){
        let uid = Auth.auth().currentUser?.uid
        
        Firestore.firestore().collection("users").document(uid!).collection("children").addSnapshotListener { snapshot, error in
            guard let snapshot = snapshot else {return}
            if let error = error {
                print("DEBUG: failed to fetch children. \(error.localizedDescription)")
            }
            let uid = Auth.auth().currentUser?.uid
            snapshot.documentChanges.forEach { changes in
                if changes.type == .added {
                    print("DEBUG: detected child added")
                    viewModel.fetchChildren()
                }
                if changes.type == .removed {
                    viewModel.fetchChildren()
                }
            }
        }
    }
    
}
