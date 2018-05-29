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
    
    var holders : Onboarding.PageStructure.ViewModel.SinglePage? {
        didSet {
            guard let unwrappedHolders = holders else {return}
            let attributedText = NSMutableAttributedString(string: unwrappedHolders.title, attributes: [NSAttributedStringKey.font : UIFont(name: "Montserrat-Bold", size: 30) as Any])
            attributedText.append(NSAttributedString(string: "\n\n\(unwrappedHolders.description)", attributes: [NSAttributedStringKey.font : UIFont(name: "Montserrat-Light", size: 15) as Any]))
            self.text.attributedText = attributedText
            self.text.textAlignment = .center
        }
    }
    let text : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.textAlignment = .center
        textView.isScrollEnabled = false
        textView.backgroundColor = AppColors.darkwhite.color
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = AppColors.darkwhite.color
        setupText()
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    ///Sets up text constraints
    func setupText() {
        addSubview(self.text)
        NSLayoutConstraint.activate([
            self.text.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            self.text.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
            self.text.topAnchor.constraint(equalTo: topAnchor, constant: frame.height * 0.65)
            ])
    }
}
