//
//  TodoAppUsingSwiftUIApp.swift
//  TodoAppUsingSwiftUI
//
//  Created by Zignuts Tchnolab on 08/03/24.
//

import SwiftUI
import FirebaseFirestore
import FirebaseCore
import IQKeyboardManagerSwift
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      let db = Firestore.firestore()
      IQKeyboardManager.shared.enable = true
      IQKeyboardManager.shared.enableAutoToolbar = false
      IQKeyboardManager.shared.resignOnTouchOutside = true
    return true
  }
}

@main
struct TodoAppUsingSwiftUIApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            MainView()
          
        }
    }
}
