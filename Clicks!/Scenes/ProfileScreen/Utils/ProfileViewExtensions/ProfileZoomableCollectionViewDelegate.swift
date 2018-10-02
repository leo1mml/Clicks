//
//  ProfileZoomableCollectionViewDelegate.swift
//  Clicks!
//
//  Created by Leonel Menezes on 01/10/18.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import UIKit

extension ProfileView: ZoomableCollectionViewDelegate {
    func updateZoomedInFrame(image: UIImage, item: Int) {
        self.imageViewToZoom.image = image
        self.imageViewToZoom.frame = getZoomedImageFrame(from: self.imageViewToZoom)
    }
    
//    func updateZoomedOutFrame(collectionView: UICollectionView,indexPath: IndexPath) {
////        self.containerCollectionView.collectionViewLayout.invalidateLayout()
//        DispatchQueue.main.async {
////            self.containerCollectionView.scrollToItem(at: indexPath, at: .centeredVertically, animated: false)
////            self.cellCover.frame = self.getCellFrameFrom(collectionView: self.containerCollectionView, at: indexPath)
////            collectionView.becomeFirstResponder()
//        }
//    }
//
    func animateZoomedImageBack(indexPath: IndexPath) {
        self.containerCollectionView.alpha = 0
//        self.containerCollectionView.collectionViewLayout.invalidateLayout()
        DispatchQueue.main.async {
            self.containerCollectionView.scrollToItem(at: indexPath, at: .centeredVertically, animated: false)
            UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseInOut, animations: {
                self.imageViewToZoom.frame = self.getCellFrameFrom(collectionView: self.containerCollectionView, at: indexPath)
                self.backgroundFader.backgroundColor = .clear
                self.containerCollectionView.alpha = 1
            }, completion: { (complete) in
                self.imageViewToZoom.removeFromSuperview()
                self.backgroundFader.removeFromSuperview()
            })
        }
    }
    
    
    func getCellFrameFrom(collectionView: UICollectionView, at indexPath: IndexPath) -> CGRect{
        if let rootView = self.navigationController?.visibleViewController?.view {
            let attr = collectionView.layoutAttributesForItem(at: indexPath)
            let cellFrame = collectionView.convert(attr?.frame ?? CGRect.zero, to: rootView)
            if(!rootView.subviews.contains(self.backgroundFader) && !rootView.subviews.contains(self.imageViewToZoom)){
                rootView.addSubview(self.backgroundFader)
                rootView.addSubview(self.imageViewToZoom)
            }
            
            return cellFrame
        }
        return CGRect.zero
    }
    
    func scaleCellToFullScreen(from initialFrame: CGRect,with image: UIImage, completion: @escaping () -> Void) {
        self.imageViewToZoom.frame = initialFrame
        self.imageViewToZoom.backgroundColor = .red
        self.imageViewToZoom.image = image
        
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseInOut, animations: {
            self.imageViewToZoom.frame = self.getZoomedImageFrame(from: self.imageViewToZoom)
            self.backgroundFader.backgroundColor = AppColors.clearblack.color
        }) { (complete) in
            completion()
        }
    }
    
    func getZoomedImageFrame(from imageView: UIImageView) -> CGRect {
        let size = imageView.calculateFrameSize(for: UIScreen.main.bounds.size)
        let finalFrame = CGRect(origin: CGPoint(x: 0, y: UIScreen.main.bounds.height/2 - (size.height/2)), size: size)
        return finalFrame
    }
}
