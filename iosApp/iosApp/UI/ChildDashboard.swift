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
                                //Message_And_Name(username: username)
                                Message_And_Name(username: String(childAuthViewModel.childSession.split(separator: " ")[0]))
                                
                            }.frame(width: UIScreen.main.bounds.width*0.85, alignment: .leading)
                                .padding(.top, 3)
                            
                        }
                        
                        VStack{
                            
                            //Spacer(minLength: 50)
                            Title_and_home_Page().frame(width: UIScreen.main.bounds.width*0.95,alignment: .leading)
                            ForEach(self.childAuthViewModel.children, id: \.self){child in
                                childCard(child: child, currentContract: contractViewModel)
                            }
                            
//                            LazyVStack{
//                                ForEach(children,id:\.self){child in
//                                    HStack{
//                                        Button(action: {
//                                            goToChildProfilePage = true
//                                            currentSelectChild = child
//
//                                        }, label: {
//                                            Button_Label(currentChild: child)
//                                        }).frame(width: UIScreen.main.bounds.width*0.95, height: UIScreen.main.bounds.width*0.3)
//                                            .background(Color.white)
//                                            .cornerRadius(25)
//                                            .shadow(color: Color.gray, radius: 10)
//
//
//
//                                    }
//                                }
//
//
//                            }
                            NavigationLink(destination: ChildAccountPage(currentChild: currentSelectChild), isActive: $goToChildProfilePage){
                                EmptyView()
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
    
}



//struct UserPhoto: View {
//
//
//    var body: some View {
//
//        ZStack{
//            Image("photoframe")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 80, height: 80, alignment: .center)
//
//
//            Image("userPhoto")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 50, height: 50, alignment: .center)
//
//        }
//    }
//}

//struct Message_And_Name: View{
//    let username: String
//    init(username: String){
//        self.username = username
//    }
//    var body: some View {
//        VStack{
//            Text("Welcome Back").fontWeight(.thin)
//            Text(username)
//        }
//    }
//}



//Menu button and drop down menu at the top left corner


//struct Title_and_home_Page: View{
//    var body: some View{
//        HStack{
//            Image("home")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 30, height: 30, alignment: .leading)
//            Text("Family List")
//        }
//    }
//}


//struct Button_Label: View{
//    var currentChild : Child
//    var body: some View{
//        HStack{
//            ZStack{
//                Image("photoframe")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 80, height: 80, alignment: .center)
//
//
//                Image("userPhoto")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 50, height: 50, alignment: .center)
//
//            }.frame( alignment: .leading)
//            VStack{
//                Text(currentChild.name).frame(width: UIScreen.main.bounds.width*0.6,height: UIScreen.main.bounds.width*0.16, alignment: .topLeading)
//
//                HStack{
//                    Spacer()
//                    Image("token 5_In_DashBoard")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 20, height: 20, alignment: .leading)
//                    Text("20")
//                    Image("goal_Dashboard")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 20, height: 20, alignment: .leading)
//                    Text("100")
//                    Image("RewardIcon_Dashboard")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 20, height: 20, alignment: .leading)
//                    Text("2/5")
//                }
//            }
//        }.frame( width: 300)
//    }
//}

