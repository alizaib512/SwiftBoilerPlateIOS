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
        // Do any additional setup after loading the view.
    }
    

    func back(sender: UIBarButtonItem) {
            // Perform your custom actions
            // ...
            // Go back to the previous ViewController
        navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.popViewController(animated: true)
        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
