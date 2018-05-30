//
//  User_Tests.swift
//  Clicks!Tests
//
//  Created by Leonel Menezes on 29/05/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import XCTest
@testable import Clicks_

class User_Tests: XCTestCase {
    
    var user : User?
    
    override func setUp() {
        user = User("123","teste@teste.com", "John Doe", "johndoe", "asdfasdf", Date(), 1)
    }
    
    func testUserCycle() {
        let coder = JSONEncoder()
        let decoder = JSONDecoder()
        coder.dateEncodingStrategy = .iso8601
        decoder.dateDecodingStrategy = .iso8601
        let encodedData = try? coder.encode(user)
        XCTAssertNotNil(encodedData)
        let decodedData = try? decoder.decode(User.self, from: encodedData!)
        XCTAssertNotNil(decodedData)
        XCTAssert(Formatter.iso8601noFS.string(from: (user?.birthDate)!) == Formatter.iso8601noFS.string(from: decodedData!.birthDate!), "Decoded Birth date did not match the original date")
        XCTAssert(decodedData?.name == user?.name, "Decoded User name did not match the original name")
        XCTAssert(decodedData?.email == user?.email, "Decoded E-mail did not match the original e-mail")
        XCTAssert(decodedData?.profilePhotoUrl == user?.profilePhotoUrl, "Decoded Profile photo url did not match the original url")
        XCTAssert(decodedData?.id == user?.id, "Decoded ID did not match the original ID")
        XCTAssert(decodedData?.sex == user?.sex, "Decoded sex date did not match the original sex")
        XCTAssert(decodedData?.userName == user?.userName, "Decoded username date did not match the original username")
    }
    
}
