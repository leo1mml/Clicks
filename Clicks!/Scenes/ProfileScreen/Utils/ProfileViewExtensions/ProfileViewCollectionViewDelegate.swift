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
        
        let cellFrame = getCellFrameFrom(collectionView: collectionView, at: indexPath)
        scaleCellToFullScreen(from: cellFrame, with: (indexPath.item % 2 == 0 ? UIImage(named: "chronoimg") : UIImage(named: "dmcimg"))!) {
            let slider = PhotosSlideScreenCollectionViewController(layout: HorizontalScrollFlowLayout(), index: indexPath.item)
            
            self.router?.routeToPhotoView(photoScreen: slider, photoIndex: indexPath.item)
        }
    }
}

