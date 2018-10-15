//
//  OpenChallengesContainerCell+CVDelegate.swift
//  Clicks!
//
//  Created by Leonel Menezes on 10/10/18.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import UIKit

extension OpenChallengesContainerCell : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.openChallengeCellId, for: indexPath) as! OpenChallengeCell

//        let initialViewModel = ChallengeScreen.ChallengeData.ViewModel.
        self.router?.routeToOpenChallenge()
    }
}
