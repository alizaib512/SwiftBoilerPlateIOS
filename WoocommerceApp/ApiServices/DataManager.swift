//
//  DataManager.swift
//  WoocommerceApp
//
//  Created by XintSolutions on 06/08/2021.
//

import Foundation
class DataManager{
    
    
    public static let shared = DataManager()
    
    var allCategoriesData = [String]()
    
    
    private init() {
         
             // initializer code here
         }
    func saveAllCategories(model :[String]){
           //Code Process
        self.allCategoriesData =  model
       }
    

}

