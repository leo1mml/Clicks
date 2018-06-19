//
//  UIImageHelper.swift
//  Clicks!
//
//  Created by Leonel Menezes on 19/06/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import UIKit

/**
 Get an image with gaussian blur effect from a view, this allows yout to create a shadow with colors for example.
 - Parameters:
 - view: view to be printed and apply blur effect.
 */
func getImageWithBlurFrom(view: UIView) -> UIImage?{
    guard var framedImage = UIView.image(from: view) else {
        return nil
    }
    applyGaussianBlurEffectToImage(image: &framedImage)
    return framedImage
}

/**
 Applies the gaussian blur effect to an image
 - Parameters:
 - image: the image reference to be modified
 */
func applyGaussianBlurEffectToImage( image: inout UIImage) {
    let context = CIContext(options: nil)
    
    guard let currentFilter = CIFilter(name: "CIGaussianBlue") else {
        return
    }
    let beginImage = CIImage(image: image)
    currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
    currentFilter.setValue(6.5, forKey: "inputRadius")
    guard let output = currentFilter.outputImage, let cgimg = context.createCGImage(output, from: output.extent) else {
        return
    }
    image = UIImage(cgImage: cgimg)
}
