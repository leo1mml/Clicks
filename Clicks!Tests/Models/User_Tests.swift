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
    
    func testUserCycle() {
        user = User("123","teste@teste.com", "John Doe", "johndoe", "asdfasdf", Date(), 1)
        let coder = JSONEncoder()
        coder.dateEncodingStrategy = .iso8601
//        coder.encode(user)
        
    }
    
}
