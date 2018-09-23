//
//  UIImageViewHelper.swift
//  Clicks!
//
//  Created by Leonel Menezes on 23/09/18.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func calculateFrameSize(for superViewSize: CGSize) -> CGSize{
        if let imageSize = self.image?.size{
            let widthRatio = imageSize.width/imageSize.height
            let heightRatio = imageSize.height/imageSize.width
            let expectedWidth = superViewSize.height * widthRatio
            let expectedHeight = superViewSize.width * heightRatio
            if(widthRatio > 1){
                if(expectedHeight < superViewSize.height){
                    return CGSize(width: superViewSize.width, height: expectedHeight)
                }else {
                    return CGSize(width: expectedWidth, height: superViewSize.height)
                }
            } else {
                if(expectedWidth < superViewSize.width){
                    return CGSize(width: expectedWidth, height: superViewSize.height)
                }else {
                    return CGSize(width: superViewSize.width, height: expectedHeight)
                }
            }
        }
        return self.frame.size
    }
}
