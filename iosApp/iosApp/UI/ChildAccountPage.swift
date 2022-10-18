//
//  ChildAccountPage.swift
//  iosApp
//
//  Created by chris on 5/9/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI
import shared
import Kingfisher

struct ChildAccountPage: View {
    
    
    //    @State var currentChild : Child
    //    var currentParentid: String
    //    var contractViewModel: ContractViewModel
    var selectedChild: Child?
    var result: [Int]
    
    @State var isAddDialogShow = false
    @State var isDeleteDialogShow = false
    @State var eventList:[RandomItem] = [RandomItem(title: "test")]
    @State var curDelItem: RandomItem = RandomItem(title: "")
    @State var goToAddContract = false
    @State var goToChildQRCodePage = false
    
    @State var isPresentSheet: Bool = false
    @State var newDateOfBirth: Date?
    @State var newUserName: String = ""
    @State var newTheme: String = ""
    @State var textFieldHeight: CGFloat = 0
    @State var userImage: UIImage?
    @State var showingLocalImage: Bool = false
    @EnvironmentObject var childUserEditModel : editUserInfoModel
    @EnvironmentObject var childAuthViewModel : ChildAuthViewModel
    
    
    
    var body: some View {
        if selectedChild != nil{
            NavigationView {
                ScrollView{
                    VStack{
                        HStack(alignment: .center, spacing: 30){
                            if selectedChild?.avatarPic != nil{
                                KFImage(URL(string: self.selectedChild!.avatarPic!))
                                    .resizable()
                                    .frame(width: 80, height: 80, alignment: .center)
                                    .clipShape(Circle())
                                    .aspectRatio(contentMode: .fit)
                            }
                            else{
                                Image("ChildIcon-ChildProfilePage")
                            }
                            
                            
                            Image("Point-ChildProfilePage")
                            Text("25").padding(.leading, -20)
                            Image("Goal-ChildProfilePage")
                            Text("68").padding(.leading, -20)
                            Image("RewardIcon-ChildProfilePage")
                            Text("2/8").padding(.leading, -20)
                        }
                        
                        VStack(alignment: .leading){
                            Text("Date of birth: " + self.selectedChild!.dateOfBirth)
                                .font(.footnote)
                                .fontWeight(.thin)
                            Text("Choose Theme: " + (self.selectedChild!.chooseTheme.name))
                                .font(.footnote)
                                .fontWeight(.thin)
                        }.padding(.bottom, UIScreen.main.bounds.height*0.02)
                        
                        
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
                            
                            
                            ForEach(self.selectedChild!.finishedChoreList,id:\.self){choretask in
                                SingleFinishChore_ChildProfilePage(singlefinishchore : choretask)
                            }
                            
                        }
                        
                        
                    }
                    //                    .navigationBarTitle(self.selectedChild!.name, displayMode: .inline)
                    
                }
                
            }
            .navigationBarTitle(self.selectedChild!.name, displayMode: .inline)
        }
        else{
            NavigationView {
                ScrollView{
                    VStack{
                        HStack(alignment: .center, spacing: 30){
                            if self.childAuthViewModel.currentChild.avatarPic != nil{
                                KFImage(URL(string: self.childAuthViewModel.currentChild.avatarPic!))
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .padding(.horizontal, 7)
                                    .clipShape(Circle())
                            }
                            else{
                                Image("ChildIcon-ChildProfilePage")
                            }
                            
                            
                            Image("Point-ChildProfilePage")
                            Text("25").padding(.leading, -20)
                            Image("Goal-ChildProfilePage")
                            Text("68").padding(.leading, -20)
                            Image("RewardIcon-ChildProfilePage")
                            Text("2/8").padding(.leading, -20)
                        }
                        
                        VStack(alignment: .leading){
                            Text("Date of birth: " + self.childAuthViewModel.currentChild.dateOfBirth)
                                .font(.footnote)
                                .fontWeight(.thin)
                            Text("Choose Theme: " + (self.childAuthViewModel.currentChild.chooseTheme.name))
                                .font(.footnote)
                                .fontWeight(.thin)
                        }.padding(.bottom, UIScreen.main.bounds.height*0.02)
                        
                        
                        Button(action: {self.childUserEditModel.isEditSheetPresent.toggle()}, label: {
                            Image("EditProfileBtn-ChildProfilePage")
                            
                        }).padding(.bottom, UIScreen.main.bounds.height*0.01).shadow(radius: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                            .frame(width: UIScreen.main.bounds.width*0.98, alignment: .center)
                            .sheet(isPresented: self.$childUserEditModel.isEditSheetPresent){
                                VStack{
                                    Button(action: {
                                        //                var createReward = RewardCreater()
                                        //                rewardList.append(createReward)
                                        showingLocalImage.toggle()
                                    }, label: {
                                        VStack{
                                            if let image = self.userImage{
                                                Image(uiImage: userImage!)
                                                    .resizable()
                                                    .frame(width: 200, height: 200)
                                                    .scaledToFill()
                                                    .cornerRadius(10)
                                            }else{
                                                Image("edituserphoto")
                                                    .resizable()
                                                    .frame(width: 200, height: 200)
                                                    .scaledToFill()
                                                
                                            }
                                        }
                                    }).frame(width: 200, height: 200, alignment: .center)
                                    
                                    HStack{
                                        Image("userIcon").resizable().frame(width: 32.0, height: 32.0)
                                        TextField("Name", text: $newUserName)
                                    }.underlinetextfield()
                                    
                                    HStack{
                                        Image("dateIcon").resizable().frame(width: 32.0, height: 32.0)
                                        DatePickerTextField(placeholder: "Date of Bitrh", date: $newDateOfBirth)
                                    }  .padding(.vertical, 20)
                                        .overlay(Rectangle().frame(width: 360, height: 2).padding(.top, 50))
                                        .foregroundColor(Color.black)
                                        .frame(width: UIScreen.main.bounds.width*0.95, height: textFieldHeight)
                                        .padding(10)
                                    
                                    
                                    HStack{
                                        Image("brush").resizable().frame(width: 32.0, height: 32.0)
                                        TextField("Theme", text: $newTheme)
                                    }.underlinetextfield()
                                    
                                    Button(action: {
                                        childUserEditModel.editChildInfo(parentID: String(self.childAuthViewModel.childSession.split(separator: " ")[0]), childID: self.childAuthViewModel.currentChild.userID, childName: newUserName, dateOfBirth: newDateOfBirth, theme: newTheme, imageData: userImage)
                                        
//                                        childUserEditModel.fetchChildren()
//                                        
//                                        
//                                        childUserEditModel.getNewestChildInfo(childID: self.childAuthViewModel.currentChild.userID)
                                        self.childUserEditModel.isEditSheetPresent.toggle()
                                        
                                        
                                    },
                                           label: {
                                        Image("UpdateProfileBtn")
                                    })
                                    .padding(.bottom, UIScreen.main.bounds.height*0.03)
                                    
                                    
                                }.fullScreenCover(isPresented: $showingLocalImage, content: {
                                    ImagePicker(image: $userImage)
                                }).onReceive(childUserEditModel.$finishedObtainNewestChildInfo) { success in
                                    if success{
                                        self.childAuthViewModel.currentChild = childUserEditModel.currentChild
                                        print(self.childAuthViewModel.currentChild.name + "is the current child name")
                                    }
                                }
                                
                                
                                
                            }.frame(width: UIScreen.main.bounds.width, alignment: .center)
                        
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
                            
                            
                            ForEach(self.childAuthViewModel.currentChild.finishedChoreList,id:\.self){choretask in
                                SingleFinishChore_ChildProfilePage(singlefinishchore : choretask)
                            }
                            
                        }
                        
                        
                    }.navigationTitle(self.childAuthViewModel.currentChild.name)
                    
                }
                
            }
        }
        
    }
    
    
    
    struct ChildAccountPage_Previews: PreviewProvider {
        static var previews: some View {
            
            //These are the dummy data of chore cards which assigned to the children
            let achievement = Achievement(points: 3, message: "well done")
            
            var singleChore1 = ChoreTask(taskID: "1", name: "Make the bed", description: "None", achievement: achievement, iconImage: "BedIcon-ChildProfilePage")
            var singleChore2 = ChoreTask(taskID: "2", name: "Sweep the floor", description: "None", achievement: achievement, iconImage: "broom")
            var singleChore3 = ChoreTask(taskID: "3", name: "Wash the dishes", description: "None", achievement: achievement, iconImage: "WashDishes")
            
            
            
            //        ChildProfilePage(finishChoreList: [])
        }
    }
}
