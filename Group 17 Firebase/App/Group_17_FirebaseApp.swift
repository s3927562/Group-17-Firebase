//
//  Group_17_FirebaseApp.swift
//  Group 17 Firebase
//
//  Created by Tung Tran Thanh on 12/09/2023.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct Group_17_FirebaseApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var authenticator = Authenticator()
    
    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environmentObject(authenticator)
        }
        
    }
}
