//
//  AppDelegate.swift
//  Music Search
//
//  Created by John D. Jackson on 9/22/21.
//

import UIKit
import IQKeyboardManager
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        IQKeyboardManager.shared().isEnabled = true
        
        // Override point for customization after application launch.
        return true
    }


}

