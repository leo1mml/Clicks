//
//  OpenChallengesCell.swift
//  Clicks!
//
//  Created by Leonel Menezes on 13/06/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import Foundation
import UIKit
///Container to all the challenges
class OpenChallengesContainerCell: UITableViewCell {
    
    // MARK: - Screen Items
    
    ///Collection View to store the challenges view model
    private var openChallengesCollectionView : UICollectionView?
    
    ///Page Control to track the current displayed challenge
    private var pageControl : UIPageControl = {
        let pageControl = UIPageControl()
        return pageControl
    }()
    
    // MARK: - Variables
    private let openChallengeCellId = "openChallengeCell"
    
    // MARK: - Object life cycle
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    
    // MARK: - CollectionView Configuration
    
    ///Initializes the collection view with all the preset configurations
    func initCollectionView () {
        self.openChallengesCollectionView = UICollectionView(frame: CGRect(origin: self.frame.origin, size: CGSize.zero), collectionViewLayout: UICollectionViewLayout())
        
        guard let collectionView = self.openChallengesCollectionView else {
            return
        }
        setupCollectionView(collectionView: collectionView)
        configureFlowLayout(collectionView: collectionView)
    }
    
    /**
     This method sets up the initial configurations of the collection view
     - Parameters:
        - collectionView: The collection view to be configured
     */
    func setupCollectionView(collectionView: UICollectionView) {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = AppColors.darkwhite.color
        collectionView.register(OpenChallengeCell.self, forCellWithReuseIdentifier: openChallengeCellId)
        collectionView.collectionViewLayout = CarouselCollectionViewLayout()
        self.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 16)
            ])
    }
    
    /**
     This method configures the custom flow layout of the collection view in order to display it correctly
     - Parameters:
        - collectionView: The collectionView which has the custom flow layout.
     */
    func configureFlowLayout(collectionView: UICollectionView){
        if let layout = collectionView.collectionViewLayout as? CarouselCollectionViewLayout {
            layout.scrollDirection = .horizontal
            layout.itemSize = CGSize(width: self.frame.width * 0.605, height: self.frame.height * 0.9)
            layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
            layout.minimumLineSpacing = 0
            layout.minimumInteritemSpacing = 0
        }
    }
}

// MARK: - Extension Collection View

extension OpenChallengesContainerCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    // MARK: - Datasource
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: openChallengeCellId, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width * (338/375), height: self.frame.height * (358/self.frame.height))
    }

}
