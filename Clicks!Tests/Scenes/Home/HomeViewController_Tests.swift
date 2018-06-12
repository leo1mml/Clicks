//
//  HomeViewController_Tests.swift
//  Clicks!Tests
//
//  Created by Leonel Menezes on 07/06/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import XCTest
@testable import Clicks_

class HomeViewController_Tests: XCTestCase {
    
    var vc : HomeViewController?
    let initialSize = CGSize(width: 10, height: 10)
    let finalSize = CGSize(width: 100, height: 100)
    
    override func setUp() {
        vc = HomeViewController()
        vc?.maxDistanceTransformations = 100
    }
    
    func testGetItemScaleRate(){
        let scaleRateSize = vc?.getItemScaleRate(distance: 100, from: initialSize, to: finalSize)
        XCTAssert(scaleRateSize?.width == CGFloat(0.09))
    }
    
    func testItemScaleRateZeroIfDistanceIsZero() {
        let scaleRateSize = vc?.getItemScaleRate(distance: 0, from: CGSize(width: 10, height: 10), to: CGSize(width: 20, height: 20))
        XCTAssert(scaleRateSize == CGSize(width: 0, height: 0))
    }

    func testItemScaleRateZeroIfSizesAreEqual() {
        let scaleRateSize = vc?.getItemScaleRate(distance: 10, from: CGSize(width: 20, height: 20), to: CGSize(width: 20, height: 20))
        XCTAssert(scaleRateSize == CGSize(width: 0, height: 0))
    }
}
