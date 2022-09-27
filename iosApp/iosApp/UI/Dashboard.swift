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
        
        var currentParent = Parent(userID: "0", name: "Chris", dateOfBirth: "2002/02/14", chooseTheme: Theme(name: "The Boys"), avatarPic: "Dragon")
        var child1 = Child(userID: 1, name: "Linda", dateOfBirth: "2012/02/14", chooseTheme: Theme(name: "Disney"), avatarPic: "Poly")

        var child2 = Child(userID: 2, name: "Anna", dateOfBirth: "2012/03/14", chooseTheme: Theme(name: "Marvel"), avatarPic: "IronMan")

        var child3 = Child(userID: 3, name: "Bulankin", dateOfBirth: "2012/05/14", chooseTheme: Theme(name: "T-34"), avatarPic: "PP_50")

        var child4: Child = Child(userID: 4, name: "Frank", dateOfBirth: "2001", chooseTheme: Theme(name: "T-34"), avatarPic: "Default")

        var child5: Child = Child(userID: 5, name: "Frank", dateOfBirth: "2001", chooseTheme: Theme(name: "Minecraft"), avatarPic: "Default")


        var childList = [child3,child2,child1]
        var parentList = [currentParent]
        DashBoardPage(children: childList, parents:  parentList)
    }
}


struct DashBoardPage: View {
    var children: [Child]
    var parents: [Parent]
    

    @State var goToChildProfilePage = false
    @State var goToParentProfilePage = false
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @State var currentSelectChild: Child = Child(userID: -1, name: "", dateOfBirth: "", chooseTheme: Theme(name: ""), avatarPic: "")
    
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
                                Message_And_Name(username: authViewModel.currentUser?.name ?? "")
                                
                            }.frame(width: UIScreen.main.bounds.width*0.85, alignment: .leading)
                                .padding(.top, 3)
                            
                            Plus_button_in_DashBoard()
                        }
                        
                        VStack{
                            
                            //Spacer(minLength: 50)
                            Title_and_home_Page().frame(width: UIScreen.main.bounds.width*0.95,alignment: .leading)
                            
                            LazyVStack{
                                ForEach(parents,id:\.self){parent in
                                    HStack{
                                        Button(action: {
                                            goToParentProfilePage = true
                                        
                                            //currentSelectParent = parent
                                         
                                        }, label: {
                                            Parent_Button_Label(currentParent: parent)
                                                .foregroundColor(Color("AdaptiveColorForText"))
                                        }).frame(width: UIScreen.main.bounds.width*0.95, height: UIScreen.main.bounds.width*0.3)
                                            .background(Color("AdaptiveColorForBackground"))
                                            .cornerRadius(25)
                                            .shadow(color: Color.gray, radius: 10)
                                        
                                    }
//                                    NavigationLink(destination: ParentProfilePage(chores: []), isActive: $goToParentProfilePage){
//                                        EmptyView()
//                                    }
                                    
                                }
                                ForEach(children,id:\.self){child in
                                    HStack{
                                        Button(action: {
                                            goToChildProfilePage = true
                                        
                                            currentSelectChild = child
                                         
                                        }, label: {
                                            Button_Label(currentChild: child).foregroundColor(Color("AdaptiveColorForText"))
                                        }).frame(width: UIScreen.main.bounds.width*0.95, height: UIScreen.main.bounds.width*0.3)
                                            .background(Color("AdaptiveColorForBackground"))
                                            .cornerRadius(25)
                                            .shadow(color: Color.gray, radius: 10)
                                
                                    }
                                }
                               
                                
                            }
                            NavigationLink(destination: ChildProfilePage(currentChild: currentSelectChild), isActive: $goToChildProfilePage){
                                EmptyView()
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
        VStack(alignment: .leading){
            Text("Welcome Back").fontWeight(.thin)
            Text(username)
        }
    }
}

struct Plus_button_in_DashBoard: View{
    @State var goToAddChild = false
    @State var goToAddChore = false
    @State var goToAddContract = false
    
    var body: some View{
        HStack{
            Menu {
                Button("Add child"){goToAddChild = true}
                Button("Add chore"){goToAddChore = true}
                Button("Add contract"){goToAddContract = true}
            } label: {
                Image("PlusIcon")
            }
            
            NavigationLink(isActive: $goToAddChild) {
                AddChildPage()
            } label: {
                EmptyView()
            }

            NavigationLink(isActive: $goToAddChore) {
                AddChorePage()
            } label: {
                EmptyView()
            }
            
            NavigationLink(isActive: $goToAddContract) {
                SignContractPage(username: "ikaros")
            } label: {
                EmptyView()
            }
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


struct Parent_Button_Label: View{
    var currentParent: Parent
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
                Text(currentParent.name).frame(width: UIScreen.main.bounds.width*0.6,height: UIScreen.main.bounds.width*0.16, alignment: .topLeading)
            }
        }.frame( width: 300)
    }
}
