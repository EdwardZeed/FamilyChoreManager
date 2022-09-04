//
//  NavigationBarView.swift
//  iosApp
//
//  Created by chris on 4/9/2022.
//  Copyright © 2022 orgName. All rights reserved.
//
import SwiftUI
import shared

struct NavigationBarView: View {

    var userName : String
    var childrenlist : [Child]
    var body: some View {
        TabView{
                   DashBoardPage(username: userName, childList: childrenlist, parentList: [])
                        .tabItem({
                            Image(systemName: "house")
                            Text("Family")
                        })
                    
                    ParentProfilePage(chores: [])
                        .tabItem({
                            Image(systemName: "person")
                            Text("Account")
                        })
                    
                    Text("PAGE THREE")
                        .tabItem({
                            Image(systemName: "gear")
                            Text("Setting")
                        })
                }

    }
}
