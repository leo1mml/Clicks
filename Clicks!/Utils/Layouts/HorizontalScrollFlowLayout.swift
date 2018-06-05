//
//  HorizontalScrollFlowLayout.swift
//  Clicks!
//
//  Created by Gabriel Reynoso on 30/05/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import UIKit
///It configures the flow layout of a collection view
class HorizontalScrollFlowLayout: UICollectionViewFlowLayout {

    override init() {
        super.init()
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    ///Defines the direction of the scroll to the horizontal.
    private func commonInit() {
        self.scrollDirection = .horizontal
    }
}
