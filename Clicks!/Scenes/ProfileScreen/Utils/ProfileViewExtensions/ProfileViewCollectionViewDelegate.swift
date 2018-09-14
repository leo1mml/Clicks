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
        router?.routeToPhotoView(photoScreen: PhotosSlideScreenViewController(), photoIndex: indexPath.item)
    }
}
