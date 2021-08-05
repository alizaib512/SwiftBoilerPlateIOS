//
//  ProductModel.swift
//  WoocommerceApp
//
//  Created by XintSolutions on 04/08/2021.
//

import Foundation
import EVReflection

class ProductModel :EVObject{
    var id: String?
    var postAuthor, postDate, postDateGmt, postContent: String?
    var post_title, postExcerpt, postStatus,commentStatus,pingStatus: String?
    var postPassword, postName, toPing, pinged: String?
    var postModified, postModifiedGmt, postContentFiltered,priceHTML: String?
    var postParent: Int?
    var guid,postType,filter: String?
    var menuOrder: Int?
    var postMIMEType, commentCount: String?
    var url: String?
    var price: String?
    var welcomeDescription: String?
}
