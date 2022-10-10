//
//  CheckContract.swift
//  iosApp
//
//  Created by Frank Shi on 4/10/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import Foundation


func checkMaxpoint(maxPoint: String) -> Int{
    if(maxPoint == ""){
        return 0
    }
    if(Int(maxPoint) ?? 0 > 1000){
        return 0
    }
    return 1
}

func checkRewardarrayLength(rewardArray: Array<String>) -> Int{
    for reward in rewardArray{
        if(reward != ""){
            return 1
        }
    }
    return 0
}

func checkPointarray(pointArray: Array<Int>) -> Int{
    for point in pointArray{
        if(point != 0){
            return 1
        }
    }
    return 0
}

func checkPointSequnece(pointArray: Array<Int>) -> Int{
    var returnvalue = 1
    var j = pointArray.count - 1
    var handlePointArray = pointArray
    while (j>=0){
        if(pointArray[j] == 0){
            handlePointArray.remove(at: j)
        }
        j = j - 1
    }
    
    
    
    var i = 1
    var n = handlePointArray.count
    while(i < n){
        print("Debug: n", n)
        if(n == 1){
            break
        }else{
            print("Debug: n", n)
            print("Debug: ",handlePointArray[i - 1], " ", handlePointArray[i])
            if(handlePointArray[i - 1] >= handlePointArray[i]){
                return 0
            }
        }
        i = i + 1
    }
    
    return returnvalue
}

func checkCorrespond(rewardArray: Array<String>, pointArray: Array<Int>) -> Int{
    var returnvalue = 0
    if(rewardArray.count != pointArray.count){
        return -4
    }else{
        var i = 0, n = rewardArray.count - 1
        while (i <= n) {
            if(rewardArray[i] != "" && pointArray[i] != 0){
                returnvalue = 1
            }
            else if((rewardArray[i] != "" && pointArray[i] == 0) || (rewardArray[i] == "" && pointArray[i] != 0)){
                returnvalue = 0
            }
            print("Debug: value in loop: ", returnvalue)
           i = i + 1
        }
        
        return returnvalue
    }
}


func checkMaxpointMatch(pointArray: Array<Int>, maxpoint: Int) -> Int{
    if (pointArray[pointArray.count - 1] != maxpoint){
        return -5
    }
    return 1
}

class errormessagehandler: ObservableObject {
    @Published var message = ""
}