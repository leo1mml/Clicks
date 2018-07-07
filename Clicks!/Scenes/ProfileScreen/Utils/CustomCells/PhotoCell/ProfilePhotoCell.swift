//
//  ProfilePhotoCell.swift
//  Clicks!
//
//  Created by Leonel Menezes on 06/07/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import UIKit

class ProfilePhotoCell: UICollectionViewCell {
    
    // MARK: - Variables
    
    ///Cover image of the photo cell
    private let coverImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.clipsToBounds = true
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleAspectFill
        return imageview
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSelfView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    // MARK: - Data Source
    
    func setData(data: Profile.FetchPhotos.ViewModel.Photo) {
        self.coverImageView.image = data.image
    }
    
    ///Configure self view
    private func configureSelfView() {
        self.layer.cornerRadius = self.frame.height * (5/121)
        setupCoverImage()
    }
    
    
    /// Add constraints to cover image
    private func setupCoverImage() {
        addSubview(self.coverImageView)
        
        self.coverImageView.layer.cornerRadius = self.frame.height * (5/121)
        
        NSLayoutConstraint.activate([
            self.coverImageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.coverImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.coverImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.coverImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
            ])
    }
}
