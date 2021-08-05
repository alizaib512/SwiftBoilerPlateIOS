//
//  ContentVC.swift
//  PageViewControllerWithTabs
//
//  Created by Leela Prasad on 22/03/18.
//  Copyright © 2018 Leela Prasad. All rights reserved.
//

import UIKit


class ContentVC: UIViewController  ,UICollectionViewDelegate ,UICollectionViewDataSource{
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    var pageIndex: Int = 0
    var strTitle: String!

    override func viewDidLoad() {
        super.viewDidLoad()
      //  nameLabel.text = strTitle
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
//        if let layout = self.productCollectionView.collectionViewLayout as? UICollectionViewFlowLayout{
//            let width = UIScreen.main.bounds.width
//            layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
//            layout.itemSize = CGSize(width: width * 2 , height: width*2)
//            layout.minimumInteritemSpacing = 0
//            layout.minimumLineSpacing = 5
//        }
        
        
//a        let rectShape = CAShapeLayer()
//a        rectShape.bounds = cell1.cellView.frame
//a        rectShape.position = cell1.cellView.center
//a        rectShape.path = UIBezierPath(roundedRect: cell1.cellView.bounds, byRoundingCorners: [ .bottomRight , .topLeft], cornerRadii: CGSize(width: 18, height: 18)).cgPath
//a        cell1.cellView.layer.mask = rectShape
//a        cell1.cellView.addShadow(opacity: 0.3, cornerRadius: 5.0, shadowRadius: 2)
        //        cell1.lblCategoryName.text = self.productByCategories[indexPath.row].postName
        //        if let urlString = self.productByCategories[indexPath.row].url {
        //           if let url = URL(string:  urlString) {
        //            cell1.collectionImage.sd_setImage(with: url, placeholderImage: UIImage(named: "img"))
        //           }
        //
        //
        //        }
        
        
        return cell1
 
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
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
