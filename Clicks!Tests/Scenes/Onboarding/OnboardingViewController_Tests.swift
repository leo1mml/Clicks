//
//  OnboardingViewController_Tests.swift
//  Clicks!Tests
//
//  Created by Leonel Menezes on 06/06/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import XCTest
@testable import Clicks_

class OnboardingViewController_Tests: XCTestCase {
    
    
    func testInitWithCoder() {
        let coder = NSCoder()
        let vc = OnboardingViewController(coder: coder)
        XCTAssertNil(vc)
    }
    
    func testInitWithLayout() {
        let layout = UICollectionViewLayout()
        let vc = OnboardingViewController(collectionViewLayout: layout)
        XCTAssertNotNil(vc)
    }
    
}
