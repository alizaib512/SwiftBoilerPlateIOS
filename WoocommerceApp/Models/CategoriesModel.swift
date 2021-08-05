//
//  CategoriesModel.swift
//  WoocommerceApp
//
//  Created by XintSolutions on 29/07/2021.
//

import Foundation
import EVReflection

class CategoriesModel :EVObject{

       var term_id: String?
       var name, slug: String?
       var termGroup, termTaxonomyID: Int?
       var taxonomy, welcomeDescription: String?
       var parent, count: Int?
       var filter: String?
       var url: String?
       var sub: [Any?]?
    
}
