//
//  TodoAppUsingSwiftUIApp.swift
//  TodoAppUsingSwiftUI
//
//  Created by Zignuts Tchnolab on 08/03/24.
//

import SwiftUI
import FirebaseFirestore
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      let db = Firestore.firestore()
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
