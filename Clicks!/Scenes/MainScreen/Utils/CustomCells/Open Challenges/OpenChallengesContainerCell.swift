//
//  OpenChallengesCell.swift
//  Clicks!
//
//  Created by Leonel Menezes on 13/06/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import Foundation
import UIKit
import LXPageControl

///Container to all the challenges
class OpenChallengesContainerCell: UITableViewCell {
    
    // MARK: - Screen Items
    
    ///Collection View to store the challenges view model
    private var openChallengesCollectionView : UICollectionView?
    
    ///View model for the open challenges
    private var openChallengesViewModel : MainScreen.OpenChallenges.ViewModel.OpenChallenges?
    
    ///Page Control to track the current displayed challenge
    private var pageControl : LXPageControl = {
        let pageControl = LXPageControl()
        pageControl.inactiveColor = UIColor(colorWithHexValue: 0xD8D8D8)
        pageControl.activeColor = AppColors.clearblack.color
        pageControl.backgroundColor = .clear
        pageControl.cornerRadius = 2
        pageControl.spacing = 7
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    // MARK: - Variables
    let openChallengeCellId = "openChallengeCell"
    
    // MARK: - Object life cycle
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = AppColors.darkwhite.color
        initCollectionView()
        setupPageControl()
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    
    // MARK: - Page Control
    /**
     Configure page control layout
     */
    func setupPageControl() {
        self.addSubview(pageControl)
        pageControl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 4).isActive = true
        pageControl.elementHeight = 4
        pageControl.elementWidth = 15
        pageControl.pages = 8
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
        collectionView.clipsToBounds = false
        self.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
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
            layout.itemSize = CGSize(width: self.frame.width * (335/375), height: self.frame.height * (355/374))
            layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
            layout.minimumLineSpacing = 0
            layout.minimumInteritemSpacing = 0
        }
    }
    
    // MARK: - Scroll View
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let cellWidth = self.frame.width * (335/375)
        let pageIndex = Int(round(scrollView.contentOffset.x/cellWidth))
        self.pageControl.currentPage = pageIndex
    }
}
