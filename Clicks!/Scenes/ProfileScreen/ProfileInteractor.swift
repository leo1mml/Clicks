//
//  ProfileInteractor.swift
//  Clicks!
//
//  Created by Leonel Menezes on 13/06/2018.
//  Copyright (c) 2018 Leonel Menezes. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ProfileBusinessLogic
{
  
}

protocol ProfileDataStore
{
  //var name: String { get set }
}

class ProfileInteractor: ProfileBusinessLogic, ProfileDataStore
{
  var presenter: ProfilePresentationLogic?
  var worker: ProfileWorker?

}
