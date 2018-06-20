//
//  OnboardingInteractor.swift
//  Clicks!
//
//  Created by Leonel Menezes on 24/05/2018.
//  Copyright (c) 2018 Leonel Menezes. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol OnboardingPresentationLogic{
    /**
     This method allows the viewcontroller to access the data from the models
     - Parameters:
     - pageNumber: the page index which you wish to access the data
     - completionHandler: The handler that you should use to use the data.
     
     */
    func accessPageData(pageNumber: Int, completionHandler: @escaping (Onboarding.PageStructure.ViewModel.SinglePage) -> Void)
}

protocol OnboardingDataStore{
    var pageStructure : Onboarding.PageStructure.ViewModel? { get set }
}

class OnboardingPresenter: OnboardingPresentationLogic, OnboardingDataStore{
    var pageStructure: Onboarding.PageStructure.ViewModel?
    
    init() {
        createPageStrutures()
    }
    // MARK: Do something
    
    func accessPageData(pageNumber: Int, completionHandler: @escaping (Onboarding.PageStructure.ViewModel.SinglePage) -> Void) {
        completionHandler((self.pageStructure?.pages[pageNumber])!)
    }
    ///Creates the data model to show in the viewcontrollers.
    func createPageStrutures() {
        let page1 = Onboarding.PageStructure.ViewModel.SinglePage(imageName: "imageOnboard1", title: NSLocalizedString("Welcome to Clicks!", comment: ""), description: NSLocalizedString("We're a social network made for people who love or will love to photograph", comment: ""))
        let page2 = Onboarding.PageStructure.ViewModel.SinglePage(imageName: "imageOnboard2", title: NSLocalizedString("Participate!", comment: ""), description: NSLocalizedString("Challenge yourself to picture various themes, participate in the challenges, vote on your favorite clicks, create references and have fun", comment: ""))
        let page3 = Onboarding.PageStructure.ViewModel.SinglePage(imageName: "imageOnboard3", title: NSLocalizedString("Discover!", comment: ""), description: NSLocalizedString("Explore clicks with different styles and perspectives made by photographers from all over the world and show us too your sight of the world", comment: ""))
        let page4 = Onboarding.PageStructure.ViewModel.SinglePage(imageName: "imageOnboard4", title: NSLocalizedString("Start Now!", comment: ""), description: NSLocalizedString("Don't be shy, during the competition all clicks are sent anonymously, only when the challenge ends the authors are revealed", comment: ""))
        self.pageStructure = Onboarding.PageStructure.ViewModel(pages: [page1, page2, page3, page4])
        
    }
}

