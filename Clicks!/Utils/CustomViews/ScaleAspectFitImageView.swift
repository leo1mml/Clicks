//
//  ScaleAspectFitImageView.swift
//  Clicks!
//
//  Created by Leonel Menezes on 21/09/18.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import UIKit

// known-good: Xcode 8.2.1
/**
 
 UIImageView subclass which works with Auto Layout to try
 to maintain the same aspect ratio as the image it displays.
 
 This is unlike the usual behavior of UIImageView, where the
 scaleAspectFit content mode only affects what the view displays
 and not the size it prefers, and so it does not play
 well with AL constraints. In particular, UIImageView.intrinsicContentSize
 always returns each of the intrinsic size dimensions of the image
 itself, not a size that adjusts to reflect constraints on the
 view. So if you constrain the width of a UIImageView, for example,
 the view's intrinsic content size still declares a preferred
 height based on the image's intrinsic height, rather than the
 displayed height produced by the scaleAspectFit content mode.
 
 In contrast, this subclass has a few notable properties:
 
 - If you externally constraint one dimension, its internal constraints
 will then adjust the other dimension so it holds the image's aspect
 ratio.
 - Uses a low layout priority to do this. So if you externally
 require it to have an incorrect aspect ratio, you do not get conflicts.
 - Still uses the scaleAspectFit content mode internally, so if a
 client requires an incorrect aspect, you still get scaleAspectFit
 behavior to determining what is displayed within whatever
 dimensionsare finally used.
 - It is a subclass of UIImageView and supports all of UIImageView's
 initializers, so it is a drop-in substitute.
 */
public class ScaleAspectFitImageView : UIImageView
{
    /// constraint to maintain same aspect ratio as the image
//    private var aspectRatioConstraint:NSLayoutConstraint? = nil
    private var widthConstraint: NSLayoutConstraint? = nil
    private var heightConstraint: NSLayoutConstraint? = nil
    
    required public init?(coder aDecoder: NSCoder)
    {
        super.init(coder:aDecoder)
        self.setup()
    }
    
    public override init(frame:CGRect)
    {
        super.init(frame:frame)
        self.setup()
    }
    
    public override init(image: UIImage!)
    {
        super.init(image:image)
        self.setup()
    }
    
    public override init(image: UIImage!, highlightedImage: UIImage?)
    {
        super.init(image:image,highlightedImage:highlightedImage)
        self.setup()
    }
    
    override public var image: UIImage? {
        didSet {
            self.updateAspectRatioConstraint()
        }
    }
    
    private func setup()
    {
        self.contentMode = .scaleAspectFit
        self.updateAspectRatioConstraint()
    }
    
    private func configureHorizontalImage(heightRatio: CGFloat){
        self.widthConstraint = self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        self.heightConstraint = self.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * heightRatio)
    }
    
    private func configureVerticalImage(widthRatio: CGFloat){
        self.heightConstraint = self.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height)
        self.widthConstraint = self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * widthRatio)
    }
    
    /// Removes any pre-existing aspect ratio constraint, and adds a new one based on the current image
    func updateAspectRatioConstraint() {
        // remove any existing aspect ratio constraint
        if let widthConst = self.widthConstraint, let heightConst = self.heightConstraint {
            NSLayoutConstraint.deactivate([
                    widthConst,
                    heightConst
                ])
        }
        self.widthConstraint = nil
        self.heightConstraint = nil
        
        if let imageSize = image?.size, imageSize.height != 0
        {
            let widthRatio = imageSize.width/imageSize.height
            let heightRatio = imageSize.height/imageSize.width
            
            if(imageSize.width > imageSize.height && superview != nil){
                if(UIScreen.main.bounds.height < (UIScreen.main.bounds.width * heightRatio)){
                    configureVerticalImage(widthRatio: widthRatio)
                }else {
                    configureHorizontalImage(heightRatio: heightRatio)
                }
            }else if(imageSize.width < imageSize.height && superview != nil){
                if(UIScreen.main.bounds.height < (UIScreen.main.bounds.width * heightRatio)){
                    configureHorizontalImage(heightRatio: heightRatio)
                }else {
                    configureVerticalImage(widthRatio: widthRatio)
                }
            }
            NSLayoutConstraint.activate([
                self.widthConstraint!,
                self.heightConstraint!
                ])
        }
    }
}
