//
//  MainScreenModels.swift
//  Clicks!
//
//  Created by Leonel Menezes on 12/06/2018.
//  Copyright (c) 2018 Leonel Menezes. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum MainScreen
{
    enum OpenChallenges {
        struct ViewModel {
            struct OpenChallenges {
                struct OpenChallenge {
                    var title : String
                    var numberOfPhotos : String
                    var coverImage : UIImage
                    var startDate : Date
                    var isOnVotationPeriod: Bool
                }
                var challenges: [OpenChallenge]
            }
        }
    }
    
    enum LastChallenges {
        struct ViewModel {
            struct LastChallenges {
                struct LastChallenge {
                    var winnerProfileImage : UIImage
                    var challengeWinnerImage: UIImage
                    var winnerName : String
                }
                var challenges: [LastChallenge]
            }
        }
    }
    
    enum NextChallenges {
        struct ViewModel {
            struct NextChallenges {
                struct NextChallenge {
                    var title: String
                    var coverImage: UIImage
                    var startDate: String
                }
                var challenges: [NextChallenges]
            }
        }
    }
}

