//
//  AppColors.swift
//  Clicks!
//
//  Created by Leonel Menezes on 25/05/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import UIKit
///Extension to help with the colors within the app
enum AppColors {
    case darkwhite
    case clearblack
    case blue
    case darkgray
    case darkGradient
    case gray
    
    private static let allValues = [darkwhite, clearblack, blue, darkgray]
    
    
    var color: UIColor {
        switch self {
        case .darkwhite:
            return UIColor(colorWithHexValue: 0xF4F4F4)
        case .blue:
            return UIColor(colorWithHexValue: 0x3B5998)
        case .darkgray:
            return UIColor(colorWithHexValue: 0x4A4A4A)
        case .clearblack:
            return UIColor(colorWithHexValue: 0x272D30)
        case .darkGradient:
            return UIColor(colorWithHexValue: 0x464F55)
        case .gray:
            return UIColor(colorWithHexValue: 0x9B9B9B)
        }
    }
}

///Helper init to work with hexadecimal color values
extension UIColor {
    convenience init(colorWithHexValue value: Int, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((value & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((value & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(value & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
