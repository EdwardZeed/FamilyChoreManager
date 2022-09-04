import SwiftUI
import shared

@main
struct iOSApp: App {
    var body: some Scene {
        WindowGroup {
            //            ParentLoginPage()finishChoreList: <#[ChoreTask]#>
            SignContractPage(username: "Frank")
        }

    }
}

