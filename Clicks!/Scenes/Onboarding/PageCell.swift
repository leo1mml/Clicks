//
//  PageCell.swift
//  Clicks!
//
//  Created by Leonel Menezes on 25/05/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import Foundation
import UIKit

class PageCell: UICollectionViewCell {
    ///Stores the page structure, once it is set it updates the UI content
    var holders : Onboarding.PageStructure.ViewModel.SinglePage? {
        didSet {
            guard let unwrappedHolders = holders else {return}
            self.text.text = unwrappedHolders.description
            self.title.text = unwrappedHolders.title
        }
    }
    ///TextView that stores the title and description from the user onboarding
    
    let title : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont(name: "Montserrat-Bold", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = AppColors.clearblack.color
        return label
    }()
    
    let text : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.textAlignment = .center
        textView.isScrollEnabled = false
        textView.font = UIFont(name: "Montserrat-Light", size: 15)
        textView.textColor = AppColors.gray.color
        textView.backgroundColor = AppColors.darkwhite.color
        return textView
    }()
    
    
    override func awakeFromNib() {
        self.backgroundColor = AppColors.darkwhite.color
        setupTitle()
        setupText()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = AppColors.darkwhite.color
        setupTitle()
        setupText()
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    ///Sets up title constraints
    func setupTitle() {
        addSubview(self.title)
        NSLayoutConstraint.activate([
            self.title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            self.title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            self.title.topAnchor.constraint(equalTo: topAnchor, constant: frame.height * 0.65)
            ])
    }
    ///Sets Up the text constraints
    func setupText() {
        addSubview(self.text)
        NSLayoutConstraint.activate([
            self.text.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 30),
            self.text.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            self.text.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
            ])
    }
}
