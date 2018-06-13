//
//  OpenChallengesCell.swift
//  Clicks!
//
//  Created by Leonel Menezes on 13/06/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import Foundation
import UIKit

class OpenChallengesCell: UITableViewCell {
    
    var openChallengesCollectionView : UICollectionView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }
    
    
    func setupCollectionView () {
        self.openChallengesCollectionView?.delegate = self
        self.openChallengesCollectionView?.dataSource = self
        let collectionViewSize = CGSize(width: self.frame.width, height: self.frame.height * 0.9572)
        self.openChallengesCollectionView = UICollectionView(frame: CGRect(origin: self.frame.origin, size: collectionViewSize), collectionViewLayout: CarouselCollectionViewLayout())
        self.openChallengesCollectionView?.translatesAutoresizingMaskIntoConstraints = false
    }
}


extension OpenChallengesCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "", for: indexPath)
        return cell
    }


}
