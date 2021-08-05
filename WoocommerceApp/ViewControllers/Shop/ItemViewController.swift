//
//  ItemViewController.swift
//  ViewPager-Swift
//
//  Created by Nishan on 2/9/16.
//  Copyright © 2016 Nishan. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    override func loadView() {
        
        let newView = UIView()
        newView.backgroundColor = UIColor.red

        
        view = newView
    }

    var itemText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let itemLabel = UILabel()
//        itemLabel.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(itemLabel)
//
//        itemLabel.textAlignment = .center
//        itemLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        itemLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//
//        itemLabel.text = itemText
//        itemLabel.backgroundColor = UIColor.red
       // lblName.text = "ali"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Access the navigation controller if you want from child
//        if let parentPageViewController = self.parent {
//            parentPageViewController.parent?.navigationItem.title = itemText
//        }
    }
}

