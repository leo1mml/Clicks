//
//  TimerView.swift
//  Clicks!
//
//  Created by Leonel Menezes on 26/06/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import Foundation
import UIKit

class TimerView : UIView {
    
    
    var endDate : Date? {
        didSet {
            updateTimer()
        }
    }
    @IBOutlet var containerView: UIView!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("TimerView", owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    // MARK: - Utils methods
    
    ///Updates the text from the label periodically
    private func updateTimer() {
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateLabelText), userInfo: nil, repeats: true)
    }
    
    ///Updates the text from the label with the current interval from the end date
    @objc private func updateLabelText() {
        guard self.endDate != nil else{
            return
        }
        let timeLeft = self.endDate?.timeIntervalSince(Date())
        self.timerLabel.text = timeLeft?.stringFormatted()
    }
}
