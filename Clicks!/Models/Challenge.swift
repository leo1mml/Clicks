
import Foundation
///This class represents the challenges of the photo competitions.
class Challenge {
    
    ///Challenge ID in the database
    let id: String
    ///The Theme of the challenge which people should take photos.
    let theme: String
    ///Date when the challenge begins
    let startDate: Date
    ///Date when people can no longer post photos
    let postDateLimit: Date
    ///Date when the challenge ends
    let endDate: Date
    ///Cover image of the challenge
    let imageUrl: String
    ///Number of photos tha the challenge currently has.
    let numPhotos: Int
    ///Name of the winner of the challenge, if the challenge has one.
    var winner: String?
    
    /// Checks if the challenge is already over by comparing the end date with the current date
    var isOver: Bool {
        
        get {
            return endDate.compare(Date()) == .orderedAscending
        }
    }
    /// Checks if the challenge has already begun by comparing the start date with the current date
    var hasBegun: Bool {
        
        get {
            return startDate.compare(Date()) == .orderedAscending
        }
    }
    
    ///Checks if the challenge has already begun and is not over yet.
    var isHappening: Bool {
        
        get {
            return hasBegun && !isOver
        }
    }
    
    var isInVotationPeriod: Bool {
        
        get {
            return true
        }
    }
    
    init(_ id: String, _ theme: String, _ startDate: Date, _ postDateLimit: Date, _ endDate: Date, _ imageUrl: String, _ numPhotos: Int, _ winner: String?) {
        self.id = id
        self.theme = theme
        self.startDate = startDate
        self.postDateLimit = postDateLimit
        self.endDate = endDate
        self.imageUrl = imageUrl
        self.numPhotos = numPhotos
        self.winner = winner
    }
}
