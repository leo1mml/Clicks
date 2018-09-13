//
//  ProfileCollectionViewDataSource.swift
//  Clicks!
//
//  Created by Leonel Menezes on 06/07/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import UIKit

extension ProfileView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 44
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.photoCellID, for: indexPath) as! ProfilePhotoCell
        let data = indexPath.item % 2 == 0 ? Profile.FetchPhotos.ViewModel.Photo(image: #imageLiteral(resourceName: "chronoimg"), theme: "Chrono Cross", hasTrophy: true) : Profile.FetchPhotos.ViewModel.Photo(image: #imageLiteral(resourceName: "dmcimg"), theme: "Devil May Cry", hasTrophy: false)
        cell.setData(data: data)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: self.headerCellID, for: indexPath) as! ProfileHeaderView
        let data = Profile.FetchUser.ViewModel.User(profileImage: #imageLiteral(resourceName: "chronoimg"), name: "Serge", nickName: "serge", numberOfPhotos: "44", numberOfTrophies: "44")
        headerView.setData(data: data)
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.frame.width, height: self.frame.height * (290/653))
    }
}
