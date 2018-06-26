//
//  TimeIntervalHelper.swift
//  Clicks!
//
//  Created by Leonel Menezes on 25/06/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import Foundation
extension TimeInterval {
    // builds string in app's labels format 00:00.0
    func stringFormatted() -> String {
        let interval = Int(self)
        let seconds = interval % 60
        let minutes = (interval / 60) % 60
        let hours = (minutes / 60) % 24
        let days = Int(hours/24)
        return String(format: "%02dd %02dh %02dm %02ds", days, hours, minutes, seconds)
    }
}
