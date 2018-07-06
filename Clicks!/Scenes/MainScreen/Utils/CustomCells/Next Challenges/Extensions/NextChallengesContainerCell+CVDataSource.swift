//
//  NextChallengesContainerCellCVDataSource.swift
//  Clicks!
//
//  Created by Leonel Menezes on 06/07/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import UIKit

extension NextChallengesContainerCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.nextChallengeCellId, for: indexPath) as! NextChallengeCell
        
        let data = indexPath.item % 2 == 0 ?
            MainScreen.NextChallenges.ViewModel.NextChallenges.NextChallenge.init(title: "Chrono Cross", coverImage: #imageLiteral(resourceName: "testImage"), startDate: "12/12") :
            MainScreen.NextChallenges.ViewModel.NextChallenges.NextChallenge.init(title: "Devil May Cry", coverImage: #imageLiteral(resourceName: "testImage2"), startDate: "12/12")
        
        cell.setData(data: data)
        
        return cell
    }
}
