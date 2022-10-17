//
//  UserService.swift
//  iosApp
//
//  Created by Edward Zheng on 19/9/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import shared

class UserService: ObservableObject{
    
    func fetchUser(uid: String, completion: @escaping (Parent?) -> Void){
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, error in
                if let error = error{
                    print("DEBUG: fetch user information failed, \(error.localizedDescription)")
                    return
                }
                guard let snapshot = snapshot else{completion(nil) ;return}
                
                guard let data = snapshot.data() else {completion(nil); return}
                print("DEBUG: in service \(data)")
                
                let userId: String = data["userId"] as! String
                let name: String = data["name"] as! String
                let dateOfBirth: String = data["dateOfBirth"] as? String ?? "no date of birth recorded"
                let currentUser = Parent(userID: userId, name: name, dateOfBirth: dateOfBirth, chooseTheme: nil, avatarPic: nil)
                
                completion(currentUser)
            }
    }
}


