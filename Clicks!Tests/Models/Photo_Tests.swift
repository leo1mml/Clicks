//
//  Photo_Tests.swift
//  Clicks!Tests
//
//  Created by Leonel Menezes on 29/05/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import XCTest
@testable import Clicks_

class Photo_Tests: XCTestCase {
    
    
    var photo : Photo?
    
    override func setUp() {
        photo = Photo("123", "www.img.com", "123", "123", [], false)
    }
    
    func testPhotoCycle() {
        let coder = JSONEncoder()
        let decoder = JSONDecoder()
        coder.dateEncodingStrategy = .iso8601
        decoder.dateDecodingStrategy = .iso8601
        let encodedData = try? coder.encode(photo)
        XCTAssertNotNil(encodedData)
        let decodedData = try? decoder.decode(User.self, from: encodedData!)
        XCTAssertNotNil(decodedData)
        XCTAssert(decodedData?.id == photo?.id)
    }
}
