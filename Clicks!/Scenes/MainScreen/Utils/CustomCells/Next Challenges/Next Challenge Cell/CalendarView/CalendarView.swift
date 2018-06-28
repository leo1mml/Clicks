//
//  CalendarView.swift
//  Clicks!
//
//  Created by Leonel Menezes on 28/06/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import UIKit

class CalendarView: UIView {
    
    
    @IBOutlet var containerView: UIView!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("CalendarView", owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    override func awakeFromNib() {
        self.dateLabel.text = "13/12"
    }
}
