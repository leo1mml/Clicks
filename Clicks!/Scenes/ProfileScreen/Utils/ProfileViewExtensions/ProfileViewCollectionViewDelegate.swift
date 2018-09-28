//
//  ProfileViewCollectionViewDelegate.swift
//  Clicks!
//
//  Created by Leonel Menezes on 06/07/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import UIKit

extension ProfileView : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let slider = PhotosSlideScreenCollectionViewController(layout: HorizontalScrollFlowLayout(), index: indexPath.item)
        
//        router?.routeToPhotoView(photoScreen: slider, photoIndex: indexPath.item)
        if let rootView = self.navigationController?.visibleViewController?.view{
            let attr = collectionView.layoutAttributesForItem(at: indexPath)
            let cellFrame = collectionView.convert(attr?.frame ?? CGRect.zero, to: rootView)
            self.imageViewToZoom.backgroundColor = .red
            self.imageViewToZoom.frame = cellFrame
            self.imageViewToZoom.image = UIImage(named: "dmcimg")
            rootView.addSubview(imageViewToZoom)
            
            let sizeZoomed = self.imageViewToZoom.calculateFrameSize(for: UIScreen.main.bounds.size)
            
            UIView.animate(withDuration: 0.5) {
                self.imageViewToZoom.frame = CGRect(origin: CGPoint(x: 0, y: UIScreen.main.bounds.height/2 - (sizeZoomed.height/2)), size: sizeZoomed)
            }
        }
        
    }
}
