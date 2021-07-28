//
//  SideMenuController.swift
//  WoocommerceApp
//
//  Created by XintSolutions on 28/07/2021.
//

import UIKit
import LGSideMenuController

class SideMenuController: LGSideMenuController {


    override func viewDidLoad() {
        super.viewDidLoad()

        leftViewPresentationStyle = .scaleFromLittle
        rightViewPresentationStyle = .slideBelowShifted
        
        do {
            // For Demo .usageInsideNavigationController
            navigationItem.title = "LGSideMenuController"
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: menuIconImage, style: .plain, target: self, action: #selector(showLeftViewAction(sender:)))
          //  navigationItem.rightBarButtonItem = UIBarButtonItem(image: menuIconImage, style: .plain, target: self, action: #selector(showRightViewAction(sender:)))
        }
    }
  
    
    @objc
    func showLeftViewAction(sender: AnyObject?) {
        toggleLeftView(animated: true)
    }

    @objc
    func showRightViewAction(sender: AnyObject?) {
        toggleRightView(animated: true)
    }
    
 
}
