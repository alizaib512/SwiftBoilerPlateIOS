//
//  LeftViewController.swift
//  WoocommerceApp
//
//  Created by XintSolutions on 28/07/2021.
//

import UIKit
import LGSideMenuController
import CBFlashyTabBarController
class LeftViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSetting(_ sender: Any) {
        
      //  if let vc = storyboard?.instantiateViewController(identifier: "SettingSBID"){
//        let navigationController = sideMenuController?.rootViewController as! CBFlashyTabBarController
//            navigationController.performSegue(withIdentifier: "setting", sender: self)
//
//          //  navigationController.pushViewController(vc, animated: true)
//
//            sideMenuController?.hideLeftView(animated: true)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "setting") as! SettingViewController
          //let navigationController = UINavigationController(rootViewController: vc)
          //self.present(navigationController, animated: true, completion: nil)
      //  self.sideMenuController?.hideLeftViewAnimated(sender: self)
         // self.sideMenuController?.rootViewController?.show(vc, sender: self)
        
       // self.sideMenuController?.rootViewController?.navigationController?.pushViewController(vc, animated: true)
        
//        let mainViewController = UIApplication.shared.keyWindow?.rootViewController as! SideMenuController
//        let navigationController = mainViewController.rootViewController as? UINavigationController
//        let viewController = UIViewController()
//        viewController.view.backgroundColor = .white
//                // viewController.title = "Test \(titlesArray[indexPath.row])"
//        navigationController?.pushViewController(vc, animated: true)
//
//        self.sideMenuController?.hideLeftViewAnimated(sender: self)
        
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
           let viewController = storyBoard.instantiateViewController(withIdentifier: "setting") as! SettingViewController

           let navigationController = sideMenuController!.rootViewController as! UINavigationController
           navigationController.pushViewController(viewController, animated: true)

            self.sideMenuController?.hideLeftViewAnimated(sender: self)
        
        
        
        
        //
//        if let vc = storyboard?.instantiateViewController(identifier: "SettingSBID"){
//            //let contentViewController =  UINavigationController(rootViewController: vc)
//            self.navigationController?.pushViewController(vc, animated: true)
//            sideMenuController?.hideLeftView(animated: true)
//        }
        
//        let navigationController = getNavigationController()
//        navigationController.pushViewController(viewController, animated: true)
//
//
//
//
//        sideMenuController?.hideLeftView(animated: true)
//       self.performSegue(withIdentifier: "setting", sender: self)
        
    }
//    func getNavigationController() -> UINavigationController {
//        if type?.demoRow == .usageInsideNavigationController {
//            return sideMenuController.parent as! RootNavigationController
//        }
//        else if type?.demoRow == .usageAsContainerForTabBarController {
//            let tabBarController = sideMenuController.rootViewController as! RootTabBarController
//            return tabBarController.selectedViewController as! RootNavigationController
//        }
//        else {
//            return sideMenuController.rootViewController as! RootNavigationController
//        }
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
