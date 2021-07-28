//
//  HomeViewController.swift
//  WoocommerceApp
//
//  Created by XintSolutions on 28/07/2021.
//

import UIKit

class HomeViewController: UIViewController {
    var showSideButtons: Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.tintColor = UIColor.black
        
        // Do any additional setup after loading the view.
        
        if showSideButtons {
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: menuIconImage, style: .plain, target: self, action: #selector(showLeftView(sender:)))
          //  navigationItem.rightBarButtonItem = UIBarButtonItem(image: menuIconImage, style: .plain, target: self, action: #selector(showRightView(sender:)))
        }
    }
    
    
    @objc
    func showLeftView(sender: AnyObject?) {
        sideMenuController?.toggleLeftView(animated: true)
    }
 
    
    

}
