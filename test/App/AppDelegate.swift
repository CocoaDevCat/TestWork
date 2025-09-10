//
//  AppDelegate.swift
//  test
//
//  Created by Eldar Akkozov on 9/9/25.
//

import UIKit
import FirebaseCore
import GoogleSignIn

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Container.shared.module()
        
        FirebaseApp.configure()

        return true
    }
    
    @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
}

