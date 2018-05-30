//
//  User.swift
//  Clicks!
//
//  Created by Leonel Menezes on 24/05/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import Foundation

///Class that abstracts the users of this application
class User: NSObject, Codable {
    ///Id of the user at the database
    let id: String?
    ///E-mail of this user
    let email: String?
    ///Name of this user
    var name: String?
    ///Username/Nickname choosen by this user
    var userName: String?
    ///Profile photo url to be shown when needed
    var profilePhotoUrl: String?
    ///User's birthdate.
    var birthDate : Date?
    ///User's sex
    var sex : Int?
    
    init(_ id: String? = nil, _ email: String?, _ name: String?, _ username: String?, _ profilePhotoUrl: String? , _ birthDate: Date?, _ sex : Int?) {
        self.id = id
        self.email = email
        self.name = name
        self.userName = username
        self.profilePhotoUrl = profilePhotoUrl
        self.birthDate = birthDate
        self.sex = sex
    }
}
