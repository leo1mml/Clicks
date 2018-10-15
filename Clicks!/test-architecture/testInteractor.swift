//
//  testInteractor.swift
//  Clicks!
//
//  Created by Leonel Menezes on 10/10/18.
//  Copyright (c) 2018 Leonel Menezes. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol testBusinessLogic
{
  func doSomething(request: test.Something.Request)
}

protocol testDataStore
{
  //var name: String { get set }
}

class testInteractor: testBusinessLogic, testDataStore
{
  var presenter: testPresentationLogic?
  var worker: testWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: test.Something.Request)
  {
    worker = testWorker()
    worker?.doSomeWork()
    
    let response = test.Something.Response()
    presenter?.presentSomething(response: response)
  }
}