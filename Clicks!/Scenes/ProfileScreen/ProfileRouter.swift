//
//  ProfileRouter.swift
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

@objc protocol ProfileRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
    func routeToPhotoView(photoScreen: PhotosSlideScreenCollectionViewController, photoIndex: Int)
}

protocol ProfileDataPassing
{
  var dataStore: ProfileDataStore? { get }
}

class ProfileRouter: NSObject, ProfileRoutingLogic, ProfileDataPassing
{
    
    
  weak var mainView: ProfileView?
  var dataStore: ProfileDataStore?
  
  // MARK: Routing
  
    func routeToPhotoView(photoScreen: PhotosSlideScreenCollectionViewController, photoIndex: Int) {
        photoScreen.modalPresentationStyle = .overCurrentContext
        mainView?.homeInteractionDelegate?.hideStatusBar()
        photoScreen.homeInteractorDelegate = mainView?.homeInteractionDelegate
        photoScreen.zoomableCollectionViewDelegate = mainView
        photoScreen.currentIndex = photoIndex
        mainView?.navigationController?.present(photoScreen, animated: false, completion: {
//            self.mainView.zoomOutImageToZoom()
        })
    }
    
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: ProfileViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: ProfileDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
