//
//  File.swift
//  Clicks!
//
//  Created by Leonel Menezes on 26/06/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import Foundation
import UIKit

class VotationPeriodView: UIView {
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("VotationPeriodView", owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    override func awakeFromNib() {
        self.titleLabel.text = NSLocalizedString("Votation Period", comment: "")
    }
}
