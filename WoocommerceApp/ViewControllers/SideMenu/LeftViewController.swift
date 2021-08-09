
        
        
      
        //
        //  LeftViewController.swift
        //  WoocommerceApp
        //
        //  Created by XintSolutions on 28/07/2021.
        //

        import UIKit
        import LGSideMenuController
        import CBFlashyTabBarController





        private let cellIdentifier = "cell"
        private let tableViewInset: CGFloat = 44.0 * 2.0
        private let cellHeight: CGFloat = 44.0

        class LeftViewController: UIViewController  , UITableViewDelegate ,UITableViewDataSource{
            
            @IBOutlet var tableView: UITableView!
            
            
            private let sections: [[SideViewCellItem]] = [
                [.close, .openRight],
                [.changeRootVC],
                [.pushVC(title: "Profile"),
                 .pushVC(title: "News"),
                 .pushVC(title: "Friends"),
                 .pushVC(title: "Music"),
                 .pushVC(title: "Video"),
                 .pushVC(title: "Articles")]
            ]
            override func viewDidLoad() {
                super.viewDidLoad()
                self.navigationController?.navigationBar.isHidden = true
                // Do any additional setup after loading the view.
                
                tableView.register(LeftViewCell.self, forCellReuseIdentifier: cellIdentifier)
                tableView.separatorStyle = .none
                tableView.contentInset = UIEdgeInsets(top: tableViewInset, left: 0.0, bottom: tableViewInset, right: 0.0)
                tableView.showsVerticalScrollIndicator = false
                tableView.backgroundColor = .clear
                tableView.contentInsetAdjustmentBehavior = .never
                tableView.contentOffset = CGPoint(x: 0.0, y: -tableViewInset)
            }
            
            
            override var preferredStatusBarStyle: UIStatusBarStyle {
                return .darkContent
                 
        //            if isLightTheme() {
        //                return .lightContent
        //            } else {
        //                if #available(iOS 13.0, *) {
        //                    return .darkContent
        //                } else {
        //
        //                }
        //            }
        //        default:
        //            return .default
                }
            override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
                return .fade
            }
            
            
            
            // MARK: - UITableViewDataSource -

             func numberOfSections(in tableView: UITableView) -> Int {
                return sections.count
            }

             func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return sections[section].count
            }

             func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! LeftViewCell
                let item = sections[indexPath.section][indexPath.row]

                cell.textLabel!.text = item.description
                cell.isFirst = (indexPath.row == 0)
                cell.isLast = (indexPath.row == sections[indexPath.section].count - 1)
                cell.isFillColorInverted = sideMenuController?.leftViewPresentationStyle == .slideAboveBlurred

                return cell
            }

            func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                   let viewController = storyBoard.instantiateViewController(withIdentifier: "setting") as! SettingViewController

                   let navigationController = sideMenuController!.rootViewController as! UINavigationController
                   navigationController.pushViewController(viewController, animated: true)

                    self.sideMenuController?.hideLeftViewAnimated(sender: self)
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

