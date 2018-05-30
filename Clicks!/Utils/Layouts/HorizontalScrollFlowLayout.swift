//
//  HorizontalScrollFlowLayout.swift
//  Clicks!
//
//  Created by Gabriel Reynoso on 30/05/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import UIKit

class HorizontalScrollFlowLayout: UICollectionViewFlowLayout {

    override init() {
        super.init()
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.scrollDirection = .horizontal
    }
}
