//
//  User.swift
//  Clicks!
//
//  Created by Leonel Menezes on 24/05/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import Foundation

///Class that abstracts the users of this application
class User: NSObject, NSCoding {
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
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(email, forKey: "email")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(userName, forKey: "username")
        aCoder.encode(profilePhotoUrl, forKey: "profilePhotoUrl")
        aCoder.encode(birthDate, forKey: "birthDate")
        aCoder.encode(sex, forKey: "sex")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let id = aDecoder.decodeObject(forKey: "id") as! String
        let email = aDecoder.decodeObject(forKey: "email") as? String?
        let name = aDecoder.decodeObject(forKey: "name") as? String?
        let username = aDecoder.decodeObject(forKey: "username") as? String ?? "empty"
        let profilePhotoUrl = aDecoder.decodeObject(forKey: "profilePhotoUrl") as? String ?? ""
        let birthDate = aDecoder.decodeObject(forKey: "birthDate") as? Date?
        let sex = aDecoder.decodeObject(forKey: "sex") as? Int?
        self.init(id, email!, name!, username, profilePhotoUrl, birthDate!, sex!)
        
    }
}
