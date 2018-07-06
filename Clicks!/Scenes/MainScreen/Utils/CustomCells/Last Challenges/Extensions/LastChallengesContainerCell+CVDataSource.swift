//
//  LastChallengesContainerCell+CVDataSource.swift
//  Clicks!
//
//  Created by Leonel Menezes on 06/07/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import UIKit

extension LastChallengesContainerCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as! LastChallengeCell
        let data = indexPath.item % 2 == 0 ? MainScreen.LastChallenges.ViewModel.LastChallenges.LastChallenge.init(winnerProfileImage: #imageLiteral(resourceName: "testImage"), challengeWinnerImage: #imageLiteral(resourceName: "testImage2"), winnerName: "Serge")
            :
            MainScreen.LastChallenges.ViewModel.LastChallenges.LastChallenge.init(winnerProfileImage: #imageLiteral(resourceName: "testImage2"), challengeWinnerImage: #imageLiteral(resourceName: "testImage"), winnerName: "Dante")
        
        cell.setCellData(data: data)
        
        return cell
    }
}
