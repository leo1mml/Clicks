//
//  File.swift
//  Clicks!
//
//  Created by Leonel Menezes on 27/06/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import UIKit

class LastChallengesContainerCell: UITableViewCell {
    
    // MARK: - Variables
    
    ///The cell identifier of the collectionview
    var cellIdentifier = "lastChallengeCell"
    
    ///The data to be added to the collectionview
    private var challengesVieModels : MainScreen.LastChallenges.ViewModel.LastChallenges?
    
    // MARK: - UI items
    
    ///Collection view which will contain all the incoming challenges
    private var lastChallengesCollectionView = ContainerCollectionView()
    
    // MARK: - Object lifecycle
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    // MARK: - Setup methods
    
    ///Setup the collection view
    private func setupCollectionView(){
        
        addSubview(lastChallengesCollectionView)
        
        //appearance
        lastChallengesCollectionView.backgroundColor = AppColors.darkwhite.color
        
        // delegate and datasource
        lastChallengesCollectionView.dataSource = self
        lastChallengesCollectionView.delegate = self
        
        //settings
        lastChallengesCollectionView.isScrollEnabled = false
        
        //register
        lastChallengesCollectionView.register(LastChallengeCell.self, forCellWithReuseIdentifier: self.cellIdentifier)
        
        lastChallengesCollectionView.makeItFillSuperView()
    }
    
}
