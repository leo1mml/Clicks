//
//  MainScreenTableHeaderView.swift
//  Clicks!
//
//  Created by Leonel Menezes on 13/06/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import Foundation
import UIKit

class MainScreenTableHeaderView : UITableViewCell {
    ///Title to appear at the header
    let title = UILabel()
    ///Button to interact inside the header
    let button : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .clear
        return btn
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.frame = self.bounds
        self.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.backgroundColor = AppColors.darkwhite.color
        setupTitle()
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    ///Layout for button
    func setupButton() {
        self.addSubview(self.button)
        self.button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18).isActive = true
        self.button.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    ///Puts the title in the right place
    func setupTitle() {
        self.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont(name: "Montserrat-SemiBold", size: 14)
        title.textColor = UIColor(colorWithHexValue: 0x6B6B6B)
        title.textAlignment = .left
        title.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18).isActive = true
        title.backgroundColor = .clear
    }
}
