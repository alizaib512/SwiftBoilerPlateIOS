//
//  TestViewController.swift
//  ViewPager-Swift
//
//  Created by Nishan Niraula on 4/13/19.
//  Copyright © 2019 Nishan. All rights reserved.
//

import UIKit
import ViewPager_Swift
class TestViewController: UIViewController ,UICollectionViewDelegate ,UICollectionViewDataSource {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    var productByCategories =  [ProductModel]()
    var tabs = [
        ViewPagerTab(title: "Fries", image: UIImage(named: "fries")),
        ViewPagerTab(title: "Hamburger", image: UIImage(named: "hamburger")),
        ViewPagerTab(title: "Beer", image: UIImage(named: "pint")),
        ViewPagerTab(title: "Pizza", image: UIImage(named: "pizza")),
        ViewPagerTab(title: "Orange", image: UIImage(named: "orange")),
        ViewPagerTab(title: "Sandwich", image: UIImage(named: "sandwich"))
    ]
    //  var options: ViewPagerOptions?
    var options = ViewPagerOptions()
    var pager : ViewPager?
    
    //    override func loadView() {
    //       // options.tabType = .imageWithText
    //      //  options.distribution = .segmented
    //        let newView = UIView()
    //        newView.backgroundColor = UIColor.white
    //
    //        view = newView
    //    }
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        guard let options = self.options else { return }
        
        
        
        pager = ViewPager(viewController: self)
        pager?.setOptions(options: options)
        pager?.setDataSource(dataSource: self)
        pager?.setDelegate(delegate: self)
        pager?.build()
        pager?.invalidateCurrentTabs()
        self.getProcutsByCategories()
    }
    
    
    @IBAction func btnTest(_ sender: Any) {
        
        print("helo")
    }
    
    
    
    
    deinit {
        print("Memory Deallocation")
    }
    
    // MARK: - UICollectionViewDataSource protocol
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if(collectionView == productCollectionView){
          return  10
            //  return self.productByCategories.count
        }else{
            return 0
        }
        
        
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // get a reference to our storyboard cell
        //  if(collectionView ==  categoriesCollectionVeiw){
        let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! ProductsCollectionViewCell
        if let layout = self.productCollectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            let width = UIScreen.main.bounds.width
            layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
            layout.itemSize = CGSize(width: width * 2 , height: width*2)
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 5
        }
        
        
//        let rectShape = CAShapeLayer()
//        rectShape.bounds = cell1.cellView.frame
//        rectShape.position = cell1.cellView.center
//        rectShape.path = UIBezierPath(roundedRect: cell1.cellView.bounds, byRoundingCorners: [ .bottomRight , .topLeft], cornerRadii: CGSize(width: 18, height: 18)).cgPath
//        cell1.cellView.layer.mask = rectShape
     //   cell1.cellView.addShadow(opacity: 0.3, cornerRadius: 5.0, shadowRadius: 2)
        //        cell1.lblCategoryName.text = self.productByCategories[indexPath.row].postName
        //        if let urlString = self.productByCategories[indexPath.row].url {
        //           if let url = URL(string:  urlString) {
        //            cell1.collectionImage.sd_setImage(with: url, placeholderImage: UIImage(named: "img"))
        //           }
        //
        //
        //        }
        
        
        return cell1
        //       }else{
        //
        //       }
        //       else{
        //          let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath as IndexPath) as! TopBarbersCollectionViewCell
        //
        //          if let layout = self.collectionView1.collectionViewLayout as? UICollectionViewFlowLayout{
        //             let width = UIScreen.main.bounds.width
        //             layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        //             layout.itemSize = CGSize(width: width / 3.0, height: width / 2)
        //             layout.minimumInteritemSpacing = 0
        //             layout.minimumLineSpacing = 5
        //          }
        //          let data =  self.barbersArray[indexPath.row]
        //          if let urlString = data.avatar {
        //             if let url = URL(string: imageBaseUrl + urlString) {
        //                cell2.imgTopBarber.sd_setImage(with: url, placeholderImage: UIImage(named: "barberimg"))
        //             }
        //             cell2.lblName.text  =  data.name
        //             cell2.lblContact.text =  data.phone
        //          }
        //          return cell2
        //       }
        
        
    }
    
    
    
    
    
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        //        let vc = self.storyboard?.instantiateViewController(withIdentifier: "bookAppointment")as! BookAnAppointmentVC
        //
        //      //  vc.salonDataa = self.services[indexPath.row]
        //        self.navigationController?.pushViewController(vc, animated: true)
        
        self.performSegue(withIdentifier: "goToSalonList", sender: self)
        // self.performSegue(withIdentifier: "bookAppointment", sender: self)
    }
    
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 50.0, height: 322.0)
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    //MARK:-API for get product By categories 
    func getProcutsByCategories()
    {
        if(Reachability.isConnectedToNetwork()){
            // CommonMethods.startAnimation(animation: animationView, view: self.lottieView)
            let params = [
                "action":"getcategory" as Any,
                "cat_name":"Armaf" as Any
            ]
            as [String : Any]
            
            
            WebApi.getProductByCategories(params as [String : Any], withCompletionHandler: { (list) in
                
                print(list as Any)
                
                self.productByCategories =  list!
                self.productCollectionView.reloadData()
                //self.servicesCollectionView.reloadData()
                // self.collectionView1.reloadData()
                
                //   self.animationView.stop()
                // self.lottieView.isHidden = true
                //            self.salonArray =  list!
                //po
                //            if(self.salonArray.count > 0){
                //                self.mainTableView.reloadData()
                //
                //            }
                //   AppUtility.hideLoader(self.view)
                
                //            self.complaintsList.removeAll()
                //            self.complaintsList = list!
                //            self.refreshControll.endRefreshing()
                //            self.complaintsList_tableview.reloadData()
                
            }) { (title, message) in
                // self.animationView.stop()
                //self.lottieView.isHidden = true
                // CommonMethods.showErrorAlertView(title: "Error!", description:message!, view: self)
                // AppUtility.hideLoader(self.view)
                //AppUtility.errorMessage(title, Message: message)
            }
        }else{
            //          CommonMethods.doSomething(view: self) {
            //             self.getAllServices()
            //          }
        }
        
        
    }
    
    
}

extension TestViewController: ViewPagerDataSource {
    
    func numberOfPages() -> Int {
        return tabs.count
    }
    
    func viewControllerAtPosition(position:Int) -> UIViewController {
        
        let vc = ItemViewController()
        lblName.text = "\(tabs[position].title)"
        //   vc.itemText = "\(tabs[position].title)"
        
        return vc
    }
    
    func tabsForPages() -> [ViewPagerTab] {
        return tabs
    }
    
    func startViewPagerAtIndex() -> Int {
        return 0
    }
}

extension TestViewController: ViewPagerDelegate {
    
    func willMoveToControllerAtIndex(index:Int) {
        print("Moving to page \(index)")
    }
    
    func didMoveToControllerAtIndex(index: Int) {
        print("Moved to page \(index)")
    }
}
