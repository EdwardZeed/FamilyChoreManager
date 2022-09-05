//
//  ParentProfilePage.swift
//  iosApp
//
//  Created by Edward Zheng on 30/8/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI
import shared

struct ParentProfilePage: View {
    @State var numberOfChildren = "2"
    @State var numberOfRelatives = "2"
    var chores: [ChoreTask]
    
    var body: some View {
        
        ZStack {
            Image("Background").resizable().edgesIgnoringSafeArea(.all)
                .opacity(0.2)
            
            NavigationView {
                ScrollView {
                    VStack{
                        VStack {
                            
                            AvatorBar(numberOfChildren: $numberOfChildren, numberOfRelatives: $numberOfRelatives)
                            Text("Date of Birth: 2002/07/05")
                                .frame(width: UIScreen.main.bounds.width*0.9, alignment: .leading)
                            Text("Choosen theme: Marvel")
                                .frame(width: UIScreen.main.bounds.width*0.9, alignment: .leading)
                            
                        }
                        .padding(.top, 4)
                        
                        Button(action: {}, label: {
                            Text("Edit profile").foregroundColor(Color("AdaptiveColorForText"))
                                
                        })
                        .frame(width: UIScreen.main.bounds.width*0.9, height: 27)
                        .background(Rectangle().fill(Color("AdaptiveColorForBackground")).shadow(color: Color.gray, radius: 1))
                        .padding(.bottom)
                        
                        //                display all chores
                        LazyVStack {
                            ForEach(chores, id: \.self){chore in
                                
                                ChoreCard(chore: chore)
                                    
                                
                            }
                        }
                    }
                }.navigationTitle("EdwardHimself")
                    .toolbar{Menu {
                        Button(action: {}, label: {
                            Text("Add Chores")
                        })} label: {
                            Image("PlusIcon-ChildProfilePage")
                        }}
            }
        }
        
    }
}

struct ParentProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        let achievement = Achievement(points: 1, message: "free three")
        let chore = ChoreTask(taskID: 0, name: "Make bed", description: "Make bed", achievement: achievement, iconImage: "BedIcon")
        Group {
            ParentProfilePage(chores: [chore])
                .preferredColorScheme(.light)
            ParentProfilePage(chores: [chore])
                .preferredColorScheme(.dark)
        }
    }
}


struct AvatorBar: View {
    @Binding var numberOfChildren: String
    @Binding var numberOfRelatives: String
    
    var body: some View {
        HStack{
            Image("parentImage")
                .resizable()
                .frame(width: 80, height: 80)
                .padding(.horizontal, 7)
            Spacer()
            HStack {
                HStack{
                    Image("ChildrenNumberIcon")
                    Text(numberOfChildren)
                }
                .padding(.horizontal, 8)
                HStack{
                    Image("RelativeNumberIcon")
                    Text(numberOfRelatives)
                }
                .padding(.horizontal, 8)
            }
            .frame(width: UIScreen.main.bounds.width*0.7, alignment: .leading)
        }
        .frame(width: UIScreen.main.bounds.width*0.9)
    }
}

struct ChoreCard: View {
    var chore: ChoreTask
    var body: some View {
        HStack{
            Image(chore.iconImage)
                .frame(width: 59, height: 59)
                .padding(.horizontal, 7)
            
            
            VStack(alignment: .leading){
                Text(chore.name)
                    .font(.title)
                    .fontWeight(.semibold)
                
                
                HStack{
                    Text(chore.achievement.message + ":")
                    Text(String(chore.achievement.points))
                    
                    //                                    Image("PointIcon")
                }
                
                
                Text("2022/8/31")
                    .frame(width: UIScreen.main.bounds.width*0.85 - 59,  alignment: .trailing)
            }
            
        }
        .frame(width: UIScreen.main.bounds.width*0.9, alignment: .leading)
        .background(Rectangle().fill(Color("AdaptiveColorForBackground")).shadow(color: Color.gray, radius: 2))
    }
}
