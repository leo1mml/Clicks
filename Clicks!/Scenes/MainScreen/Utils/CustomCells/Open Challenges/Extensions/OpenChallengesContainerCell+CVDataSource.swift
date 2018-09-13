//
//  OpenChallengesContainerCell+CVDataSource.swift
//  Clicks!
//
//  Created by Leonel Menezes on 06/07/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import UIKit

extension OpenChallengesContainerCell : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: openChallengeCellId, for: indexPath) as! OpenChallengeCell
        let data = indexPath.item % 2 == 0 ?
            MainScreen.OpenChallenges.ViewModel.OpenChallenges.OpenChallenge(title: "Chrono cross", numberOfPhotos: "44", coverImage: #imageLiteral(resourceName: "chronoimg"), startDate: Date(), isOnVotationPeriod: true) :
            MainScreen.OpenChallenges.ViewModel.OpenChallenges.OpenChallenge(title: "Devil May Cry", numberOfPhotos: "44", coverImage: #imageLiteral(resourceName: "dmcimg"), startDate: Date(), isOnVotationPeriod: true)
        cell.setCellData(data)
        return cell
    }
}
