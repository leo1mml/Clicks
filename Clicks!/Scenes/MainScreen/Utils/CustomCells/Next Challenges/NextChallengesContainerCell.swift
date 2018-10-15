//
//  NextChallengesContainerCell.swift
//  Clicks!
//
//  Created by Leonel Menezes on 28/06/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import UIKit

class NextChallengesContainerCell: UITableViewCell {
    // MARK: - Variables
    
    ///Collection view which will store the next challenges
    private var nextChallengesCollectionView = ContainerCollectionView()
    
    ///Next challenge cell identifier
    var nextChallengeCellId = "nextChallengeCell"
    
    
    // MARK: - Object Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCollectionView()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    
    // MARK: - Setup methods
    
    
    ///Initiates the collectionview
    private func setupCollectionView() {
        nextChallengesCollectionView.delegate = self
        nextChallengesCollectionView.dataSource = self
        nextChallengesCollectionView.register(NextChallengeCell.self, forCellWithReuseIdentifier: self.nextChallengeCellId)
        nextChallengesCollectionView.backgroundColor = AppColors.darkwhite.color
        addSubview(nextChallengesCollectionView)
        
        nextChallengesCollectionView.makeItFillSuperView()
    }
}


