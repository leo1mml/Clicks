//
//  Next Challenge Cell.swift
//  Clicks!
//
//  Created by Leonel Menezes on 28/06/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import UIKit

class NextChallengeCell: UICollectionViewCell {
    
    // MARK: - Variables
    
    ///The cover image of the challenge
    private var coverImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.backgroundColor = .red
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    ///The theme of the challenge
    private var titleLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Montserrat-Bold", size: 18)
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.text = ""
        return label
    }()
    
    private var calendarView = CalendarView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    // MARK: - Data source methods
    
    func setData(data: MainScreen.NextChallenges.ViewModel.NextChallenges.NextChallenge) {
        self.coverImage.image = data.coverImage
        self.titleLabel.text = data.title
        self.calendarView.dateLabel.text = data.startDate
    }
    
    
    // MARK: - Setup methods
    
    private func setup() {
        setupCoverImage()
        setupTitleLabel()
        setupCalendarView()
        self.applyGradient(colours: [.clear, AppColors.darkGradient.color])
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
    ///Setup the cover imageview with constraints
    private func setupCoverImage() {
        addSubview(coverImage)
        
        NSLayoutConstraint.activate([
            coverImage.topAnchor.constraint(equalTo: self.topAnchor),
            coverImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            coverImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            coverImage.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ])
    }
    
    ///Setup the title label
    private func setupTitleLabel() {
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7)
            ])
        
        titleLabel.layer.zPosition = self.layer.zPosition + 5
    }
    
    ///Setup the calendar view
    private func setupCalendarView() {
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(calendarView)
        
        NSLayoutConstraint.activate([
                calendarView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                calendarView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
                calendarView.heightAnchor.constraint(equalToConstant: 24),
                calendarView.widthAnchor.constraint(equalToConstant: 90)
            ])
        calendarView.layer.zPosition = self.layer.zPosition + 5
    }
    
    
}
