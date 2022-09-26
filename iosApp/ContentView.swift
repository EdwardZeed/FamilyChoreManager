//
//  Testing.swift
//  iosApp
//
//  Created by Edward Zheng on 31/8/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI
import shared
import AuthenticationServices


struct ContentView: View{
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View{
        if authViewModel.userSession == nil{
            ParentLoginPage()
                .overlay(
                    ProgressSpinner()
                )
        }
        else{
            NavigationBarView(childList: [])

        }
    }
}
