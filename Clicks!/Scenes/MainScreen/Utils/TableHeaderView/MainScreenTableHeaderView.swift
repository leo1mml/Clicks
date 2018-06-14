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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.frame = self.bounds
        self.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.backgroundColor = AppColors.darkwhite.color
        setupTitle()
        setupButton()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.frame = self.bounds
        self.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.backgroundColor = AppColors.darkwhite.color
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    ///Layout for button
    func setupButton() {
        self.button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18).isActive = true
        self.button.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.addSubview(self.button)
    }
    
    ///Puts the title in the right place
    func setupTitle() {
        title.translatesAutoresizingMaskIntoConstraints = false
        title.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: self.trailingAnchor, constant: 18)
        title.backgroundColor = .clear
        self.addSubview(title)
    }
}
