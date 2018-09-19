//
//  FreeRotationNavController.swift
//  Clicks!
//
//  Created by Leonel Menezes on 19/09/18.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//
import UIKit

class FreeRotationNavController: UINavigationController {
    
    override var shouldAutorotate: Bool {
        return self.visibleViewController?.shouldAutorotate ?? false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return self.visibleViewController?.supportedInterfaceOrientations ?? .portrait
    }
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        self.isNavigationBarHidden = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.isNavigationBarHidden = true
    }
    
}
