import SwiftUI
import shared

@main
struct iOSApp: App {
    var body: some Scene {
        WindowGroup {
            //            ParentLoginPage()finishChoreList: <#[ChoreTask]#>
            var singleChore1 = ChoreTask(taskID: 1, name: "Make the bed", description: "None", achievements: 3, iconImage: "BedIcon-ChildProfilePage")
            var singleChore2 = ChoreTask(taskID: 2, name: "Sweep the floor", description: "None", achievements: 2, iconImage: "broom")
            var singleChore3 = ChoreTask(taskID: 3, name: "Wash the dishes", description: "None", achievements: 1, iconImage: "WashDishes")



            TabView {
                ChildProfilePage(finishChoreList: [singleChore1, singleChore2, singleChore3])
                    .tabItem({
                        Image(systemName: "house")
                    })
            }
        }

    }
}

