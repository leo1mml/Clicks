//
//  LastChallengeCell.swift
//  Clicks!
//
//  Created by Leonel Menezes on 27/06/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import UIKit

class LastChallengeCell: UICollectionViewCell {
    
    // MARK: - UI Items
    
    ///the cover image from the challenge
    private let challengeCoverImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    ///the profile image from the winner of the challenge
    private let winnerProfileImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    ///The challenge winner name
    private let winnerNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = UIFont(name: "Montserrat-Medium", size: 13)
        label.textColor = AppColors.clearblack.color
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Object lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    
    // MARK: - Data Source Methods
    
    ///Sets the cell data
    func setCellData(data: MainScreen.LastChallenges.ViewModel.LastChallenges.LastChallenge) {
        self.challengeCoverImageView.image = data.challengeWinnerImage.applyBlurWithRadius(5, tintColor: nil, saturationDeltaFactor: 0.75)
        self.winnerProfileImage.image = data.winnerProfileImage
        self.winnerNameLabel.text = data.winnerName
    }
    
    // MARK: - Setup methods
    
    ///This is just a call to all the setup methods in the right order
    private func setup() {
        addSubviews()
        setupNameLabel()
        setupCoverImage()
        setupProfileImage()
    }
    
    ///Adds all the ui items as subviews
    private func addSubviews() {
        addSubview(self.challengeCoverImageView)
        addSubview(self.winnerNameLabel)
        self.challengeCoverImageView.addSubview(self.winnerProfileImage)
    }
    
    ///setup the coverImage from the challenge
    private func setupCoverImage() {
        //Constraints
        NSLayoutConstraint.activate([
            challengeCoverImageView.topAnchor.constraint(equalTo: self.topAnchor),
            challengeCoverImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            challengeCoverImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            challengeCoverImageView.heightAnchor.constraint(equalToConstant: frame.height * (99/136))
            ])
        
        //Appearance
        challengeCoverImageView.layer.cornerRadius = 10
    }
    
    ///Setup the winner name label
    private func setupNameLabel() {
        //Constraints
        NSLayoutConstraint.activate([
            winnerNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            winnerNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            winnerNameLabel.topAnchor.constraint(equalTo: self.challengeCoverImageView.bottomAnchor, constant: 5)
            ])
    }
    
    ///Setup the profile image
    private func setupProfileImage() {
        //Constraints
        NSLayoutConstraint.activate([
            winnerProfileImage.centerXAnchor.constraint(equalTo: challengeCoverImageView.centerXAnchor),
            winnerProfileImage.centerYAnchor.constraint(equalTo: challengeCoverImageView.centerYAnchor),
            winnerProfileImage.heightAnchor.constraint(equalToConstant: 45),
            winnerProfileImage.widthAnchor.constraint(equalToConstant: 45),
            ])
        
        winnerProfileImage.layer.cornerRadius = 45/2
    }
    
    
}
