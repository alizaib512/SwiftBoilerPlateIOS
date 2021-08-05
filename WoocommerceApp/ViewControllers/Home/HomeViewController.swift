//
//  HomeViewController.swift
//  WoocommerceApp
//
//  Created by XintSolutions on 28/07/2021.
//

import UIKit
import ImageSlideshow
class HomeViewController: UIViewController, ImageSlideshowDelegate ,UICollectionViewDelegate ,UICollectionViewDataSource {
    
    @IBOutlet weak var slideShow: ImageSlideshow!
    @IBOutlet weak var categoriesCollectionVeiw: UICollectionView!
    
    
    let localSource = [BundleImageSource(imageString: "img"), BundleImageSource(imageString: "img1"), BundleImageSource(imageString: "img2")]
    var showSideButtons: Bool = true
    var allCategories = [CategoriesModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.tintColor = UIColor.black
 
        if showSideButtons {
       //     navigationItem.leftBarButtonItem = UIBarButtonItem(image: menuIconImage, style: .plain, target: self, action: #selector(showLeftView(sender:)))
        }
        
        self.getAllServices()
        
        self.slider()

    }
 
    
    @IBAction func btnSidemenu(_ sender: Any) {
        
        sideMenuController?.toggleLeftView(animated: true)
    }
    
    
    // MARK: - UICollectionViewDataSource protocol
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       if(collectionView == categoriesCollectionVeiw){
        return self.allCategories.count
       }else{
          return 0
       }
       
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       // get a reference to our storyboard cell
     //  if(collectionView ==  categoriesCollectionVeiw){
          let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! CategoriesCollectionViewCell
          if let layout = self.categoriesCollectionVeiw.collectionViewLayout as? UICollectionViewFlowLayout{
             let width = UIScreen.main.bounds.width
             layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
             layout.itemSize = CGSize(width: width * 2 , height: width)
             layout.minimumInteritemSpacing = 0
             layout.minimumLineSpacing = 5
          }
        
        cell1.cellView.addShadow(opacity: 0.3, cornerRadius: 5.0, shadowRadius: 2)
        cell1.lblCategoryName.text = self.allCategories[indexPath.row].name!
        if let urlString = self.allCategories[indexPath.row].url {
           if let url = URL(string:  urlString) {
            cell1.collectionImage.sd_setImage(with: url, placeholderImage: UIImage(named: "img"))
           }
           
          
        }
        
          
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
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//       return CGSize(width: 50.0, height: 250.0)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
       return 0
    }
    
    
    
    
    func getAllServices()
    {
       if(Reachability.isConnectedToNetwork()){
          // CommonMethods.startAnimation(animation: animationView, view: self.lottieView)
          let params = [
             "action":"getcategory" as Any,
          ]
          as [String : Any]
          
          
          WebApi.getAllCategories(params as [String : Any], withCompletionHandler: { (list) in
             
            print(list as Any)
            
             self.allCategories =  list!
            self.categoriesCollectionVeiw.reloadData()
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
    
    
    
    @objc
    func showLeftView(sender: AnyObject?) {
        sideMenuController?.toggleLeftView(animated: true)
    }
 
    
    @objc func didTap() {
        let fullScreenController = slideShow.presentFullScreenController(from: self)
        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .medium, color: nil)
    }
    
    
    //MARK:- SLider images
    func slider(){
        
        slideShow.slideshowInterval = 2.0
        slideShow.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
        slideShow.contentScaleMode = UIViewContentMode.scaleAspectFit

        let pageIndicator = UIPageControl()
        pageIndicator.currentPageIndicatorTintColor = UIColor.lightGray
        pageIndicator.pageIndicatorTintColor = UIColor.black
       
        slideShow.pageIndicator = pageIndicator
        slideShow.activityIndicator = DefaultActivityIndicator()
        slideShow.delegate = self
        slideShow.setImageInputs(localSource)

        let recognizer = UITapGestureRecognizer(target: self, action: #selector(HomeViewController.didTap))
        slideShow.addGestureRecognizer(recognizer)
        
    }
    

}


extension HomeViewController {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        print("current page:", page)
    }
}

