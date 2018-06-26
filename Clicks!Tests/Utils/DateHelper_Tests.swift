//
//  DateHelper_Tests.swift
//  Clicks!Tests
//
//  Created by Leonel Menezes on 25/06/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import XCTest
@testable import Clicks_

class DateHelper_Tests: XCTestCase {
    
    func testCompareEqualDates(){
        let date1 = Date(timeIntervalSince1970: 20)
        let date2 = Date(timeIntervalSince1970: 20)
        XCTAssert(Date.compareEqualDate(date1: date1, date2: date2))
    }
    
    func testCompareDifferentDates(){
        let date1 = Date(timeIntervalSince1970: 2)
        let date2 = Date(timeIntervalSince1970: 20)
        XCTAssert(!Date.compareEqualDate(date1: date1, date2: date2))
    }
    
}
