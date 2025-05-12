//
//  ListCarsApp.swift
//  ListCars
//
//  Created by Emir Fatih AYYILDIZ on 8.01.2024.
//

import SwiftUI
import Firebase
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {

  func application(_ application: UIApplication,

                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

    FirebaseApp.configure()
    return true

  }

}

@main
struct ListCarsApp: App {

    // register app delegate for Firebase setup
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
