//
//  OnboardingPresenter.swift
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

protocol OnboardingPresentationLogic
{
    func presentSomething(response: Onboarding.PageStructure.ViewModel)
}

class OnboardingPresenter: OnboardingPresentationLogic
{
    weak var viewController: OnboardingDisplayLogic?
    
    // MARK: Do something
    
    func presentSomething(response: Onboarding.PageStructure.ViewModel)
    {
        let viewModel = Onboarding.PageStructure.ViewModel(pages: [])
        viewController?.displaySomething(viewModel: viewModel)
    }
}

