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
    
    var finishChoreList: [ChoreTask]
    @State var isAddDialogShow = false
    @State var isDeleteDialogShow = false
    @State var eventList:[RandomItem] = [RandomItem(title: "test")]
    @State var curDelItem: RandomItem = RandomItem(title: "")

    var body: some View {
        
        
        
        ScrollView{
            VStack{

                
                Menu {
                    Button(action: {isAddDialogShow.toggle()}, label: {
                       Text("Assign Chores")
                    })
                                
                            } label: {
                                Image("PlusIcon-ChildProfilePage")
                                    
                            }
                            .padding(.horizontal, 10)
                            .frame(width: UIScreen.main.bounds.width-20,alignment: .trailing)
                    
                
                
                Text("[ Child Name ]").frame(width: UIScreen.main.bounds.width,alignment: .leading)

                
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
                    Text("Date of birth: 2015/08/15")
                        .font(.footnote)
                        .fontWeight(.thin)
                    Text("Choose Theme: Marvel")
                        .font(.footnote)
                        .fontWeight(.thin)
                }.padding(.bottom, UIScreen.main.bounds.height*0.02)
                
                
                Button(action: {}, label: {
                    Image("EditProfileBtn-ChildProfilePage")
                    
                }).padding(.bottom, UIScreen.main.bounds.height*0.01).shadow(radius: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .frame(width: UIScreen.main.bounds.width*0.98, alignment: .center)
                
                
                VStack(alignment: .leading){
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
                
                
                VStack(alignment: .leading) {
                    HStack{
                        Image("ChoresIcon-ChildProfilePage")
                        Text("Finished Chores")
                        
                    }.padding(.bottom, -1)
                    
                    ForEach(finishChoreList,id:\.self){choretask in
                        SingleFinishChore_ChildProfilePage(singlefinishchore : choretask)
                    }
                    
                }
                
                
            }.frame(width: UIScreen.main.bounds.width, alignment: .center)
                

        }.PopUpWindow(isPresented: $isAddDialogShow) { item in
            if(!item.isEmpty) {
                eventList.append(RandomItem(title: item))
            }
        }
    }
    
}

struct SingleFinishChore_ChildProfilePage : View {
    var singlefinishchore: ChoreTask
    var body: some View{
        HStack{
            ZStack{
                Image("SingleFinishChoreboard-ChildProfilePage")
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
                            Text(String(singlefinishchore.achievements))
                                .font(.footnote)
                                .fontWeight(.thin)
                            Image("SmallCoinIcon-ChildProfilePage")
                            
                            
                        }
                        
                    }.frame(width: 200, height: 73, alignment: .leading)
                    
                    VStack(alignment: .trailing){
                        //this is shit code, delete anytime
                        Text("").frame(height:40)
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
//    var text: String = String(SingleAssignChore_ChildProfilePage().getFinalSelectPoint())
    
    var body: some View{
        ZStack{
            Image("SingleRewardBoard-ChildProfilePage")
            VStack(){
                Image("xboxIcon")
//                Text(text)
//                    .font(.footnote)
//                    .fontWeight(.thin)
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
        
        
        var singleChore1 = ChoreTask(taskID: 1, name: "Make the bed", description: "None", achievements: 3, iconImage: "BedIcon-ChildProfilePage")
        var singleChore2 = ChoreTask(taskID: 2, name: "Sweep the floor", description: "None", achievements: 2, iconImage: "broom")
        var singleChore3 = ChoreTask(taskID: 3, name: "Wash the dishes", description: "None", achievements: 1, iconImage: "WashDishes")
        var singleChore4 = ChoreTask(taskID: 4, name: "Sweep the floor", description: "None", achievements: 2, iconImage: "broom")
        var singleChore5 = ChoreTask(taskID: 5, name: "Wash the dishes", description: "None", achievements: 1, iconImage: "WashDishes")
        
        
        ChildProfilePage(finishChoreList: [singleChore1, singleChore2, singleChore3, singleChore4, singleChore5])
    }
}


