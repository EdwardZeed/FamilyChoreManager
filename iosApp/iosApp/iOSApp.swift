import SwiftUI
import shared

@main
struct iOSApp: App { 
	var body: some Scene {
		WindowGroup {
//			ParentLoginPage()
            
            AssignChorePopUpWindow(fadeIn: false, isPresented: Binding.constant(true)) { item in
                print(item)
            }
            
//            let achievement = Achievement(points: 1, message: "free three")
//            let chore = ChoreTask(taskID: 0, name: "Make bed", description: "Make bed", achievement: achievement, iconImage: "BedIcon")
//
//            TabView{
//                ParentProfilePage(chores: [chore])
//                    .tabItem{
//                        Image(systemName: "house")
//                        Text("Dashboard")
//                    }
//                AddChildPage()
//                    .tabItem{
//                        Image(systemName: "person")
//                        Text("Account")
//                    }
//            }
            
		}
	}

}
