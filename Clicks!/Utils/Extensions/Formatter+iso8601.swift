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
}

