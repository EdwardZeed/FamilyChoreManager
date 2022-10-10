//
//  UploadChore.swift
//  iosApp
//
//  Created by Frank Shi on 11/10/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import Foundation
import Firebase
import shared

struct UploadChore{
    func addChore(choreName: String, chorePic: String){
        
        let data = ["Name": choreName, "Picture": chorePic]
        
        let chore = Firestore.firestore().collection("chore")

        chore.addDocument(data: data as [String : Any]){ error in
            if let error = error {
                print("DEBUG: add chorefailed \(error.localizedDescription)")
                return
            }
            else{
                print("DEBUG: added chore")
                return
            }
        }
    }
}
