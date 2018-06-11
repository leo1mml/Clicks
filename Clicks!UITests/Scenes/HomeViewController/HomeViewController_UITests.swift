//
//  HomeViewController_UITests.swift
//  Clicks!UITests
//
//  Created by Leonel Menezes on 11/06/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import XCTest

class HomeViewController_UITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAnimations() {
        
        let app = XCUIApplication()
        let element = app.collectionViews.cells.children(matching: .other).element
        
        let homeImage = app.descendants(matching: .image).matching(identifier: "HomeImage").element
        let profileImage = app.descendants(matching: .image).matching(identifier: "ProfileImage").element
        
        XCTAssert(homeImage.frame == CGRect(origin: CGPoint(x: 170, y: 27.5), size: CGSize(width: 35, height: 40)))
        XCTAssert(profileImage.frame == CGRect(origin: CGPoint(x: 329, y: 32.5), size: CGSize(width: 26, height: 30)))
        element/*@START_MENU_TOKEN@*/.swipeLeft()/*[[".swipeUp()",".swipeLeft()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        
    }
    
}
