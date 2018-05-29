//
//  HomePresenter.swift
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

protocol HomePresentationLogic
{
  func presentOpenChallenges(response: Home.GetOpenChallenges.Response)
}

class HomePresenter: HomePresentationLogic
{
  weak var viewController: HomeDisplayLogic?
  
  // MARK: Do something
  
  func presentOpenChallenges(response: Home.GetOpenChallenges.Response)
  {
    var displayedOpenChallenges : [Home.GetOpenChallenges.ViewModel.DisplayedChallenge] = []
    for challenge in response.openChallenges {
        //do something with the challenge
        //calculate the time left for the event
        
        let displayedChallenge = Home.GetOpenChallenges.ViewModel.DisplayedChallenge(coverPhotoUrl: challenge.id, timeLeft: "", theme: challenge.theme, isInVotationPeriod: challenge.isInVotationPeriod, numberOfPhotos: challenge.numPhotos)
        
        displayedOpenChallenges.append(displayedChallenge)
    }
    
    let viewModel = Home.GetOpenChallenges.ViewModel(challenges: displayedOpenChallenges)
    viewController?.displayOpenChallenges(viewModel: viewModel)
  }
}
