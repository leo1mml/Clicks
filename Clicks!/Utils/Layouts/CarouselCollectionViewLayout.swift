//
//  OpenChallengesCollectionViewLayout.swift
//  Clicks!
//
//  Created by Leonel Menezes on 13/06/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import Foundation
import UIKit
/**
 Custom flow layout with a carousel effect
 - TODO: Study this class, I got this code in the ray wenderlich lecture. But honestly, I didn't understand ir very well, so I can not test it right now.
 */
class CarouselCollectionViewLayout : UICollectionViewFlowLayout {
    var standartItemHeightScale = 0.87
    var standartItemWidthScale = 0.95
    
    override func prepare() {
        super.prepare()
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        var attributesCopy = [UICollectionViewLayoutAttributes]()
        
        for itemAttributes in attributes! {
            let itemAttributesCopy = itemAttributes.copy() as! UICollectionViewLayoutAttributes
            
            changeLayoutAttributes(itemAttributesCopy)
            attributesCopy.append(itemAttributesCopy)
        }
        
        return attributesCopy
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    
    
    func changeLayoutAttributes(_ attributes: UICollectionViewLayoutAttributes) {
        let collectionCenter = collectionView!.frame.size.width/2
        let offset = collectionView!.contentOffset.x
        let normalizedCenter = attributes.center.x - offset
        
        let maxDistance = self.itemSize.width + self.minimumLineSpacing
        let distance = min(abs(collectionCenter - normalizedCenter), maxDistance)
        
        let ratio = (maxDistance - distance)/maxDistance
        
        let scaleHeight = (ratio * CGFloat(1 - self.standartItemHeightScale) + CGFloat(self.standartItemHeightScale))
        let scaleWidth = (ratio * CGFloat(1 - self.standartItemWidthScale) + CGFloat(self.standartItemWidthScale))
        
        attributes.transform3D = CATransform3DScale(CATransform3DIdentity, scaleWidth, scaleHeight, 1.0)
        
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint
    {
        
        if let collectionViewBounds = self.collectionView?.bounds
        {
            let halfWidthOfVC = collectionViewBounds.size.width * 0.5
            let proposedContentOffsetCenterX = proposedContentOffset.x + halfWidthOfVC
            if let attributesForVisibleCells = self.layoutAttributesForElements(in: collectionViewBounds)
            {
                var candidateAttribute : UICollectionViewLayoutAttributes?
                for attributes in attributesForVisibleCells
                {
                    let candAttr : UICollectionViewLayoutAttributes? = candidateAttribute
                    if candAttr != nil
                    {
                        let a = attributes.center.x - proposedContentOffsetCenterX
                        let b = candAttr!.center.x - proposedContentOffsetCenterX
                        if abs(a) < abs(b)
                        {
                            candidateAttribute = attributes
                        }
                    }
                    else
                    {
                        candidateAttribute = attributes
                        continue
                    }
                }
                
                if candidateAttribute != nil
                {
                    return CGPoint(x: candidateAttribute!.center.x - halfWidthOfVC, y: proposedContentOffset.y);
                }
            }
        }
        return CGPoint.zero
    }
}
