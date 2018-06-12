//
//  Challenge_Tests.swift
//  Clicks!Tests
//
//  Created by Leonel Menezes on 29/05/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import XCTest
@testable import Clicks_

class Challenge_Tests: XCTestCase {
    
    
    var currentChallenge : Challenge?
    var nextChallenge : Challenge?
    var pastChallenge : Challenge?
    var winner : User?
    let oneDay = TimeInterval(exactly: 60 * 60 * 24)
    
    func createCurrentChallenge() {
        let startDate = Date().addingTimeInterval(-oneDay! * 4)
        currentChallenge = Challenge("123", "Birds", startDate, startDate.addingTimeInterval(oneDay! * 3), startDate.addingTimeInterval(oneDay! * 5), "image.com", 0, nil)
    }
    
    func createNextChallenge() {
        let startDate = Date().addingTimeInterval(oneDay! * 10)
        nextChallenge = Challenge("321", "Cows", startDate, startDate.addingTimeInterval(oneDay! * 3), startDate.addingTimeInterval(oneDay! * 7), "image.com", 0, nil)
    }
    
    func createPastChallenge() {
        let startDate = Date().addingTimeInterval(-(oneDay! * 10))
        winner = User("123","teste@teste.com", "John Doe", "johndoe", "asdfasdf", Date(), 1)
        pastChallenge = Challenge("213", "Horses", startDate, startDate.addingTimeInterval(oneDay! * 3), startDate.addingTimeInterval(oneDay! * 7), "image.com", 0, nil)
    }
    
    override func setUp() {
        createCurrentChallenge()
        createNextChallenge()
        createPastChallenge()
    }
    
    func testChallengeCycle() {
        let coder = JSONEncoder()
        let decoder = JSONDecoder()
        coder.dateEncodingStrategy = .iso8601
        decoder.dateDecodingStrategy = .iso8601
        let encodedData = try? coder.encode(currentChallenge)
        XCTAssertNotNil(encodedData)
        let decodedData = try? decoder.decode(Challenge.self, from: encodedData!)
        XCTAssertNotNil(decodedData)
        XCTAssert(Date.compareEqualDate(date1: (currentChallenge?.startDate)!, date2: (decodedData?.startDate)!), "Start dates are not equal")
        XCTAssert(Date.compareEqualDate(date1: (currentChallenge?.endDate)!, date2: (decodedData?.endDate)!), "End dates are not equal")
        XCTAssert(Date.compareEqualDate(date1: (currentChallenge?.postDateLimit)!, date2: (decodedData?.postDateLimit)!), "Post dates are not equal")
        XCTAssert(currentChallenge?.id == decodedData?.id, "IDs do not match")
    }
    
    func testIsOnVotation(){
        XCTAssert((currentChallenge?.isInVotationPeriod)!)
    }
    
    func testIsNotOnVotation() {
        XCTAssert(!(pastChallenge?.isInVotationPeriod)!)
        XCTAssert(!(nextChallenge?.isInVotationPeriod)!)
    }
    
    func testIsHappening() {
        XCTAssert((currentChallenge?.isHappening)!)
    }
    
    func testIsNotOver(){
        XCTAssert(!(currentChallenge?.isOver)!)
        XCTAssert(!(nextChallenge?.isOver)!)
    }
    
    func testIsOver() {
        XCTAssert((pastChallenge?.isOver)!)
    }
    
    func testIsNotHappening() {
        XCTAssert(!(pastChallenge?.isHappening)!)
        XCTAssert(!(nextChallenge?.isHappening)!)
    }
}
