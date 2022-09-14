//
//  ChildAccountPage.swift
//  iosApp
//
//  Created by chris on 5/9/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI
import shared

struct ChildAccountPage: View {
    
    var currentChild : Child
    
    var body: some View {
            ScrollView{
                VStack(alignment: .leading){
                        
                    Text(currentChild.name).padding(.horizontal, 10)
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
                            
                        }).padding(.bottom, UIScreen.main.bounds.height*0.01).shadow(radius: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                            .frame(width: UIScreen.main.bounds.width*0.98, alignment: .center)
                        
                        
                        VStack(alignment: .center){
                            HStack{
                                Image("rewardIcon-ChildrenProfilePage")
                                Text("Reward List")
                            }.padding(.bottom, -1)
                            
                            
                            ZStack(alignment: .leading){
                                Image("RewardBackgroundBoard-ChildProfilePage")
                                
                                ScrollView(.horizontal){
                                    HStack{
                                        SingleReward_ChildProfilePage()
                                        
                                        
                                        
                                    }.padding(.horizontal, 7)
                                }
                                
                                
                                
                            }.shadow(radius: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                                .frame(width: UIScreen.main.bounds.width*0.98, alignment: .center)
                        }.padding(.bottom, UIScreen.main.bounds.height*0.01).shadow(radius: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                        
                        
                        VStack(alignment: .center){
                            HStack(alignment: .center){
                                Image("ChoresIcon-ChildProfilePage")
                                Text("Finished Chores")
                                
                            }.padding(.bottom, -1)
                            
         
                            ForEach(currentChild.finishedChoreList,id:\.self){choretask in
                                SingleFinishChore_ChildProfilePage(singlefinishchore : choretask)
                            }
                            
                            SingleFinishChore_ChildProfilePage(singlefinishchore : ChoreTask(taskID: 1, name: "Make the bed", description: "None", achievement: achievement, iconImage: "BedIcon-ChildProfilePage"))
                            
                        }
                        
                        
                    }.frame(width: UIScreen.main.bounds.width, alignment: .center)
                
            }
                
    }
                                   
}



struct ChildAccountPage_Previews: PreviewProvider {
    static var previews: some View {
        
        //These are the dummy data of chore cards which assigned to the children
        let achievement = Achievement(points: 3, message: "well done")
        
        var singleChore1 = ChoreTask(taskID: 1, name: "Make the bed", description: "None", achievement: achievement, iconImage: "BedIcon-ChildProfilePage")
        var singleChore2 = ChoreTask(taskID: 2, name: "Sweep the floor", description: "None", achievement: achievement, iconImage: "broom")
        var singleChore3 = ChoreTask(taskID: 3, name: "Wash the dishes", description: "None", achievement: achievement, iconImage: "WashDishes")
        
        
        
        ChildProfilePage(currentChild: Child(userID: 10086, name: "qqq", dateOfBirth: "aaa", chooseTheme: Theme(name: "s"), avatarPic: "v"))
    }
}



