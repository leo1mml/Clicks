//
//  ContainerCollectionView.swift
//  Clicks!
//
//  Created by Leonel Menezes on 06/07/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import UIKit

class ContainerCollectionView: UICollectionView {
    
    
    // MARK: - Object Lifecycle
    
    init() {
        super.init(frame: .zero, collectionViewLayout: .init())
        initCollectionView()
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        initCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    
    
    ///Initiates the collectionview
    private func initCollectionView() {
        self.collectionViewLayout = UICollectionViewFlowLayout()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = AppColors.darkwhite.color
    }
    
    
    ///If the view has a superview it sets its constraints to fill the superview.
    func makeItFillSuperView() {
        
        guard let superView = self.superview else {
            return
        }
        
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: superView.topAnchor),
            self.trailingAnchor.constraint(equalTo: superView.trailingAnchor),
            self.leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            self.bottomAnchor.constraint(equalTo: superView.bottomAnchor)
            ])
    }
    
}
