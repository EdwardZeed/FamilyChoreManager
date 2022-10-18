//
//  ChildDashboard.swift
//  iosApp
//
//  Created by chris on 5/9/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import Foundation
import SwiftUI
import shared

struct Preview_ChildDashBoardPage: PreviewProvider {

    static var previews: some View {

        var currentParent = Parent(userID: "0", name: "Chris", dateOfBirth: "2002/02/14", chooseTheme: Theme(name: "The Boys"), avatarPic: "Dragon")


//        var childList = [child3,child2,child1]
        var parentList = [currentParent]
        //ChildDashBoardPage(username: "Chris",children: childList, parents:  parentList)
    }
}


struct ChildDashBoardPage: View {
    //let username: String
    //var children: [Child]
    //var parents: [Parent]
    
    @State var goToChildProfilePage = false
    
    @State var currentSelectChild: Child = Child(userID: "-1", name: "", dateOfBirth: "", chooseTheme: Theme(name: ""), avatarPic: "")
    @EnvironmentObject var childAuthViewModel: ChildAuthViewModel
    @EnvironmentObject var contractViewModel: ContractViewModel

    
    
    var body: some View {
        
        
        NavigationView {
            ZStack{
                Image("Background").resizable().edgesIgnoringSafeArea(.all)
                    .opacity(0.2)
                
                ScrollView{
                    VStack{
                        
                        HStack{
                            
                            HStack{
                                UserPhoto()
                                Message_And_Name(username: String(childAuthViewModel.childSession.split(separator: " ")[0]))
                                
                            }.frame(width: UIScreen.main.bounds.width*0.85, alignment: .leading)
                                .padding(.top, 3)
                            
                        }
                        
                        VStack{
                            
                            //Spacer(minLength: 50)
                            Title_and_home_Page().frame(width: UIScreen.main.bounds.width*0.95,alignment: .leading)
                            ForEach(self.childAuthViewModel.children, id: \.self){child in

                                childCardforChild(child: child, currentContract: contractViewModel)


                            }
                            
                        }
                        
                    }
                }
                
            }.navigationBarHidden(true)
        }.navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .environmentObject(contractViewModel)
            .onAppear {
                contractViewModel.setParentID(parentID: String(childAuthViewModel.childSession.split(separator: " ")[1]))
                contractViewModel.getContractDetail(parentID: String(childAuthViewModel.childSession.split(separator: " ")[1]))
            }

    }
    
    
    struct childCardforChild: View{
        var child: Child
        var currentContract: ContractViewModel
        var contractResultDic: [String: Array<Int>] = [:]
        var result: [Int] = []
        @State var goToChildProfilePage = false
        
        
        @EnvironmentObject var authViewModel: AuthViewModel
        @EnvironmentObject var assignFinishChoresModel : AssignChoreModel
        @EnvironmentObject var childAuthViewModel: ChildAuthViewModel
        
        
        init(child: Child, currentContract: ContractViewModel){
            self.child = child
            self.currentContract = currentContract
            self.contractResultDic = currentContract.contractResultDic
            self.result = contractResultDic[child.userID] ?? [0]
        }
        
        
        var body: some View{
            HStack{
                Button(action: {
                    print("current select child ID: " + child.userID)
                    self.assignFinishChoresModel.fetFinishedChoresInChildVer(currentChildID: child.userID, currentparentID: String(self.childAuthViewModel.childSession.split(separator: " ")[1]))
                    goToChildProfilePage = true
                    
                }, label: {
                    Button_Label(currentChild: child ,contractResultDic: contractResultDic).foregroundColor(Color("AdaptiveColorForText"))
                }).frame(width: UIScreen.main.bounds.width*0.95, height: UIScreen.main.bounds.width*0.3)
                    .background(Color("AdaptiveColorForBackground"))
                    .cornerRadius(25)
                    .shadow(color: Color.gray, radius: 10)
                
                
                NavigationLink(destination: ChildAccountPage(selectedChild: child, result: removeZero(pointArray: result)), isActive: $goToChildProfilePage){
                    
                    EmptyView()
                }
                
            }
        }
        
    }
}
