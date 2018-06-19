//
//  UIViewHelper.swift
//  Clicks!
//
//  Created by Leonel Menezes on 18/06/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import UIKit

extension UIView {
    
    /**
        makes a drop shadow behind the view with a default configuration
     */
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    /// Lets you add a shadow to a view with custom config
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true, cornerRadius: CGFloat = 0.0, borderColor: UIColor = .lightGray) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        layer.cornerRadius = cornerRadius
        
        layer.borderColor = borderColor.cgColor
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }

    
    /**
     Captures an image from a view, similar to a print screen
     - Warning: It is not that performatically...
     - Parameters:
        - view: the view to be printed
     */
    public static func image(from view: UIView) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, 0.0)
        defer { UIGraphicsEndImageContext() }
        if let context = UIGraphicsGetCurrentContext() {
            view.layer.render(in: context)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            return image
        }
        return nil
    }
    
    
    /**
     Aplly a grandient through the whole view
     - Parameters:
        - colours: the colors of the gradient.
     */
    func applyGradient(colours: [UIColor]) -> Void {
        self.applyGradient(colours: colours, locations: nil)
    }
    
    
    /**
     Applies a gradient to a view with determined colors and locations
     - Parameters:
        - colours: the colors of the gradient
        - locations: the locations of the colors of the gradient
     */
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.cornerRadius = self.layer.cornerRadius
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        gradient.zPosition = self.layer.zPosition + 5
        self.layer.addSublayer(gradient)
    }
}
