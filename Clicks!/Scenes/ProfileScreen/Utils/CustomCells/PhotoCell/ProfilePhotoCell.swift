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
    
    private let trophyImage: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.clipsToBounds = true
        imageview.contentMode = .scaleAspectFill
        imageview.image = #imageLiteral(resourceName: "trophy-profile")
        imageview.layer.zPosition = 9
        return imageview
    }()

    private let themeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Montserrat-Medium", size: 10)
        label.textColor = .white
        label.layer.zPosition = 9
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSelfView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    // MARK: - Data Source
    
    
    ///Sets the cell data, this will always be executed on the main thread
    func setData(data: Profile.FetchPhotos.ViewModel.Photo) {
        self.coverImageView.image = data.image
        self.themeLabel.text = data.theme
        if(data.hasTrophy){
            setupTrophy()
        }
    }
    
    override func prepareForReuse() {
        //If the cell is reused then we should clean all the previous ui and show only what matters
        self.removeChallengeGradientLayer()
        self.coverImageView.image = nil
        self.trophyImage.alpha = 0
        self.themeLabel.alpha = 0
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
    
    private func setupTrophy() {
        addSubview(self.trophyImage)
        
        NSLayoutConstraint.activate([
                self.trophyImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
                self.trophyImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
                self.trophyImage.heightAnchor.constraint(equalToConstant: 21),
                self.trophyImage.widthAnchor.constraint(equalToConstant: 21)
            ])
        self.applyGradient(colours: [.clear,AppColors.darkGradient.color], locations: [0.5, 1.0])
        self.trophyImage.alpha = 1
        setupThemeLabel()
    }
    
    private func setupThemeLabel() {
        addSubview(self.themeLabel)
        
        NSLayoutConstraint.activate([
            self.themeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            self.themeLabel.leadingAnchor.constraint(equalTo: self.trophyImage.trailingAnchor, constant: 5),
            self.themeLabel.heightAnchor.constraint(equalTo: self.trophyImage.heightAnchor),
            self.themeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5)
            ])
        self.themeLabel.alpha = 1
    }
}
