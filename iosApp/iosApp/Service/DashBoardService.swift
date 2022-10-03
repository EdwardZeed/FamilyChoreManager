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
        
        
        Firestore.firestore().collection("children").addDocument(data: data as [String : Any]){ error in
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
        
        Firestore.firestore().collection("children").getDocuments { snapshot, error in
            if let error = error{
                print("DEBUG: failed to fetch children. \(error.localizedDescription)")
            }
            print("DEBUG: fetching children")
            snapshot?.documents.forEach({ doc in
                let parentId = doc["parentId"] as? String ?? ""
                if parentId == uid{
                    let name = doc["name"] as? String ?? ""
                    let dateOfBirth = doc["dateOfBirth"] as? String ?? ""
                    let theme = Theme(name: doc["theme"] as? String ?? "")
                    print("DEBUG: child name: \(name)")
                    
                    let child = Child(userID: doc.documentID, name: name, dateOfBirth: dateOfBirth, chooseTheme: theme, avatarPic: "")
                    result.append(child)
                }
                
            })
            compeltion(result)
        }
    }
}
