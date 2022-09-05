//
//  DashBoardPage.swift
//  iosApp
//
//  Created by Frank Shi on 30/8/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import Foundation
import SwiftUI
import shared

struct Preview_DashBoardPage: PreviewProvider {
    
    static var previews: some View {
        var parent_user: Parent = Parent(userID: 1, name: "TestParent", dateOfBirth: "IDK", chooseTheme: nil, avatarPic: nil)
        
        var child1: Child = Child(userID: 1, name: "Frank", dateOfBirth: "2001", chooseTheme: nil, avatarPic: "Default")
        var child2: Child = Child(userID: 2, name: "Frank", dateOfBirth: "2001", chooseTheme: nil, avatarPic: "Default")
        var child3: Child = Child(userID: 3, name: "Frank", dateOfBirth: "2001", chooseTheme: nil, avatarPic: "Default")
//        var child4: Child = Child(userID: 4, name: "Frank", dateOfBirth: "2001", chooseTheme: nil, avatarPic: "Default")
//        var child5: Child = Child(userID: 5, name: "Frank", dateOfBirth: "2001", chooseTheme: nil, avatarPic: "Default")
        
        var childList = [child3,child2,child1]
        var parentList = [parent_user]
//        DashBoardPage(username: parent_user.name,childList: childList, parentList:  parentList, navigationBar: )
    }
}


struct DashBoardPage: View {
    let username: String
    var children: [Child]
    var parents: [Parent]
    
    var navigationBar : NavigationBarView

    @State var goToChildProfilePage = false
    
    init(username: String, childList: [Child], parentList: [Parent], navigationBar: NavigationBarView){
        self.username = username
        self.children = childList
        self.parents = parentList
        self.navigationBar = navigationBar
        
    }
    
    
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
                                Message_And_Name(username: username)
                                
                            }.frame(width: UIScreen.main.bounds.width*0.85, alignment: .leading)
                                .padding(.top, 3)
                            
                            Plus_button_in_DashBoard()
                        }
                        
                        VStack{
                            
                            //Spacer(minLength: 50)
                            Title_and_home_Page().frame(width: UIScreen.main.bounds.width*0.95,alignment: .leading)
                            
                            LazyVStack{
                                ForEach(children,id:\.self){child in
                                    HStack{
                                        Button(action: {
                                            goToChildProfilePage = true
                                         
                                        }, label: {
                                            Button_Label(currentChild: child)
                                        }).frame(width: UIScreen.main.bounds.width*0.95, height: UIScreen.main.bounds.width*0.3)
                                            .background(Color.white)
                                            .cornerRadius(25)
                                            .shadow(color: Color.gray, radius: 10)
                                        
                                        NavigationLink(destination: ChildProfilePage(finishChoreList: []), isActive: $goToChildProfilePage){
                                            EmptyView()
                                        }
                                        
                                    }
                                }
                                
                            }
                            
                        }
                       
                    }
                }
               
            }.navigationBarHidden(true)

        }.navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
         
       
        
    }
    
}



struct UserPhoto: View {
    
    
    var body: some View {
        
        ZStack{
            Image("photoframe")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80, alignment: .center)
            
            
            Image("userPhoto")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50, alignment: .center)
            
        }
    }
}

struct Message_And_Name: View{
    let username: String
    init(username: String){
        self.username = username
    }
    var body: some View {
        VStack{
            Text("Welcome Back").fontWeight(.thin)
            Text(username)
        }
    }
}

struct Plus_button_in_DashBoard: View{
    var body: some View{
        HStack{
            Button(action: {
                
            }, label: {
                Image("DashBoardPlusIcon")
                
            })
        }
    }
}

//Menu button and drop down menu at the top left corner


struct Title_and_home_Page: View{
    var body: some View{
        HStack{
            Image("home")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30, alignment: .leading)
            Text("Family List")
        }
    }
}


struct Button_Label: View{
    var currentChild : Child
    var body: some View{
        HStack{
            ZStack{
                Image("photoframe")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80, alignment: .center)
                
                
                Image("userPhoto")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50, alignment: .center)
                
            }.frame( alignment: .leading)
            VStack{
                Text(currentChild.name).frame(width: UIScreen.main.bounds.width*0.6,height: UIScreen.main.bounds.width*0.16, alignment: .topLeading)
                
                HStack{
                    Spacer()
                    Image("token 5_In_DashBoard")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20, alignment: .leading)
                    Text("20")
                    Image("goal_Dashboard")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20, alignment: .leading)
                    Text("100")
                    Image("RewardIcon_Dashboard")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20, alignment: .leading)
                    Text("2/5")
                }
            }
        }.frame( width: 300)
    }
}

