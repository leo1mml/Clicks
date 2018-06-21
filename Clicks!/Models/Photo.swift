//
//  Photo.swift
//  Clicks!
//
//  Created by Leonel Menezes on 24/05/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import Foundation

///This class abstracts the photos of the challenges
class Photo: NSObject, Codable {
    ///The photo ID in the database
    let id: String?
    ///The photo url to be downloaded.
    let url: String?
    ///The photo owner's id
    let ownerId: String
    ///The challenge id which this photo belongs
    let challengeId: String
    ///Number of votes of this photo
    let votes : [String]?
    ///Indicates wether this photo has won the challenge or not
    let hasWon : Bool
    
    init(_ id: String? = nil, _ url: String? = nil, _ ownerId: String, _ challengeId: String, _ votes: [String]?, _ hasWon: Bool) {
        self.id = id
        self.url = url
        self.ownerId = ownerId
        self.challengeId = challengeId
        self.votes = votes
        self.hasWon = hasWon 
    }
}
