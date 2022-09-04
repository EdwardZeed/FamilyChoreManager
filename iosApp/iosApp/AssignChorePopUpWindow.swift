//
//  AssignChorePopUpWindow.swift
//  iosApp
//
//  Created by chris on 31/8/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI
import UIKit
import shared


let achievement1 = Achievement(points: 0, message: "weel done")
let achievement2 = Achievement(points: 0, message: "good")
let achievement3 = Achievement(points: 0, message: "done")

var singleChore4 = ChoreTask(taskID: 4, name: "Make the bed", description: "None", achievement: achievement1, iconImage: "BedIcon-ChildProfilePage")
var singleChore5 = ChoreTask(taskID: 5, name: "Sweep the floor", description: "None", achievement: achievement2, iconImage: "broom")
var singleChore6 = ChoreTask(taskID: 6, name: "Wash the dishes", description: "None", achievement: achievement3, iconImage: "WashDishes")


struct AssignChorePopUpWindow: View {
    
    @State var fadeIn: Bool = false
    @Binding var isPresented: Bool
    var action: (_:String)->Void
    
    var assignChoreArray = [singleChore4, singleChore5, singleChore6]
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.gray.opacity(fadeIn ? 1.0 : 0.0))
            ZStack{
               Image("AssignChore-ChildProfilePage")
                ScrollView{
                VStack{

                    let list = [singleChore4, singleChore5, singleChore6]
                


                    ForEach(list,id:\.self){task in
                        SingleAssignChore_ChildProfilePage(singleChore: task)
                    }
                     
                    
                    HStack(alignment: .bottom){
                        Button(){
                            withAnimation(.spring()){
                                isPresented.toggle()
                            }
                            
                            
                        }label: {
                            Image("CloseBtn-ChldProfilePage")
                                .overlay(Text("Close")
                                    .font(.title)
                                    .fontWeight(.light)
                                    .foregroundColor(Color.black))
                        }
                        
                        Button(action: {
                            for i in list{
                                print(i.name + " " + String(i.achievement.points))
                            }
                            
                        }, label: {
                            Image("ApplyBtn-ChildProfilePage")
                                .overlay(Text("Assign")
                                    .font(.title)
                                    .fontWeight(.light)
                                    .foregroundColor(Color.black))
                        })
                            
                    }
                    
                }
                }.frame(width: 327, height: 605)
            }
        
        }
            .ignoresSafeArea()
            .opacity(0.8)
            .onAppear {
                withAnimation(.easeIn){
                    fadeIn.toggle()
                }
            }
    }
    func getAssignChoreArray() -> Array<ChoreTask> {
        return assignChoreArray
    }
}

struct AssignChorePopUpWindow_Previews: PreviewProvider {
    static var previews: some View {
        AssignChorePopUpWindow(fadeIn: false, isPresented: Binding.constant(true)) { item in
            print(item)
        }
    }
}


struct SingleAssignChore_ChildProfilePage : View {

    @State var isSelect : Int = 0
    
    @State var alreadyChoose1 : Bool = false
    @State var alreadyChoose2 : Bool = false
    @State var alreadyChoose3 : Bool = false
    
    var singleChore : ChoreTask


    var body: some View{
        ZStack{
            Image("singleAssignChoreBoard-ChildProfilepage")
            VStack{
                HStack{
                    Image(singleChore.iconImage).resizable().frame(width: 40, height: 40)
                    Text(singleChore.name)
                }.frame(width: 300, alignment: .leading)
                    
                HStack(spacing: 50){
                    Button(action: {
                        isSelect=1
                        alreadyChoose1.toggle()
                        singleChore.achievement.points = 1
                        
                       
                    }, label: {
                        
                        ((isSelect==1) && (alreadyChoose1) ? Image("AssignPoint-AssignChorePage") : Image("selectPoint-AssignChorePage"))
                            .overlay(Text("1")
                            .foregroundColor(.black))
                    })
                    
                    Button(action: {
                        isSelect=2
                        alreadyChoose2.toggle()
                        singleChore.achievement.points = 2
                       
                    }, label: {
                        
                        ((isSelect==2) && (alreadyChoose2) ? Image("AssignPoint-AssignChorePage") : Image("selectPoint-AssignChorePage"))
                            .overlay(Text("2")
                            .foregroundColor(.black))
                    })
                    
                    Button(action: {
                        isSelect=3
                        alreadyChoose3.toggle()
                        singleChore.achievement.points = 3
                    }, label: {
                        
                        ((isSelect==3) && (alreadyChoose3) ? Image("AssignPoint-AssignChorePage") : Image("selectPoint-AssignChorePage"))
                            .overlay(Text("3")
                            .foregroundColor(.black))
                
                    })
                    
                    }
                }
            }
        }
      
}
                           
                           
                           


            
  

    

