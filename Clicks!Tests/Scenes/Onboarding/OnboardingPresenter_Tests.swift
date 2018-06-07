//
//  OnboardingInteractor_Tests.swift
//  Clicks!Tests
//
//  Created by Leonel Menezes on 29/05/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import XCTest

class OnboardingInteractor_Tests: XCTestCase {
    
    var presenter : OnboardingPresenter!
    
    func testInit() {
        presenter = OnboardingPresenter()
        XCTAssertNotNil(presenter)
    }
    
    
    func testAccessInteractorPageData() {
        presenter = OnboardingPresenter()
        for index in 0...3 {
            presenter.accessPageData(pageNumber: index) { (structure) in
                XCTAssertNotNil(structure.description)
                XCTAssertNotNil(structure.title)
            }
        } 
    }
    
}
