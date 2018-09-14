//
//  PhotosSlideScreenPresenter.swift
//  Clicks!
//
//  Created by Leonel Menezes on 14/09/2018.
//  Copyright (c) 2018 Leonel Menezes. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol PhotosSlideScreenPresentationLogic
{
  func presentSomething(response: PhotosSlideScreen.Something.Response)
}

class PhotosSlideScreenPresenter: PhotosSlideScreenPresentationLogic
{
  weak var viewController: PhotosSlideScreenDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: PhotosSlideScreen.Something.Response)
  {
    let viewModel = PhotosSlideScreen.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
