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
        self.setupWindow()
        return true
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

