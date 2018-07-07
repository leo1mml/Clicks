//
//  ProfileHeaderView.swift
//  Clicks!
//
//  Created by Leonel Menezes on 06/07/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import UIKit

class ProfileHeaderView: UICollectionReusableView {
    
    let profileImageHolder : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .center
        view.backgroundColor = .clear
        return view
    }()
    
    let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let userNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Montserrat-ExtraBold", size: 22)
        label.textColor = AppColors.clearblack.color
        label.textAlignment = .center
        return label
    }()
    
    let nickName : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Montserrat-Regular", size: 14)
        label.textAlignment = .center
        label.textColor = .gray
        return label
    }()
    
    let separatorView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()
    
    let numberOfPhotosLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-SemiBold", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = AppColors.clearblack.color
        return label
    }()
    
    let numberOfTrophiesLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-SemiBold", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = AppColors.clearblack.color
        return label
    }()
    
    let photosLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Regular", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = NSLocalizedString("PHOTOS", comment: "")
        label.textColor = .gray
        return label
    }()
    
    let trophiesLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Regular", size: 12)
        label.text = NSLocalizedString("TROPHIES", comment: "")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .gray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    
    func setData(data: Profile.FetchUser.ViewModel.User) {
        self.profileImage.image = data.profileImage
        self.numberOfPhotosLabel.text = data.numberOfPhotos
        self.numberOfTrophiesLabel.text = data.numberOfTrophies
        self.nickName.text = "@" + data.nickName
        self.userNameLabel.text = data.name
    }
    
    
    ///Setup all subviews
    private func setup() {
        setupProfileImageViewHolder()
        setupProfileImageView()
        setupNameLabels()
        setupCounterLabels()
    }
    
    ///Setup profile image container
    private func setupProfileImageViewHolder() {
        addSubview(profileImageHolder)
        
        NSLayoutConstraint.activate([
            profileImageHolder.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            profileImageHolder.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            profileImageHolder.heightAnchor.constraint(equalToConstant: self.frame.height * (118/290)),
            profileImageHolder.widthAnchor.constraint(equalToConstant: self.frame.height * (118/290))
            ])
        
        //Layer
        profileImageHolder.layer.zPosition = 0
        profileImageHolder.layer.cornerRadius = (self.frame.height * (118/290))/2
        profileImageHolder.layer.borderColor = AppColors.clearblack.color.cgColor
        profileImageHolder.layer.borderWidth = 2
        
        //        setupProfileImageView()
    }
    
    ///Setup profile image view inside its container
    private func setupProfileImageView() {
        addSubview(self.profileImage)
        
        NSLayoutConstraint.activate([
            profileImage.centerXAnchor.constraint(equalTo: profileImageHolder.centerXAnchor),
            profileImage.centerYAnchor.constraint(equalTo: profileImageHolder.centerYAnchor),
            profileImage.widthAnchor.constraint(equalTo: profileImageHolder.widthAnchor, multiplier: 108/118),
            profileImage.heightAnchor.constraint(equalTo: profileImageHolder.heightAnchor, multiplier: 108/118)
            ])
        
        //Layer
        profileImage.layer.zPosition = 1
        profileImage.layer.cornerRadius = (self.frame.height * (108/290))/2
    }
    
    ///Setup names labels
    private func setupNameLabels() {
        let stackContainer = UIStackView(arrangedSubviews: [self.userNameLabel, self.nickName])
        stackContainer.translatesAutoresizingMaskIntoConstraints = false
        stackContainer.axis = .vertical
        stackContainer.alignment = .center
        stackContainer.distribution = .equalSpacing
        stackContainer.spacing = 4
        addSubview(stackContainer)
        NSLayoutConstraint.activate([
            stackContainer.topAnchor.constraint(equalTo: self.profileImageHolder.bottomAnchor, constant: 15),
            stackContainer.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            ])
    }
    
    ///Setup counter labels
    private func setupCounterLabels() {
        setupSeparatorView()
        
        let rightStack = UIStackView(arrangedSubviews: [self.numberOfPhotosLabel, self.photosLabel])
        let leftStack = UIStackView(arrangedSubviews: [self.numberOfTrophiesLabel, self.trophiesLabel])
        let containerStack = UIStackView(arrangedSubviews: [leftStack, self.separatorView, rightStack])
        
        rightStack.alignment = .center
        rightStack.axis = .vertical
        rightStack.distribution = .fill
        rightStack.spacing = 0
        rightStack.translatesAutoresizingMaskIntoConstraints = false
        
        leftStack.alignment = .center
        leftStack.axis = .vertical
        leftStack.distribution = .fill
        leftStack.spacing = 0
        leftStack.translatesAutoresizingMaskIntoConstraints = false
        
        containerStack.alignment = .center
        containerStack.axis = .horizontal
        containerStack.distribution = .equalSpacing
        containerStack.spacing = 38
        containerStack.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(containerStack)
        
        NSLayoutConstraint.activate([
            containerStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            containerStack.topAnchor.constraint(equalTo: self.nickName.bottomAnchor, constant: 30)
            ])
    }
    
    private func setupSeparatorView() {
        NSLayoutConstraint.activate([
            self.separatorView.widthAnchor.constraint(equalToConstant: 1),
            self.separatorView.heightAnchor.constraint(equalToConstant: 16)
            ])
    }
    
}
