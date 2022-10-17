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
    
    @State var currentChild : Child
    var currentParentid: String
    var contractViewModel: ContractViewModel
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
    
    
    
    var body: some View {
        
        
        
        ScrollView{
            VStack{
                
                
                
                
                HStack(alignment: .center, spacing: 30){
                    Image("ChildIcon-ChildProfilePage")
                    
                    
                    Image("Point-ChildProfilePage")
                    Text("25").padding(.leading, -20)
                    Image("Goal-ChildProfilePage")
                    Text(String(contractViewModel.maxpoint)).padding(.leading, -20)
                    Image("RewardIcon-ChildProfilePage")
                    Text("2/" + String(contractViewModel.totalCheckpoint)).padding(.leading, -20)
                }
                
                VStack(alignment: .leading){
                    Text("Date of birth: " + currentChild.dateOfBirth)
                        .font(.footnote)
                        .fontWeight(.thin)
                    Text("Choose Theme: " + (currentChild.chooseTheme.name))
                        .font(.footnote)
                        .fontWeight(.thin)
                }.padding(.bottom, UIScreen.main.bounds.height*0.02)
                
                
                Button(action: { isPresentSheet.toggle()}, label: {
                    Image("EditProfileBtn-ChildProfilePage")
                    
                }).padding(.bottom, UIScreen.main.bounds.height*0.01).shadow(radius: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .frame(width: UIScreen.main.bounds.width*0.98, alignment: .center)
                
                    .sheet(isPresented: $isPresentSheet){
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
                                childUserEditModel.editChildInfo(parentID: currentParentid, childID: currentChild.userID, childName: newUserName, dateOfBirth: newDateOfBirth, theme: newTheme, imageData: userImage)
                                
                                childUserEditModel.fetchChildren()
                                
                                
                                childUserEditModel.getNewestChildInfo(childID: currentChild.userID)
                                isPresentSheet.toggle()
                               
                                
                            },
                                   label: {
                                Image("UpdateProfileBtn")
                            })
                            .padding(.bottom, UIScreen.main.bounds.height*0.03)
                               
                           
                        }.fullScreenCover(isPresented: $showingLocalImage, content: {
                            ImagePicker(image: $userImage)
                        }).onReceive(childUserEditModel.$finishedObtainNewestChildInfo) { success in
                            if success{
                                currentChild = childUserEditModel.currentChild
                                print(currentChild.name + "is the current child name")
                            }
                        }
//                        .onReceive(addChoreViewModel.$addChoreImageSuccess) { success in
//                            if success{
//                                presentationMode.wrappedValue.dismiss()
//                            }
//                        }
                    }
                
                
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
                    
 
                    ForEach(currentChild.finishedChoreList,id:\.self){choretask in
                        SingleFinishChore_ChildProfilePage(singlefinishchore : choretask)
                    }
                    
                }
                
                
            }.frame(width: UIScreen.main.bounds.width, alignment: .center)
            
            
        }.PopUpWindow(isPresented: $isAddDialogShow) { item in
            if(!item.isEmpty) {
                eventList.append(RandomItem(title: item))
            }
            
        }.navigationBarTitle(currentChild.name, displayMode: .inline)
            .toolbar{Menu {
                Button(action: {isAddDialogShow.toggle()}, label: {
                    Text("Assign Chores")
                })
                Button("QR Code Scan"){
                    
                    goToChildQRCodePage = true
                    print(currentChild.userID)
                
                    
                }
                Button("Add contract"){goToAddContract = true}
                
                
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
                SignContractPage(child: currentChild)
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

extension View{
    func underlinetextfield() -> some View{
        self
            .padding(.vertical, 20)
            .overlay(Rectangle().frame(width: 360, height: 2).padding(.top, 50))
            .foregroundColor(Color.black)
            .padding(10)
    }
}



struct ChildProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        
        //These are the dummy data of chore cards which assigned to the children
        let achievement = Achievement(points: 3, message: "well done")
        
        var singleChore1 = ChoreTask(taskID: "1", name: "Make the bed", description: "None", achievement: achievement, iconImage: "BedIcon-ChildProfilePage")
        var singleChore2 = ChoreTask(taskID: "2", name: "Sweep the floor", description: "None", achievement: achievement, iconImage: "broom")
        var singleChore3 = ChoreTask(taskID: "3", name: "Wash the dishes", description: "None", achievement: achievement, iconImage: "WashDishes")
        
        
        
//        ChildProfilePage(finishChoreList: [])
    }
}



