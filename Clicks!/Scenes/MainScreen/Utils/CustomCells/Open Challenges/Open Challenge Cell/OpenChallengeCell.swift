//
//  ChallengeCell.swift
//  Clicks!
//
//  Created by Leonel Menezes on 13/06/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import Foundation
import UIKit

class OpenChallengeCell : UICollectionViewCell {
    
    let coverImage : UIImageView = {
        let coverImage = UIImageView()
        coverImage.clipsToBounds = true
        coverImage.contentMode = .scaleAspectFill
        coverImage.translatesAutoresizingMaskIntoConstraints = false
        coverImage.layer.cornerRadius = 10
        return coverImage
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 10
        self.backgroundColor = .red//AppColors.darkwhite.color
        self.dropShadow(color: .black, opacity: 0.5, offSet: CGSize(width: 2, height: 5), radius: 5, scale: true, cornerRadius: 10)
        setupCoverImage()
    }
    
    func setImage(image: UIImage) {
        self.coverImage.image = image
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCoverImage() {
        self.addSubview(self.coverImage)
        NSLayoutConstraint.activate([
            coverImage.topAnchor.constraint(equalTo: self.topAnchor),
            coverImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            coverImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            coverImage.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
        self.coverImage.layer.zPosition = 100
    }
    
}
