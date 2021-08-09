//
//  ContentVC.swift
//  PageViewControllerWithTabs
//
//  Created by Leela Prasad on 22/03/18.
//  Copyright © 2018 Leela Prasad. All rights reserved.
//

import UIKit
import ViewAnimator
import Lottie
class ContentVC: UIViewController  ,UICollectionViewDelegate ,UICollectionViewDataSource{
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var lottieView: UIView!
    
    private let animations = [AnimationType.vector((CGVector(dx: 0, dy: 30)))]
    var productsDetail =  [ProductModel]()
    var initiallyAnimates = true
    private var items = [Any?]()
    var pageIndex: Int = 0
    var strTitle: String!
    
    let animationView = AnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getProcutsByCategories()

    }
    
    // MARK: - UICollectionViewDataSource protocol
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if(collectionView == productCollectionView){
            return  self.productsDetail.count
            //  return self.productByCategories.count
        }else{
            return 0
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! ProductsCollectionViewCell
        
        cell1.cellView.dropShadow()
        cell1.lblProductName.text = self.productsDetail[indexPath.row].post_name
        if let urlString = self.productsDetail[indexPath.row].url {
            if let url = URL(string:  urlString) {
                cell1.imgProduct.sd_setImage(with: url, placeholderImage: UIImage(named: "img"))
            }
            
            
        }
        
        
        return cell1
        
    }

    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        //  self.performSegue(withIdentifier: "goToSalonList", sender: self)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50.0, height: 322.0)
    }
    //
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    //MARK:-API for get product By categories
    func getProcutsByCategories()
    {
        
        self.animationView.backgroundBehavior = .pauseAndRestore
        if(Reachability.isConnectedToNetwork()){
            if self.animationView.isAnimationPlaying == false {
                CommonMethods.startAnimation(animation: animationView, view: self.lottieView)
            }
            
            let params = [
                "action":"getproduct" as Any,
                "cat_name":strTitle! as Any
            ]
            as [String : Any]
            
            
            WebApi.getProductByCategories(params as [String : Any], withCompletionHandler: { (list) in
                
                print(list as Any)
                
                self.productsDetail =  list!
                if self.initiallyAnimates {
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.43) {
                        self.items = Array<Any>(repeating: "", count: 5)
                        self.productCollectionView?.reloadData()
                        self.productCollectionView?.performBatchUpdates({
                            UIView.animate(views: self.productCollectionView!.orderedVisibleCells,
                                           animations: self.animations, completion: {
                                            
                                           })
                        }, completion: nil)
                    }
                }
                self.lottieView.isHidden = true
            }) { (title, message) in
                // self.animationView.pause()
                self.lottieView.isHidden = true
                CommonMethods.showErrorAlertView(title: "Error!", description:message!, view: self)
            }
        }else{
            CommonMethods.doSomething(view: self) {
                self.getProcutsByCategories()
            }
        }
        
        
    }
    
}
