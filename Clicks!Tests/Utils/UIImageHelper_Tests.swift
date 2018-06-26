//
//  UIImageHelper_Tests.swift
//  Clicks!Tests
//
//  Created by Leonel Menezes on 25/06/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import Foundation
import XCTest

@testable import Clicks_

class UIImageHelper_Tests: XCTestCase {
    
    var view : UIImageView?
    
    override func setUp() {
        self.view = UIImageView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 10, height: 10)))
    }
    
    func testGetImageFromView() {
        let image = UIImage(named: "testImage")?.getImageWithBlur()
        XCTAssertNotNil(image)
    }
}
