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
    private var cellIdentifier = "lastChallengeCell"
    
    ///The data to be added to the collectionview
    private var challengesVieModels : MainScreen.LastChallenges.ViewModel.LastChallenges?
    
    // MARK: - UI items
    
    ///Collection view which will contain all the incoming challenges
    private var lastChallengesCollectionView : UICollectionView?
    
    // MARK: - Object lifecycle
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initCollectionView()
        setupCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    // MARK: - Setup methods
    
    private func initCollectionView() {
        self.lastChallengesCollectionView = UICollectionView(frame: CGRect(origin: .zero, size: .zero), collectionViewLayout: UICollectionViewFlowLayout())
        lastChallengesCollectionView?.translatesAutoresizingMaskIntoConstraints = false
        guard let collectionView = lastChallengesCollectionView else {
            return
        }
        addSubview(collectionView)
        
    }
    
    ///Setup the collection view
    private func setupCollectionView(){
        
        guard let collectionView = lastChallengesCollectionView else {
            return
        }
        
        //appearance
        collectionView.backgroundColor = AppColors.darkwhite.color
        
        // delegate and datasource
        collectionView.dataSource = self
        collectionView.delegate = self
        
        //settings
        collectionView.isScrollEnabled = false
        
        //register
        collectionView.register(LastChallengeCell.self, forCellWithReuseIdentifier: self.cellIdentifier)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
            ])
    }
    
}


extension LastChallengesContainerCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width * (105/375), height: self.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    
}
