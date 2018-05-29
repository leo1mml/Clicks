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
        
        window = UIWindow()
        window?.makeKeyAndVisible()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let onboardingViewController = OnboardingViewController(collectionViewLayout: layout)
        let navigationController = UINavigationController(rootViewController: onboardingViewController)
        navigationController.isNavigationBarHidden = true
        
        window?.rootViewController = navigationController
        
        
        return true
    }


}

