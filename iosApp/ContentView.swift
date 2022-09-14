//
//  Testing.swift
//  iosApp
//
//  Created by Edward Zheng on 31/8/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import Combine
import SwiftUI
import shared

struct ContentView: View{
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View{
        if authViewModel.userSession == nil{
            ParentLoginPage()
        }
        else{
            NavigationBarView(username: "edwardhimself", childList: [])
        }
    }
}
