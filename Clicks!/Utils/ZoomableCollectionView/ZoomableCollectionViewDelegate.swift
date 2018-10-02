//
//  ZoomableCollectionViewDelegate.swift
//  Clicks!
//
//  Created by Leonel Menezes on 01/10/18.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import UIKit

protocol ZoomableCollectionViewDelegate {
    func animateZoomedImageBack(indexPath: IndexPath) 
    func updateZoomedInFrame(image: UIImage ,item: Int)
    func getZoomedImageFrame(from imageView: UIImageView) -> CGRect
    func scaleCellToFullScreen(from initialFrame: CGRect,with image: UIImage, completion: @escaping () -> Void)
    func getCellFrameFrom(collectionView: UICollectionView, at indexPath: IndexPath) -> CGRect
}
