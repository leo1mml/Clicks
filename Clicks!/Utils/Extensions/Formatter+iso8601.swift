//
//  DateFormatter+iso8601.swift
//  Clicks!
//
//  Created by Leonel Menezes on 30/05/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import Foundation

extension Formatter {
    ///gets the date with fractional seconds
    static let iso8601: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter
    }()
    ///gets the basic date
    static let iso8601noFS = ISO8601DateFormatter()
    
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

