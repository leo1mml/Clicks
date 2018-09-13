//
//  ChallengeCell.swift
//  Clicks!
//
//  Created by Leonel Menezes on 13/06/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import Foundation
import UIKit
import ShadowView

class OpenChallengeCell : UICollectionViewCell {
    
    private let shadowContainerView = ShadowView()
    
    private let coverImage : UIImageView = {
        let coverImage = UIImageView()
        coverImage.clipsToBounds = true
        coverImage.contentMode = .scaleAspectFill
        coverImage.translatesAutoresizingMaskIntoConstraints = false
        coverImage.layer.cornerRadius = 10
        coverImage.backgroundColor = UIColor(colorWithHexValue: 0xD8D8D8)
        return coverImage
        }()
    
    private let titleLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont(name: "Montserrat-ExtraBold", size: 42)
        titleLabel.textColor = .white
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.numberOfLines = 1
        titleLabel.textAlignment = .left
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private let numberOfPhotosLabel : UILabel = {
        let numberLabel = UILabel()
        numberLabel.font = UIFont(name: "Montserrat-Medium", size: 15)
        numberLabel.textColor = .white
        numberLabel.numberOfLines = 1
        numberLabel.contentMode = .left
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        return numberLabel
    }()
    
    private let timerView : TimerView = {
        let timerView = TimerView()
        timerView.translatesAutoresizingMaskIntoConstraints = false
        return timerView
    }()
    
    private let votationPeriodView : VotationPeriodView = {
        let votationPeriodView = VotationPeriodView()
        votationPeriodView.translatesAutoresizingMaskIntoConstraints = false
        return votationPeriodView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.coverImage.image = nil
    }
    
    /**
     Set up all the data that the cell needs
     - Parameters:
        - image: The cover image of the challenge
        - title: The title of the challenge
        - numberOfPhotos: The number of photos in the challenge
        - startDate: The date in which the challenge began
     */
    
    func setCellData(_ data: MainScreen.OpenChallenges.ViewModel.OpenChallenges.OpenChallenge) {
        self.coverImage.image = data.coverImage
        self.titleLabel.text = data.title
        self.numberOfPhotosLabel.text = data.numberOfPhotos + " "  + NSLocalizedString("Photos", comment: "")
        self.timerView.endDate = data.startDate
        if(!data.isOnVotationPeriod){
            self.votationPeriodView.alpha = 0
        }
        self.shadowContainerView.updateShadow()
        
    }
    
    //MARK: - Setup methods
    
    ///Calls the setup methods of all the subviews
    private func setup() {
        setupSelfView()
        setupShadowView()
        setupCoverImage()
        setupTitleLabel()
        setupNumberOfPhotosLabel()
        setupTimerView()
        setupVotationPeriodView()
    }
    
    ///Set up the content view
    private func setupSelfView() {
        self.layer.cornerRadius = 10
        self.backgroundColor = .gray
        self.backgroundColor = AppColors.darkwhite.color
        self.applyGradient(colours: [.clear,AppColors.darkGradient.color], locations: [0.325, 1.0])
    }
    
    ///Setup the view which will generate the colored shadow
    private func setupShadowView() {
        self.shadowContainerView.frame = self.bounds
        shadowContainerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        shadowContainerView.shadowOffset = CGSize(width: 0, height: 3)
        shadowContainerView.shadowRadius = 2
        addSubview(shadowContainerView)
    }
    
    ///Add constraints to the title
    private func setupTitleLabel() {
        self.addSubview(self.titleLabel)
        NSLayoutConstraint.activate([
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -self.frame.height * (90/355)),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
            ])
        self.titleLabel.layer.zPosition = self.layer.zPosition + 5
    }
    
    ///Adds constraints to the number of photos label
    private func setupNumberOfPhotosLabel() {
        self.addSubview(self.numberOfPhotosLabel)
        NSLayoutConstraint.activate([
            self.numberOfPhotosLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor),
            self.numberOfPhotosLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor)
            ])
        self.numberOfPhotosLabel.layer.zPosition = self.layer.zPosition + 5
    }
    
    ///Positions the cover image over the cell
    private func setupCoverImage() {
        self.shadowContainerView.addSubview(self.coverImage)
        NSLayoutConstraint.activate([
            coverImage.topAnchor.constraint(equalTo: self.topAnchor),
            coverImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            coverImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            coverImage.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
    }
    
    ///Setup the timer view
    private func setupTimerView() {
        self.addSubview(self.timerView)
        NSLayoutConstraint.activate([
            self.timerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            self.timerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.timerView.heightAnchor.constraint(equalToConstant: self.frame.height * (24/355)),
            self.timerView.widthAnchor.constraint(equalToConstant: self.frame.width * (130/335))
            ])
        self.timerView.layer.zPosition = self.layer.zPosition + 5
    }
    
    ///Adds constraints to the votation period view
    private func setupVotationPeriodView() {
        self.addSubview(self.votationPeriodView)
        NSLayoutConstraint.activate([
            self.votationPeriodView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            self.votationPeriodView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.votationPeriodView.heightAnchor.constraint(equalToConstant: 26),
            self.votationPeriodView.widthAnchor.constraint(equalToConstant: 151)
            ])
        self.votationPeriodView.layer.zPosition = self.layer.zPosition + 5
        self.votationPeriodView.titleLabel.text = NSLocalizedString("Votation Period", comment: "")
        self.votationPeriodView.titleLabel.textColor = AppColors.clearblack.color
    }
    
}
