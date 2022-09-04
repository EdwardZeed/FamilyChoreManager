//
//  RewardCreater.swift
//  iosApp
//
//  Created by Frank Shi on 1/9/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import Foundation
import shared

import SwiftUI

struct RewardCreater: Identifiable{
    //init with UUID
    var id = UUID()
    @State var name: String
    @State var point: String
    
    
//    func Add_To_List(reward: RewardCreategdggr) -> [RewardCreater]{
//        rewardList.append(reward)
//        return rewardList
//    }
}


class ContractCreater: ObservableObject{
    @Published var maxpoint: String
    @Published var description: String
    @Published var rewardArray: [RewardCreater] = []
    
    public init(){
        self.maxpoint = "0"
        self.description = "Null"
        var reward1 = RewardCreater(name: "", point: "")
        var reward2 = RewardCreater(name: "", point: "")
        var reward3 = RewardCreater(name: "", point: "")
        self.rewardArray.append(reward1)
        self.rewardArray.append(reward2)
        self.rewardArray.append(reward3)
    }
    
    func append_new_reward(newReward: RewardCreater){
        rewardArray.append(newReward)
    }
}
