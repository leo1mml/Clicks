//
//  UIImageHelper.swift
//  Clicks!
//
//  Created by Leonel Menezes on 19/06/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import UIKit

extension UIImage {
    
    /**
     Get a new image with the gaussian blur effect applied to the current one
     - Parameters:
        - image: the image reference to be modified
     */
    func getImageWithBlur() -> UIImage?{
        let context = CIContext(options: nil)
        
        guard let currentFilter = CIFilter(name: "CIGaussianBlur") else {
            return nil
        }
        let beginImage = CIImage(image: self)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        currentFilter.setValue(6.5, forKey: "inputRadius")
        guard let output = currentFilter.outputImage, let cgimg = context.createCGImage(output, from: output.extent) else {
            return nil
        }
        return UIImage(cgImage: cgimg)
    }
}
