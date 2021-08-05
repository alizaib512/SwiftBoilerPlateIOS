//
//  ShopViewController.swift
//  WoocommerceApp
//
//  Created by XintSolutions on 04/08/2021.
//

import UIKit

class ShopViewController: UIViewController ,UITableViewDelegate ,UITableViewDataSource{

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var menuTableView: UITableView!
    
    var titleString = [0 : "Bat and Ball", 1 : "Hockey" ,2 : "Cricket" ,3 : "Football" ]
    var rowString = [0: ["Baseball", "Softball", "Cricket"], 1: ["Field Hockey", "Ice Hockey", "Roller Hockey"] ,2: ["Field Hockey", "Ice Hockey", "Roller Hockey"],3: ["Football", "Ice Hockey", "Roller Hockey"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //lblName.text = "ali"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnOne(_ sender: Any) {
//        let numberOfSections = self.menuTableView.numberOfSections
//           let numberOfRows = self.menuTableView.numberOfRows(inSection: numberOfSections-1)
//
//           let indexPath = IndexPath(row: numberOfRows-1 , section: numberOfSections-1)
//           self.menuTableView.scrollToRow(at: indexPath, at: .middle, animated: true)
//        let indexPath = NSIndexPath(item: 1, section: 1)
//        menuTableView.scrollToRow(at: indexPath as IndexPath, at: UITableView.ScrollPosition.middle, animated: true)
        let indexPath = IndexPath(row: 0, section: 1)
        menuTableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
    @IBAction func btnSecond(_ sender: Any) {
        let indexPath = IndexPath(row: 0, section: 2)
        menuTableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (rowString[section]?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuTableViewCell
        
        cell.lblName.text = rowString[indexPath.section]?[indexPath.row]
            cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let sectionView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 25))
        sectionView.backgroundColor = UIColor.black

        let sectionName = UILabel(frame: CGRect(x: 5, y: 0, width: tableView.frame.size.width, height: 25))
        sectionName.text = titleString[section]
        sectionName.textColor = UIColor.white
        sectionName.font = UIFont.systemFont(ofSize: 14)
        sectionName.textAlignment = .left

        sectionView.addSubview(sectionName)
        return sectionView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130.0
    }
  
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
      //  SideMainVCViewController.showMainVC()
    }
    
   


}
