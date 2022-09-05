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
    
    @State private var selection: Tab = .exclusion

        enum Tab {
            case dashboard
            case currentUser
            case childProfile
            case exclusion

        }
    
    init(username: String, childList: [Child]){
        self.userName = username
        self.childrenlist = childList

    }
    
    var body: some View {
            NavigationView { //整体设置，下级页面不会在出现底部tabbar
                TabView(selection: $selection) {
                    DashBoardPage(username: userName, children: childrenlist, parents: [])
                         .tabItem{//使用label 创建tabitem图文
                             Label("Family", systemImage: "house")
                         }
                         .tag(Tab.dashboard)

                    ParentProfilePage(chores: [])
                        .tabItem{
                            Label("Account", systemImage: "person")
                        }
                        .tag(Tab.currentUser)
    

                  
                     
                }
                .accentColor(.blue) //设置文字默认选中颜色
            }.navigationBarHidden(true)

            
    }
}
