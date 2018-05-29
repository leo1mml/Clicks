//
//  AppColors_Tests.swift
//  Clicks!Tests
//
//  Created by Leonel Menezes on 29/05/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import XCTest
@testable import Clicks_

class AppColors_Tests: XCTestCase {
    
    func testColorVar() {
        XCTAssertTrue(AppColors.darkwhite.color == UIColor(colorWithHexValue: 0xF4F4F4))
        XCTAssertTrue(AppColors.blue.color == UIColor(colorWithHexValue: 0x3B5998))
        XCTAssertTrue(AppColors.darkgray.color == UIColor(colorWithHexValue: 0x4A4A4A))
        XCTAssertTrue(AppColors.darkGradient.color == UIColor(colorWithHexValue: 0x464F55))
        XCTAssert(AppColors.clearblack.color == UIColor(colorWithHexValue: 0x272D30), "Color do not match")
    }
}
