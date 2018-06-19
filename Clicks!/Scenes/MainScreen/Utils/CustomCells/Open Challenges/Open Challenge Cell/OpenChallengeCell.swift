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
    
    private let coverImage : UIImageView = {
        let coverImage = UIImageView()
        coverImage.clipsToBounds = true
        coverImage.contentMode = .scaleAspectFill
        coverImage.translatesAutoresizingMaskIntoConstraints = false
        coverImage.layer.cornerRadius = 10
        coverImage.backgroundColor = UIColor(colorWithHexValue: 0xD8D8D8)
        return coverImage
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSelfView()
        setupCoverImage()
    }
    
    /**
     Sets an image to the cell.
     - Parameters:
        - image: The image to be setted
     */
    func setImage(image: UIImage) {
        self.coverImage.image = image
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///Set up the content view
    func setupSelfView() {
        self.layer.cornerRadius = 10
        self.backgroundColor = .gray
        self.backgroundColor = AppColors.darkwhite.color
        self.dropShadow(color: .black, opacity: 0.5, offSet: CGSize(width: 2, height: 5), radius: 5, scale: true, cornerRadius: 10)
        self.applyGradient(colours: [.clear,AppColors.darkGradient.color], locations: [0.325, 1.0])
    }
    
    ///Positions the cover image over the cell
    func setupCoverImage() {
        self.addSubview(self.coverImage)
        NSLayoutConstraint.activate([
            coverImage.topAnchor.constraint(equalTo: self.topAnchor),
            coverImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            coverImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            coverImage.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
    }
    
}
