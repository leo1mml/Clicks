//
//  AppDelegateHelper.swift
//  Clicks!
//
//  Created by Gabriel Reynoso on 30/05/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import UIKit

private let kOnboardingPresented = "kOnboardingPresented"

/// This enum works like a namespace that holds the methods needed to deal with onboarding
/// complex tasks in the AppDelegate
enum AppDelegateHelper {
    
    /// Is the first access to the app
    static var onboardingWasPresented: Bool {
        return UserDefaults.standard.bool(forKey: kOnboardingPresented)
    }
    
    /// The user onboarding should be presented
    static var shouldPresentOnboarding: Bool {
        
        if !onboardingWasPresented {
            self.markOnboardingPresented()
        }
        
        return !onboardingWasPresented
    }
    
    /// Marks in the user defaults that the app was already accessed
    private static func markOnboardingPresented() {
        UserDefaults.standard.set(true, forKey: kOnboardingPresented)
    }
    
    /// Creates an instance of a navigation contoller with an OnboardingViewController in its root
    /// to be presented as the root view controller of the application
    private static func createOnboardingRootViewController() -> UIViewController {
        
        return {
            let navigationController = UINavigationController(
                rootViewController: OnboardingViewController(
                    collectionViewLayout: HorizontalScrollFlowLayout()
                )
            )
            navigationController.isNavigationBarHidden = true
            
            return navigationController
            }()
    }
    
    // TODO: Implement
    /// Creates the home root view controller
    private static func createHomeRootViewController() -> UIViewController {
        return UIStoryboard(name: "HomeScreen", bundle: nil).instantiateViewController(withIdentifier: "Home")
    }
    
    /// Creates the app root view controller
    static func createRootViewController() -> UIViewController {
        
        if self.shouldPresentOnboarding {
            return createOnboardingRootViewController()
        } else {
            return createHomeRootViewController()
        }
    }
}
