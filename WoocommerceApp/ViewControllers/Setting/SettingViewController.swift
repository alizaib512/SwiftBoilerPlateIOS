//
//  SettingViewController.swift
//  WoocommerceApp
//
//  Created by XintSolutions on 30/07/2021.
//

import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(false, animated: true)
        addBackButton()

    }
    

    func back(sender: UIBarButtonItem) {
        navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.popViewController(animated: true)
        }

}
extension UIViewController {

    func addBackButton() {
        let btnLeftMenu: UIButton = UIButton()
        let image = UIImage(named: "backButtonImage");
        btnLeftMenu.setImage(image, for: .normal)
        btnLeftMenu.setTitle("Back", for: .normal);
        btnLeftMenu.sizeToFit()
        btnLeftMenu.addTarget(self, action: #selector (backButtonClick(sender:)), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: btnLeftMenu)
        self.navigationItem.leftBarButtonItem = barButton
    }

    @objc func backButtonClick(sender : UIButton) {
        navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.popViewController(animated: true)
    }
}
