//
//  File.swift
//  Clicks!
//
//  Created by Leonel Menezes on 12/06/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import Foundation

extension Date {
    
    /**
     Converts the date into a string without the milisseconds and retruns true if the two strings match.
     - Parameters:
     
     -date1: First date to be compared
     -date2: Second date to be compared
     
     - Returns: True if dates are equal, false if not
     */
    static func compareEqualDate(date1: Date, date2: Date) -> Bool{
        return Formatter.iso8601noFS.string(from: date1) == Formatter.iso8601noFS.string(from: date2)
    }
}
