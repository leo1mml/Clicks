//
//  PageCell.swift
//  Clicks!Tests
//
//  Created by Leonel Menezes on 29/05/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import XCTest
@testable import Clicks_

class PageCellTests: XCTestCase {
    
    var pageCell : PageCell!
    
    func testInitWithFrame() {
        let frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        pageCell = PageCell(frame: frame)
        XCTAssertNotNil(pageCell)
    }
    
    func testInitWithCoder() {
        let archiverData = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: archiverData)
        pageCell = PageCell(coder: archiver)
        XCTAssertNil(pageCell)
    }
    
    func testDidSetHolder() {
        pageCell = PageCell()
        pageCell.holders = Onboarding.PageStructure.ViewModel.SinglePage(imageName: "image", title: "title", description: "description")
        XCTAssertTrue(pageCell.text.attributedText.string == "title\n\ndescription")
    }
    
}
