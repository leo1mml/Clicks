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
    
    override func setUp() {
        vc = HomeViewController()
        vc?.maxDistanceTransformations = 100
    }
    
    func testGetItemScaleRate(){
        let initialSize = CGSize(width: 10, height: 10)
        let finalSize = CGSize(width: 15, height: 15)
        let scaleRateSize = vc?.getItemScaleRate(distance: 100, from: initialSize, to: finalSize)
        XCTAssert(scaleRateSize?.width == CGFloat(0.00333333333333333))
    }
    
//    func testItemScaleRateZeroIfDistanceIsZero() {
//        let scaleRate = vc?.getItemScaleRate(distance: 0, from: CGSize(width: 10, height: 10), to: CGSize(width: 20, height: 20))
//        XCTAssert(scaleRate == CGFloat(0))
//    }
//
//    func testItemScaleRateZeroIfSizesAreEqual() {
//        let scaleRate = vc?.getItemScaleRate(distance: 10, from: CGSize(width: 20, height: 20), to: CGSize(width: 20, height: 20))
//        XCTAssert(scaleRate == CGFloat(0))
//    }
}
