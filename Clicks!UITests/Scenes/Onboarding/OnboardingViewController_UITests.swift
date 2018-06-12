//
//  OnboardingViewController_UITests.swift
//  Clicks!UITests
//
//  Created by Leonel Menezes on 06/06/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import XCTest

class OnboardingViewController_UITests: XCTestCase {
    
    var userDefaults: UserDefaults?
    private let app = XCUIApplication()
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false

        app.launchArguments += ["UI-Testing"]
        app.launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSwitchImageAnimation() {
        // Use recording to get started writing UI tests.
                // Use XCTAssert and related functions to verify your tests produce the correct results.
        let element = app.collectionViews.cells.children(matching: .other).element
        element.tap()
        
        let imageQuery = app.descendants(matching: .image)
        let btnLabelQuery = app.buttons.matching(identifier: "SKIP BUTTON")
        let buttonLabel1 = btnLabelQuery.element.label
        XCTAssertNotNil(buttonLabel1)
        XCTAssert(imageQuery.element.identifier == "imageOnboard1")
        element.swipeLeft()
        XCTAssert(imageQuery.element.identifier == "imageOnboard2")
        element.swipeLeft()
        XCTAssert(imageQuery.element.identifier == "imageOnboard3")
        element.swipeLeft()
        XCTAssert(imageQuery.element.identifier == "imageOnboard4")
        let buttonLabel2 = btnLabelQuery.element.label
        XCTAssertNotNil(buttonLabel2)
        XCTAssert(buttonLabel2 != buttonLabel1)
        app.buttons.matching(identifier: "SKIP BUTTON").element.tap()
        
    }
    
}
