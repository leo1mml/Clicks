//
//  AppDelegate.swift
//  Clicks!
//
//  Created by Leonel Menezes on 21/05/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        resetStateIfUITesting()
        
        self.setupWindow()
        return true
    }
    
    private func resetStateIfUITesting() {
        if ProcessInfo.processInfo.arguments.contains("UI-Testing") {
            UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        }
    }
}

extension AppDelegate {
    
    /// Makes the initial setups of the application window
    private func setupWindow() {
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = AppDelegateHelper.createRootViewController()
    }
}

