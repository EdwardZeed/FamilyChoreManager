//
//  ChildNavigationBarView.swift
//  iosApp
//
//  Created by chris on 5/9/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI
import shared

struct ChildNavigationBarView: View {

//    var childrenlist = [Child]()
//    var currentChildID  = ""
    var currentChild = Child(userID: "", name: "", dateOfBirth: "", chooseTheme: Theme(name: ""), avatarPic: "")
    var result: [Int] = []
    var contractResultDic: [String: Array<Int>] = [:]
    
    @EnvironmentObject var childAuthViewModel: ChildAuthViewModel
    @EnvironmentObject var contractViewModel: ContractViewModel
    
    

    @State private var selection: Tab = .exclusion

        enum Tab {
            case dashboard
            case currentChildUser
            case childProfile
            case exclusion

        }
    
//    init(childList: [Child], currentChildID: String){
//
//        self.childrenlist = childList
//        print(self.childrenlist.count)
//        //self.currentChild = Child(userID: "", name: "", dateOfBirth: "", chooseTheme: Theme(name: ""), avatarPic: "")
//
//
//        for child in self.childrenlist{
//            print("in")
//            if child.userID == String(currentChildID){
//                print("find the target")
//                self.result = contractResultDic[child.userID] ?? [0]
//                self.currentChild = Child(userID: child.userID, name: child.name, dateOfBirth: child.dateOfBirth, chooseTheme: child.chooseTheme, avatarPic: "")
//                break;
//            }
//        }
//
//    }
    
    var body: some View {
            NavigationView { //整体设置，下级页面不会在出现底部tabbar
                TabView(selection: $selection) {
                        //ChildDashBoardPage(username: userName, children: childrenlist, parents: [])
                        ChildDashBoardPage()
                            .tabItem{//使用label 创建tabitem图文
                                Label("Family", systemImage: "house")
                            }
                            .tag(Tab.dashboard)
                    
                        
                    ChildAccountPage(result: removeZero(pointArray: result))
                            .tabItem{//使用label 创建tabitem图文
                                Label("Account", systemImage: "person")
                            }
                            .tag(Tab.currentChildUser)
                       
                    
                }
                .accentColor(.blue) //设置文字默认选中颜色
            }.navigationBarHidden(true)
            .onAppear {
                print("DEBUG: child \(self.childAuthViewModel.currentChild)")
            }

            
    }
}
