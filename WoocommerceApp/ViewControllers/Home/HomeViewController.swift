//
//  HomeViewController.swift
//  WoocommerceApp
//
//  Created by XintSolutions on 28/07/2021.
//

import UIKit
import ImageSlideshow
import Lottie
class HomeViewController: UIViewController, ImageSlideshowDelegate ,UICollectionViewDelegate ,UICollectionViewDataSource {
    
    @IBOutlet weak var slideShow: ImageSlideshow!
    @IBOutlet weak var categoriesCollectionVeiw: UICollectionView!
    
    @IBOutlet weak var lottieView: UIView!
    
    let animationView =  AnimationView()
    let localSource = [BundleImageSource(imageString: "img"), BundleImageSource(imageString: "img1"), BundleImageSource(imageString: "img2")]
    var showSideButtons: Bool = true
    var allCategories = [CategoriesModel]()
    
    var categoriesName = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.tintColor = UIColor.black
        self.getAllCategories()
        
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
        let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! CategoriesCollectionViewCell
        if let layout = self.categoriesCollectionVeiw.collectionViewLayout as? UICollectionViewFlowLayout{
            let width = UIScreen.main.bounds.width
            layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
            layout.itemSize = CGSize(width: width * 2 , height: width)
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 5
        }
        
        cell1.cellView.dropShadow()
        cell1.lblCategoryName.text = self.allCategories[indexPath.row].name!
        self.categoriesName.append(self.allCategories[indexPath.row].name!)
        DataManager.shared.saveAllCategories(model:  self.categoriesName)
        
        if let urlString = self.allCategories[indexPath.row].url {
            if let url = URL(string:  urlString) {
                cell1.collectionImage.sd_setImage(with: url, placeholderImage: UIImage(named: "img"))
            }
            
            
        }
        
        
        return cell1
    }
    
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ShopSBID")as! ViewController
        vc.isComingFromHomeIndex =   indexPath.row
        //  vc.salonDataa = self.services[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //MARK:-API For get Categories
    func getAllCategories()
    {
        if(Reachability.isConnectedToNetwork()){
            CommonMethods.startAnimation(animation: animationView, view: self.lottieView)
            let params = [
                "action":"getcategory" as Any,
            ]
            as [String : Any]
            
            
            WebApi.getAllCategories(params as [String : Any], withCompletionHandler: { (list) in
                
                print(list as Any)
                
                self.allCategories =  list!
                self.categoriesCollectionVeiw.reloadData()
                self.animationView.stop()
                self.lottieView.isHidden = true
        
                
            }) { (title, message) in
                self.animationView.stop()
                self.lottieView.isHidden = true
                CommonMethods.showErrorAlertView(title: "Error!", description:message!, view: self)
            }
        }else{
                      CommonMethods.doSomething(view: self) {
                         self.getAllCategories()
                      }
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

