import SwiftUI
import shared
import Firebase
import GoogleSignIn
import FBSDKCoreKit

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      
      ApplicationDelegate.shared.application(
        application,
        didFinishLaunchingWithOptions: launchOptions
      )

    return true
  }
    
    func application(_ application: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:])
      -> Bool {
          ApplicationDelegate.shared.application(
                      application,
                      open: url,
                      sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
                      annotation: options[UIApplication.OpenURLOptionsKey.annotation]
                  )
      //return GIDSignIn.sharedInstance.handle(url)
    }
}

@main
struct iOSApp: App {
    @StateObject var authViewModel = AuthViewModel()
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
	
    var body: some Scene {
		WindowGroup {
            
//            ParentLoginPage()
            ContentView()
                .environmentObject(authViewModel)
            
		}
	}

}
