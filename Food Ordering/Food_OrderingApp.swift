//
//  Food_OrderingApp.swift
//  Food Ordering
//
//  Created by Shultan Alif on 01/03/21.
//

import SwiftUI
import Firebase
import FirebaseCore

@main
struct Food_OrderingApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:[UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        return true
    }
}
