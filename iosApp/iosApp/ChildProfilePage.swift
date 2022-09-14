//
//  ChildProfilePage.swift
//  iosApp
//
//  Created by chris on 30/8/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI
import shared




struct ChildProfilePage: View {
    
    var currentChild : Child
    @State var isAddDialogShow = false
    @State var isDeleteDialogShow = false
    @State var eventList:[RandomItem] = [RandomItem(title: "test")]
    @State var curDelItem: RandomItem = RandomItem(title: "")
    
    @State var goToChildQRCodePage = false
    @State var goToAddContract = false
    
    var body: some View {
        
        
        
        ScrollView{
            
            VStack(alignment: .leading){
                
                
                HStack(alignment: .center, spacing: 30){
                    Image("ChildIcon-ChildProfilePage")
                    
                    
                    Image("Point-ChildProfilePage")
                    Text("25").padding(.leading, -20)
                    Image("Goal-ChildProfilePage")
                    Text("68").padding(.leading, -20)
                    Image("RewardIcon-ChildProfilePage")
                    Text("2/8").padding(.leading, -20)
                }
                
                VStack(alignment: .leading){
                    Text("Date of birth: " + currentChild.dateOfBirth)
                        .font(.footnote)
                        .fontWeight(.thin)
                    Text("Choose Theme: " + (currentChild.chooseTheme.name))
                        .font(.footnote)
                        .fontWeight(.thin)
                }.padding(.bottom, UIScreen.main.bounds.height*0.02)
                
                
                Button(action: {}, label: {
                    Image("EditProfileBtn-ChildProfilePage")
                        .resizable()
                    
                }).padding(.bottom, UIScreen.main.bounds.height*0.01).shadow(radius: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .frame(width: UIScreen.main.bounds.width*0.98, alignment: .center)
                
                
                VStack(alignment: .center){
                    HStack{
                        Image("rewardIcon-ChildrenProfilePage")
                        Text("Reward List")
                    }.padding(.bottom, -1)
                    
                    
                    ZStack(alignment: .center){
                        Image("RewardBackgroundBoard-ChildProfilePage")
                            .resizable()
                        
                        ScrollView(.horizontal){
                            HStack(){
                                SingleReward_ChildProfilePage()
                                    .padding(.horizontal, UIScreen.self.main.bounds.width*0.02)
                                    .zIndex(0)
                                    
                            }
                        }
                        
                        
                        
                    }.shadow(radius: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                        .frame(width: UIScreen.main.bounds.width*0.98, alignment: .center)
                }.padding(.bottom, UIScreen.main.bounds.height*0.01).shadow(radius: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                
                
                VStack() {
                    HStack{
                        Image("ChoresIcon-ChildProfilePage")
                        Text("Finished Chores")
                        
                    }.padding(.bottom, -1)
                    
 
                    ForEach(currentChild.finishedChoreList,id:\.self){choretask in
                        SingleFinishChore_ChildProfilePage(singlefinishchore : choretask)
                    }
                    SingleFinishChore_ChildProfilePage(singlefinishchore : ChoreTask(taskID: 1, name: "Make the bed", description: "None", achievement: achievement, iconImage: "BedIcon-ChildProfilePage"))
                    SingleFinishChore_ChildProfilePage(singlefinishchore : ChoreTask(taskID: 2, name: "Sweep the floor", description: "None", achievement: achievement, iconImage: "broom"))
                    SingleFinishChore_ChildProfilePage(singlefinishchore : ChoreTask(taskID: 3, name: "Wash the dishes", description: "None", achievement: achievement, iconImage: "WashDishes"))
                    
                    
                }
                
                
            }.frame(width: UIScreen.main.bounds.width, alignment: .center)
            
            
        }.PopUpWindow(isPresented: $isAddDialogShow) { item in
            if(!item.isEmpty) {
                eventList.append(RandomItem(title: item))
            }
            
        }.navigationBarTitle(currentChild.name)
            .toolbar{Menu {
                Button(action: {isAddDialogShow.toggle()}, label: {
                    Text("Assign Chores")
                })
                Button("Add contract"){goToAddContract = true}
                Button("QR Code Scan"){goToChildQRCodePage = true}
                
                
            } label: {
                    Image("PlusIcon-ChildProfilePage")
                }
                
            }
            NavigationLink(isActive: $goToChildQRCodePage) {
                ChildQRCodePage(child: currentChild)
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
struct SingleFinishChore_ChildProfilePage : View {
    var singlefinishchore: ChoreTask
    var body: some View{
        HStack{
            ZStack{
                Image("SingleFinishChoreboard-ChildProfilePage")
                    .resizable()
                    .frame(maxWidth: UIScreen.self.main.bounds.width*0.99,maxHeight: 100)
                    .shadow(radius: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
    
                HStack{
                    Image(singlefinishchore.iconImage)
                    VStack(alignment: .leading){
                        VStack{
                            Text(singlefinishchore.name)
                                .fontWeight(.bold)
                        }.padding(.bottom, -3)
                        HStack(spacing: 1){
                            Text("Your second free throw:")
                                .font(.footnote)
                                .fontWeight(.thin)
                            Text(String(singlefinishchore.achievement.points))
                                .font(.footnote)
                                .fontWeight(.thin)
                            Image("SmallCoinIcon-ChildProfilePage")
                            
                            
                        }
                        
                    }.frame(width: UIScreen.self.main.bounds.width*0.55, height: 73, alignment: .leading)
                    
                    VStack(alignment: .trailing){
                        //this is shit code, delete anytime
                        
                        Text("2001/07/09")
                            .font(.footnote)
                            .fontWeight(.thin)
                            .frame(alignment: .trailing)
                        
                    }
                }.frame(width: 373, height: 73)
                
            }.frame(width: UIScreen.main.bounds.width*0.98, alignment: .center)
            
        }
    }
}

struct SingleReward_ChildProfilePage : View {
    
    var body: some View{
        ZStack{
            Image("SingleRewardBoard-ChildProfilePage")
            VStack(){
                Image("xboxIcon")
                Text("Xbox One")
                    .font(.footnote)
                    .fontWeight(.thin)
            }
        }
    }
}



struct ChildProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        
        //These are the dummy data of chore cards which assigned to the children
        let achievement = Achievement(points: 3, message: "well done")
        
        var singleChore1 = ChoreTask(taskID: 1, name: "Make the bed", description: "None", achievement: achievement, iconImage: "BedIcon-ChildProfilePage")
        var singleChore2 = ChoreTask(taskID: 2, name: "Sweep the floor", description: "None", achievement: achievement, iconImage: "broom")
        var singleChore3 = ChoreTask(taskID: 3, name: "Wash the dishes", description: "None", achievement: achievement, iconImage: "WashDishes")
        
        
        
        ChildProfilePage(currentChild: Child(userID: 100, name: "Chris", dateOfBirth: "2002-02-14", chooseTheme: Theme(name: "Saber"), avatarPic: "Lion"))
    }
}



