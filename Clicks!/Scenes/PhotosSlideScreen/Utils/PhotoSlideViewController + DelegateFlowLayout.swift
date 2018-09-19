//
//  PhotoSlideViewController + DataSource.swift
//  Clicks!
//
//  Created by Leonel Menezes on 18/09/18.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import Foundation
import UIKit


extension PhotosSlideScreenViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
