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
    private var nextChallengesCollectionView : UICollectionView?
    
    ///Next challenge cell identifier
    private var nextChallengeCellId = "nextChallengeCell"
    
    
    // MARK: - Object Lifecycle
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initCollectionView()
        setupCollectionView()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    
    // MARK: - Setup methods
    
    
    ///Initiates the collectionview
    private func initCollectionView() {
        self.nextChallengesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        guard let collectionView = nextChallengesCollectionView else {
            return
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(NextChallengeCell.self, forCellWithReuseIdentifier: self.nextChallengeCellId)
        collectionView.backgroundColor = AppColors.darkwhite.color
        
        addSubview(collectionView)
    }
    
    ///Setup the collectionview adding constraints to it
    private func setupCollectionView() {
        guard let collectionView = nextChallengesCollectionView else {
            return
        }
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
    }
}

extension NextChallengesContainerCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Delegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // MARK: - Datasource
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.nextChallengeCellId, for: indexPath) as! NextChallengeCell
        
        let data = indexPath.item % 2 == 0 ?
        MainScreen.NextChallenges.ViewModel.NextChallenges.NextChallenge.init(title: "Chrono Cross", coverImage: #imageLiteral(resourceName: "testImage"), startDate: "12/12") :
        MainScreen.NextChallenges.ViewModel.NextChallenges.NextChallenge.init(title: "Devil May Cry", coverImage: #imageLiteral(resourceName: "testImage2"), startDate: "12/12")
        
        cell.setData(data: data)
        
        return cell
    }
    
    
    // MARK: - Layout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width * (162.5 / 375), height: frame.height * (154/336))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
}
