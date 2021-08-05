//
//  WebApi.swift
//  ivids
//
//  Created by Muhammad Junaid on 4/24/20.
//  Copyright © 2020 Elemntray Logics. All rights reserved.
//

import UIKit
import Photos
import SwiftyJSON
import EVReflection
class WebApi: NSObject {
   
   static var ErrorBlock: ((_ errorTitle: String?, _ errorMessage: String?) -> Void)?
   
   func showNetworkConnectivityError() {
      WebApi.ErrorBlock!("Error","Netwrok Error" );
   }
   
   class func showServerError(with errorDesc: String?) {
      WebApi.ErrorBlock!("Error", errorDesc)
   }
   
   class func showDataFetchingError(with errorDesc: String?) {
      WebApi.ErrorBlock!("Error", errorDesc)
   }
   
       //MARK:- getservices Api
       class func getAllCategories(_ params: [String : Any ]?, withCompletionHandler completion: @escaping (_ returbObj: [CategoriesModel]?) -> Void, didFailWithError Error: @escaping (_ errorTitle: String?, _ errorMessage: String?) -> Void) {
    
          let urlString = Base_Url
    
        HttpClient .getRequest(input:params! as NSDictionary, urlString: urlString, completion: { (result, error) -> Void in
             if((error) != nil)
             {
                Error("Error",error?.localizedDescription)
             }
             else
             {
                if(result!.count > 0){
                    let fetchingError: Error? = nil
                    let response = [CategoriesModel](dictionaryArray:result as! [NSDictionary] )
                    print(response)
                    if(fetchingError == nil)
                    {
                        completion(response)
                    }
                }
//                if(result?.object(forKey: "success") as! Bool)
//                {
//                   let fetchingError: Error? = nil
//                   let objData = result?.object(forKey: "data") as? NSArray
//                   let response = [CategoriesModel](dictionaryArray:objData?.firstObject! as! [NSDictionary] )
//                   if(fetchingError == nil)
//                   {
//                      completion(response)
//                   }
//    
//                }
//                else
//                {
//                   let error = result?.object(forKey: "errors") as? [String]
//                   Error("Error",error?.first)
//                }
             }
          })
       }
    
    
    //MARK:- getProductByCategories Api
    class func getProductByCategories(_ params: [String : Any ]?, withCompletionHandler completion: @escaping (_ returbObj: [ProductModel]?) -> Void, didFailWithError Error: @escaping (_ errorTitle: String?, _ errorMessage: String?) -> Void) {
 
       let urlString = Base_Url
 
     HttpClient .getRequest(input:params! as NSDictionary, urlString: urlString, completion: { (result, error) -> Void in
          if((error) != nil)
          {
             Error("Error",error?.localizedDescription)
          }
          else
          {
             if(result!.count > 0){
                 let fetchingError: Error? = nil
                 let response = [ProductModel](dictionaryArray:result as! [NSDictionary] )
                 print(response)
                 if(fetchingError == nil)
                 {
                     completion(response)
                 }
             }
//                if(result?.object(forKey: "success") as! Bool)
//                {
//                   let fetchingError: Error? = nil
//                   let objData = result?.object(forKey: "data") as? NSArray
//                   let response = [CategoriesModel](dictionaryArray:objData?.firstObject! as! [NSDictionary] )
//                   if(fetchingError == nil)
//                   {
//                      completion(response)
//                   }
//
//                }
//                else
//                {
//                   let error = result?.object(forKey: "errors") as? [String]
//                   Error("Error",error?.first)
//                }
          }
       })
    }
    
    
    
    
    //
    //   //MARK:- getAppointments Api
    //   class func getAppointments(_ params: [String : Any ]?, withCompletionHandler completion: @escaping (_ returbObj: [makeupAppointment]?) -> Void, didFailWithError Error: @escaping (_ errorTitle: String?, _ errorMessage: String?) -> Void) {
    //
    //
    //      let urlString = Base_Url + "appointment/list"
    //
    //      HttpClient .getRequest(input:params! as NSDictionary, urlString: urlString, completion: { (result, error) -> Void in
    //         if((error) != nil)
    //         {
    //            Error("Error",error?.localizedDescription)
    //         }
    //         else
    //         {
    //            if(result?.object(forKey: "success") as! Bool)
    //            {
    //               let fetchingError: Error? = nil
    //               let objData = result?.object(forKey: "data") as? NSDictionary
    //               let appointments =  objData?.object(forKey: "appointments") as? NSArray
    //               let userAppointments = [makeupAppointment](dictionaryArray:appointments! as! [NSDictionary] )
    //               if(fetchingError == nil)
    //               {
    //                  completion(userAppointments)
    //               }
    //
    //            }
    //            else
    //            {
    //               let error = result?.object(forKey: "errors") as? [String]
    //               Error("Error",error?.first)
    //            }
    //         }
    //      })
    //   }
    //
   

    
   

   
//   //MARK:- get all Salons  API
//
//   class func getAllCategories(_ params: String?, withCompletionHandler completion: @escaping (_ returbObj: [SalonModel]?) -> Void, didFailWithError Error: @escaping (_ errorTitle: String?, _ errorMessage: String?) -> Void) {
//
//
//      let  urlString = Base_Url + "shops/"
//
//      HttpClient .getRequest(input: [:], urlString: urlString, completion: { (result, error) -> Void in
//         if((error) != nil)
//         {
//            Error("Error",error?.localizedDescription)
//         }
//         else
//         {
//            if(result?.object(forKey: "success") as! Bool)
//            {
//               let fetchingError: Error? = nil
//               let objData = result?.object(forKey: "data") as? NSArray
//
//               let Salons = [SalonModel](dictionaryArray:objData?.firstObject! as! [NSDictionary] )
//               //                    let data = APIServices()
//               //                    data.salonArray =  Salons
//               if(fetchingError == nil)
//               {
//                  completion(Salons)
//               }
//
//            }
//            else
//            {
//               let error = result?.object(forKey: "errors") as? [String]
//               Error("Error",error?.first)
//            }
//         }
//      })
//   }
   
   
//   //MARK:- get all Experts  API
//
//   class func getExperts(_ params: String?, withCompletionHandler completion: @escaping (_ returbObj: [ExpertModel]?) -> Void, didFailWithError Error: @escaping (_ errorTitle: String?, _ errorMessage: String?) -> Void) {
//
//
//
//      let urlString = Base_Url + "experts/all"
//
//      HttpClient .getRequest(input: [:], urlString: urlString, completion: { (result, error) -> Void in
//         if((error) != nil)
//         {
//            Error("Error",error?.localizedDescription)
//         }
//         else
//         {
//            if(result?.object(forKey: "success") as! Bool)
//            {
//               let fetchingError: Error? = nil
//               let objData = result?.object(forKey: "data") as? NSDictionary
//               let experts = objData?.object(forKey: "experts") as? NSArray
//
//               let barberDetails = [ExpertModel](dictionaryArray:experts as! [NSDictionary] )
//
//               if(fetchingError == nil)
//               {
//                  completion(barberDetails)
//               }
//
//            }
//            else
//            {
//               let error = result?.object(forKey: "errors") as? [String]
//               Error("Error",error?.first)
//            }
//         }
//      })
//   }
//
//
//   //MARK:- getservices Api
//   class func getServices(_ params: [String : Any ]?, withCompletionHandler completion: @escaping (_ returbObj: [salonServices]?) -> Void, didFailWithError Error: @escaping (_ errorTitle: String?, _ errorMessage: String?) -> Void) {
//
//      let urlString = Base_Url + "services/get"
//
//      HttpClient .getRequest(input:[:], urlString: urlString, completion: { (result, error) -> Void in
//         if((error) != nil)
//         {
//            Error("Error",error?.localizedDescription)
//         }
//         else
//         {
//            if(result?.object(forKey: "success") as! Bool)
//            {
//               let fetchingError: Error? = nil
//               let objData = result?.object(forKey: "data") as? NSArray
//               let salonService = [salonServices](dictionaryArray:objData?.firstObject! as! [NSDictionary] )
//               if(fetchingError == nil)
//               {
//                  completion(salonService)
//               }
//
//            }
//            else
//            {
//               let error = result?.object(forKey: "errors") as? [String]
//               Error("Error",error?.first)
//            }
//         }
//      })
//   }
//
//   //MARK:- getAppointments Api
//   class func getAppointments(_ params: [String : Any ]?, withCompletionHandler completion: @escaping (_ returbObj: [makeupAppointment]?) -> Void, didFailWithError Error: @escaping (_ errorTitle: String?, _ errorMessage: String?) -> Void) {
//
//
//      let urlString = Base_Url + "appointment/list"
//
//      HttpClient .getRequest(input:params! as NSDictionary, urlString: urlString, completion: { (result, error) -> Void in
//         if((error) != nil)
//         {
//            Error("Error",error?.localizedDescription)
//         }
//         else
//         {
//            if(result?.object(forKey: "success") as! Bool)
//            {
//               let fetchingError: Error? = nil
//               let objData = result?.object(forKey: "data") as? NSDictionary
//               let appointments =  objData?.object(forKey: "appointments") as? NSArray
//               let userAppointments = [makeupAppointment](dictionaryArray:appointments! as! [NSDictionary] )
//               if(fetchingError == nil)
//               {
//                  completion(userAppointments)
//               }
//
//            }
//            else
//            {
//               let error = result?.object(forKey: "errors") as? [String]
//               Error("Error",error?.first)
//            }
//         }
//      })
//   }
//
//
//   //MARK:- getBarberAppointmentDetail Api
//   class func getBarberAppointmentDetail(_ params: [String : Any ]?, withCompletionHandler completion: @escaping (_ returbObj: makeupData?) -> Void, didFailWithError Error: @escaping (_ errorTitle: String?, _ errorMessage: String?) -> Void) {
//
//
//      let urlString = Base_Url + "appointment/get-barber?"
//
//      HttpClient .getRequest(input:params! as NSDictionary, urlString: urlString, completion: { (result, error) -> Void in
//         if((error) != nil)
//         {
//            Error("Error",error?.localizedDescription)
//         }
//         else
//         {
//            if(result?.object(forKey: "success") as! Bool)
//            {
//               let fetchingError: Error? = nil
//               let objData = result?.object(forKey: "data") as? NSDictionary
//
//               let userAppointments = makeupData(dictionary:objData! )
//               if(fetchingError == nil)
//               {
//                  completion(userAppointments)
//               }
//
//            }
//            else
//            {
//               let error = result?.object(forKey: "errors") as? [String]
//               Error("Error",error?.first)
//            }
//         }
//      })
//   }
//
//
//
//   //MARK:- Signup APi
//
//   class func createAppointment(_ params: [String : Any ]?, withCompletionHandler completion: @escaping (_ returbObj: String) -> Void, didFailWithError Error: @escaping (_ errorTitle: String?, _ errorMessage: String?) -> Void) {
//
//
//      let urlString = Base_Url +  "appointment/store"
//
//      HttpClient .postRequest(input: params! as NSDictionary, urlString: urlString, completion: { (result, error) -> Void in
//         if((error) != nil)
//         {
//            Error("Error",error?.localizedDescription)
//         }
//         else
//         {
//            if(result?.object(forKey: "success") as! Bool)
//            {
//               print(result as Any)
//               let fetchingError: Error? = nil
//
//               let message = result?.object(forKey: "message") as? String
//
//
//               if(fetchingError == nil)
//               {
//
//                  completion(message!)
//               }
//
//            }
//            else
//            {
//               let error = result?.object(forKey: "errors") as? [String]
//               Error("Error",error?.first)
//            }
//         }
//      })
//   }
//
//
//   //MARK:-api for upload image
//
//   class func uploadImage(params: [String:Any] ,key : String, imgData : Data, withCompletionHandler completion: @escaping (_ returbObj: String?) -> Void, didFailWithError Error: @escaping (_ errorTitle: String?, _ errorMessage: String?) -> Void) {
//
//
//      let urlString = Base_Url +  "user/update-image"
//
//      HttpClient .uploadMediaFileWith(input:params , urlString: urlString, fileKey: key, fileData: imgData) { (result, error) in
//         if((error) != nil)
//         {
//            Error("Error",error?.localizedDescription)
//         }
//         else
//         {
//            if(result?.object(forKey: "success") as! Bool)
//            {
//               let fetchingError: Error? = nil
//               let message = result?.object(forKey: "message") as? String
//               if(fetchingError == nil)
//               {
//                  completion(message!)
//               }
//
//            }
//            else
//            {
//               let error = result?.object(forKey: "errors") as? [String]
//               Error("Error",error?.first)
//            }
//         }
//      }
//   }
//
//   //MARK:- update profile
//
//   class func updateProfile(_ params: [String : Any ]?, withCompletionHandler completion: @escaping (_ returbObj: String) -> Void, didFailWithError Error: @escaping (_ errorTitle: String?, _ errorMessage: String?) -> Void) {
//
//
//      let urlString = Base_Url +  "user/update-profile"
//
//      HttpClient .postRequest(input: params! as NSDictionary, urlString: urlString, completion: { (result, error) -> Void in
//         if((error) != nil)
//         {
//            Error("Error",error?.localizedDescription)
//         }
//         else
//         {
//            if(result?.object(forKey: "success") as! Bool)
//            {
//               print(result as Any)
//               let fetchingError: Error? = nil
//               let objData = result?.object(forKey: "data") as? NSArray
//
//               let userProfileUpdate = [userSignInModel](dictionaryArray:objData as! [NSDictionary])
//               UtilityFunctions.saveUser(userData: userProfileUpdate)
//               // let objData = result?.object(forKey: "data") as? NSDictionary
//
//               //  let userSignUp = [userSignInModel](dictionaryArray:objData as! [NSDictionary])
//               let message = result?.object(forKey: "message") as? String
//
//
//               if(fetchingError == nil)
//               {
//
//                  completion(message!)
//               }
//
//            }
//            else
//            {
//               let error = result?.object(forKey: "errors") as? [String]
//               Error("Error",error?.first)
//            }
//         }
//      })
//   }
//
//
//   //MARK:- ContactUs APi
//
//   class func contactUs(_ params: [String : Any ]?, withCompletionHandler completion: @escaping (_ returbObj: String) -> Void, didFailWithError Error: @escaping (_ errorTitle: String?, _ errorMessage: String?) -> Void) {
//
//
//      let urlString = Base_Url +  "user/contact-us"
//
//      HttpClient .postRequest(input: params! as NSDictionary, urlString: urlString, completion: { (result, error) -> Void in
//         if((error) != nil)
//         {
//            Error("Error",error?.localizedDescription)
//         }
//         else
//         {
//            if(result?.object(forKey: "success") as! Bool)
//            {
//               print(result as Any)
//
//               let fetchingError: Error? = nil
//
//               let message = result?.object(forKey: "message") as? String
//
//
//
//               if(fetchingError == nil)
//               {
//
//                  completion(message!)
//               }
//
//            }
//            else
//            {
//               let error = result?.object(forKey: "errors") as? [String]
//               Error("Error",error?.first)
//            }
//         }
//      })
//   }
//
//   //MARK:- PostSalonReview APi
//
//   class func postSalonReview(_ params: [String : Any ]?, withCompletionHandler completion: @escaping (_ returbObj: String) -> Void, didFailWithError Error: @escaping (_ errorTitle: String?, _ errorMessage: String?) -> Void) {
//
//
//      let urlString = Base_Url +  "customer/feedback/salon"
//
//      HttpClient .postRequest(input: params! as NSDictionary, urlString: urlString, completion: { (result, error) -> Void in
//         if((error) != nil)
//         {
//            Error("Error",error?.localizedDescription)
//         }
//         else
//         {
//            if(result?.object(forKey: "success") as! Bool)
//            {
//               print(result as Any)
//               let fetchingError: Error? = nil
//               // let objData = result?.object(forKey: "data") as? NSDictionary
//
//               //  let userSignUp = [userSignInModel](dictionaryArray:objData as! [NSDictionary])
//               let message = result?.object(forKey: "message") as? String
//
//
//               if(fetchingError == nil)
//               {
//
//                  completion(message!)
//               }
//
//            }
//            else
//            {
//               let error = result?.object(forKey: "errors") as? [String]
//               Error("Error",error?.first)
//            }
//         }
//      })
//   }
//   //MARK:- get Customer Feedback
//
//   class func getFeedBack(_ params: [String : Any ]?, withCompletionHandler completion: @escaping (_ returbObj: Reviews?) -> Void, didFailWithError Error: @escaping (_ errorTitle: String?, _ errorMessage: String?) -> Void) {
//
//
//      let  urlString = Base_Url + "customer/feedback/"
//
//      HttpClient .getRequest(input: params! as NSDictionary, urlString: urlString, completion: { (result, error) -> Void in
//         if((error) != nil)
//         {
//            Error("Error",error?.localizedDescription)
//         }
//         else
//         {
//            if(result?.object(forKey: "success") as! Bool)
//            {
//               let fetchingError: Error? = nil
//               let objData = result?.object(forKey: "data") as? NSDictionary
//
//               let Salons = Reviews(dictionary:result! )
//
//
//
//               //                    let data = APIServices()
//               //                    data.salonArray =  Salons
//               if(fetchingError == nil)
//               {
//                  completion(Salons)
//               }
//
//            }
//            else
//            {
//               let error = result?.object(forKey: "errors") as? [String]
//               Error("Error",error?.first)
//            }
//         }
//      })
//   }
//
//   //MARK:- get Filters
//
//   class func getFilters(_ params: [String : Any ]?, withCompletionHandler completion: @escaping (_ returbObj: Reviews?) -> Void, didFailWithError Error: @escaping (_ errorTitle: String?, _ errorMessage: String?) -> Void) {
//
//
//      let  urlString = Base_Url + "shops/filter/"
//
//      HttpClient .getRequest(input: params! as NSDictionary, urlString: urlString, completion: { (result, error) -> Void in
//         if((error) != nil)
//         {
//            Error("Error",error?.localizedDescription)
//         }
//         else
//         {
//            if(result?.object(forKey: "success") as! Bool)
//            {
//               let fetchingError: Error? = nil
//               let objData = result?.object(forKey: "data") as? NSDictionary
//
//               let Salons = Reviews(dictionary:result! )
//
//
//
//               //                    let data = APIServices()
//               //                    data.salonArray =  Salons
//               if(fetchingError == nil)
//               {
//                  completion(Salons)
//               }
//
//            }
//            else
//            {
//               let error = result?.object(forKey: "errors") as? [String]
//               Error("Error",error?.first)
//            }
//         }
//      })
//   }
//
//
//   //MARK:- cancelAppointments Api
//   class func cancelAppointments(_ params: [String : Any ]?, withCompletionHandler completion: @escaping (_ returbObj: String?) -> Void, didFailWithError Error: @escaping (_ errorTitle: String?, _ errorMessage: String?) -> Void) {
//
//
//      let urlString = Base_Url + "appointment/change-status"
//
//      HttpClient .getRequest(input:params! as NSDictionary, urlString: urlString, completion: { (result, error) -> Void in
//         if((error) != nil)
//         {
//            Error("Error",error?.localizedDescription)
//         }
//         else
//         {
//            if(result?.object(forKey: "success") as! Bool)
//            {
//               let fetchingError: Error? = nil
//               let objData = result?.object(forKey: "data") as? NSDictionary
//               let message = result?.object(forKey: "message") as? String
//
//               if(fetchingError == nil)
//               {
//                  completion(message)
//               }
//
//            }
//            else
//            {
//               let error = result?.object(forKey: "errors") as? [String]
//               Error("Error",error?.first)
//            }
//         }
//      })
//   }
//
//   //MARK:- getAll Reviews
//   class func getAllReviews(_ params: [String : Any ]?, withCompletionHandler completion: @escaping (_ returbObj: ReviewsData?) -> Void, didFailWithError Error: @escaping (_ errorTitle: String?, _ errorMessage: String?) -> Void) {
//
//
//      let urlString = Base_Url + "barber/reviews"
//
//      HttpClient .getRequest(input:params! as NSDictionary, urlString: urlString, completion: { (result, error) -> Void in
//         if((error) != nil)
//         {
//            Error("Error",error?.localizedDescription)
//         }
//         else
//         {
//            if(result?.object(forKey: "success") as! Bool)
//            {
//               let fetchingError: Error? = nil
//               let objData = result?.object(forKey: "data") as? NSDictionary
//
//              // let appointments =  objData?.object(forKey: "reviews") as? NSArray
//               let userAppointments = ReviewsData(dictionary:objData!)
//               if(fetchingError == nil)
//               {
//                  completion(userAppointments)
//               }
//
//            }
//            else
//            {
//               let error = result?.object(forKey: "errors") as? [String]
//               Error("Error",error?.first)
//            }
//         }
//      })
//   }
//
//
//   //MARK:- getQueueList
//   class func getQueueListOfExpert(_ params: [String : Any ]?, withCompletionHandler completion: @escaping (_ returbObj: queueData?) -> Void, didFailWithError Error: @escaping (_ errorTitle: String?, _ errorMessage: String?) -> Void) {
//
//
//      let urlString = Base_Url + "barber/queue"
//
//      HttpClient .getRequest(input:params! as NSDictionary, urlString: urlString, completion: { (result, error) -> Void in
//         if((error) != nil)
//         {
//            Error("Error",error?.localizedDescription)
//         }
//         else
//         {
//            if(result?.object(forKey: "success") as! Bool)
//            {
//               let fetchingError: Error? = nil
//               let objData = result?.object(forKey: "data") as? NSDictionary
//
//              // let appointments =  objData?.object(forKey: "reviews") as? NSArray
//               let queueResponse = queueData(dictionary:objData!)
//
//               if(fetchingError == nil)
//               {
//                  completion(queueResponse)
//               }
//
//            }
//            else
//            {
//               let error = result?.object(forKey: "errors") as? [String]
//               Error("Error",error?.first)
//            }
//         }
//      })
//   }
   
   
//   //MARK:- Generic Test  Api function
//   class func getTestGeneric<T:EVObject>(_ params: [String : Any ]?, urlString:String? , resultType:T.Type, withCompletionHandler completion: @escaping (_ returbObj: T ) -> Void, didFailWithError Error: @escaping (_ errorTitle: String?, _ errorMessage: String?) -> Void) {
//      
//      
//      let urlString = Base_Url + "appointment/change-status"
//      
//      HttpClient .getRequest(input:params! as NSDictionary, urlString: urlString, completion: { (result, error) -> Void in
//         if((error) != nil)
//         {
//            Error("Error",error?.localizedDescription)
//         }
//         else
//         {
//            if(result?.object(forKey: "success") as! Bool)
//            {
//               let fetchingError: Error? = nil
//               let objData = result?.object(forKey: "data") as? NSDictionary
//               let message = result?.object(forKey: "message") as? String
//               //let appointments =  objData?.object(forKey: "appointments") as? NSArray
//               //  let userAppointments = [makeupAppointment](dictionaryArray:appointments! as! [NSDictionary] )
//              // let resultData =  try
//               //    let salonServices = services(dictionary:result! )
//               
//               //                    let data = APIServices()
//               //                    data.salonArray =  Salons
//               
//               
//               if(fetchingError == nil)
//               {
//                  
//                  completion((T.self: objData))
//               }
//               
//            }
//            else
//            {
//               let error = result?.object(forKey: "errors") as? [String]
//               Error("Error",error?.first)
//            }
//         }
//      })
//   }
   
   
   
  
   
   
   
   //    class func Verify(_ params: [String : Any ]?, withCompletionHandler completion: @escaping (_ returbObj: String) -> Void, didFailWithError Error: @escaping (_ errorTitle: String?, _ errorMessage: String?) -> Void) {
   //
   //
   //                  let urlString = BaseURLString +  "otp/verify"
   //
   //                  HttpClient .postRequest(input: params! as NSDictionary, urlString: urlString, completion: { (result, error) -> Void in
   //                      if((error) != nil)
   //                      {
   //                          Error("Error",error?.localizedDescription)
   //                      }
   //                      else
   //                      {
   //                          if(result?.object(forKey: "success") as! Bool)
   //                          {
   //                           print(result)
   //                              let fetchingError: Error? = nil
   //          //                    let objData = result?.object(forKey: "data") as? NSDictionary;
   //          //
   //                              let message = result?.object(forKey: "message") as? String
   //
   //                              if(fetchingError == nil)
   //                              {
   //                                  completion(message ?? "Sucess")
   //                              }
   //
   //                          }
   //                          else
   //                          {
   //                              let error = result?.object(forKey: "errors") as? [String]
   //                              Error("Error",error?.first)
   //                          }
   //                      }
   //                  })
   //              }
   //
   //    //MARK:- RESEND OTP
   //    class func ResendOtp(_ params: [String : Any ]?, withCompletionHandler completion: @escaping (_ returbObj: String) -> Void, didFailWithError Error: @escaping (_ errorTitle: String?, _ errorMessage: String?) -> Void) {
   //
   //
   //                  let urlString = BaseURLString +  "otp/resend"
   //
   //                  HttpClient .postRequest(input: params! as NSDictionary, urlString: urlString, completion: { (result, error) -> Void in
   //                      if((error) != nil)
   //                      {
   //                          Error("Error",error?.localizedDescription)
   //                      }
   //                      else
   //                      {
   //                          if(result?.object(forKey: "success") as! Bool)
   //                          {
   //                           print(result)
   //                              let fetchingError: Error? = nil
   //          //                    let objData = result?.object(forKey: "data") as? NSDictionary;
   //          //
   //                              let message = result?.object(forKey: "message") as? String
   //
   //                              if(fetchingError == nil)
   //                              {
   //                                  completion(message ?? "Sucess")
   //                              }
   //
   //                          }
   //                          else
   //                          {
   //                              let error = result?.object(forKey: "errors") as? [String]
   //                              Error("Error",error?.first)
   //                          }
   //                      }
   //                  })
   //              }
   //
   //
   //
   //
   //
   //
   //
   //
   //    //status
   //
   //
   //
   //
   //    class func complainStatus(_ params: String?, withCompletionHandler completion: @escaping (_ message: NSDictionary) -> Void, didFailWithError Error: @escaping (_ errorTitle: String?, _ errorMessage: String?) -> Void) {
   //
   //
   //        let urlString = BaseURLStringaddComplain+"ticket/status-wise-list?" + "contact=\(params!)"
   //
   //       HttpClient .getRequest(input: [:], urlString: urlString) { (result, error) -> Void in
   //            if((error) != nil)
   //            {
   //                Error("Error",error?.localizedDescription)
   //            }
   //            else
   //            {
   //                if(result?.object(forKey: "success") as! Bool)
   //                {
   //                    let fetchingError: Error? = nil
   //                    let objData = result?.object(forKey: "data") as? NSDictionary;
   //                   // let videosListData = objData?.object(forKey: "issues") as? [String];
   //                    if(fetchingError == nil)
   //                    {
   //                        completion(objData! as NSDictionary)
   //                    }
   //
   //                }
   //                else
   //                {
   //                    let error = result?.object(forKey: "errors") as? [String]
   //                    Error("Error",error?.first)
   //                }
   //            }
   //        }
   //    }
   //    //MARK:- Submit Ticket
   //    class func submitTicket(_ params: [String : Any]?, withCompletionHandler completion: @escaping (_ returbObj: String) -> Void, didFailWithError Error: @escaping (_ errorTitle: String?, _ errorMessage: String?) -> Void) {
   //
   //
   //        let urlString = BaseURLStringaddComplain + "ticket/store"
   //
   //        HttpClient .postRequest(input: params! as NSDictionary, urlString: urlString, completion: { (result, error) -> Void in
   //            if((error) != nil)
   //            {
   //                Error("Error",error?.localizedDescription)
   //            }
   //            else
   //            {
   //                if(result?.object(forKey: "success") as! Bool)
   //                {
   //                    let fetchingError: Error? = nil
   ////                    let objData = result?.object(forKey: "data") as? NSDictionary;
   ////
   //                    let message = result?.object(forKey: "message") as? String
   //
   //                    if(fetchingError == nil)
   //                    {
   //                        completion(message ?? "Sucess")
   //                    }
   //
   //                }
   //                else
   //                {
   //                    let error = result?.object(forKey: "errors") as? [String]
   //                    Error("Error",error?.first)
   //                }
   //            }
   //        })
   //    }
   //
   //    //MARK: - Ticket List
   //
   //    class func ticketList(_ params: String?, withCompletionHandler completion: @escaping (_ returbObj: [TicketsListModel]?) -> Void, didFailWithError Error: @escaping (_ errorTitle: String?, _ errorMessage: String?) -> Void) {
   //
   //
   //        let urlString = BaseURLStringaddComplain+"ticket/detail-list?" + "contact=\(params!)"
   //
   //        HttpClient .getRequest(input: [:], urlString: urlString, completion: { (result, error) -> Void in
   //            if((error) != nil)
   //            {
   //                Error("Error",error?.localizedDescription)
   //            }
   //            else
   //            {
   //                if(result?.object(forKey: "success") as! Bool)
   //                {
   //                    let fetchingError: Error? = nil
   //                    let objData = result?.object(forKey: "data") as? NSDictionary;
   //                    let ticketListData = objData?.object(forKey: "complainer") as? NSArray;
   //                    let ticketListArray = [TicketsListModel](dictionaryArray: ticketListData as! [NSDictionary])
   //                    if(fetchingError == nil)
   //                    {
   //                        completion(ticketListArray)
   //                    }
   //
   //                }
   //                else
   //                {
   //                    let error = result?.object(forKey: "errors") as? [String]
   //                    Error("Error",error?.first)
   //                }
   //            }
   //        })
   //    }
   //
   //
   //    //MARK:- ISSUE list
   //    class func issuesList(withCompletionHandler completion: @escaping (_ message: [String]) -> Void, didFailWithError Error: @escaping (_ errorTitle: String?, _ errorMessage: String?) -> Void) {
   //
   //
   //        let urlString = BaseURLString+"ticket/issues"
   //
   //       HttpClient .getRequest(input: [:], urlString: urlString) { (result, error) -> Void in
   //            if((error) != nil)
   //            {
   //                Error("Error",error?.localizedDescription)
   //            }
   //            else
   //            {
   //                if(result?.object(forKey: "success") as! Bool)
   //                {
   //                    let fetchingError: Error? = nil
   //                    let objData = result?.object(forKey: "data") as? NSDictionary;
   //                    let videosListData = objData?.object(forKey: "issues") as? [String];
   //                    if(fetchingError == nil)
   //                    {
   //                        completion(videosListData!)
   //                    }
   //
   //                }
   //                else
   //                {
   //                    let error = result?.object(forKey: "errors") as? [String]
   //                    Error("Error",error?.first)
   //                }
   //            }
   //        }
   //    }
   //
   //
   //
   //
   //
   //
   
}
