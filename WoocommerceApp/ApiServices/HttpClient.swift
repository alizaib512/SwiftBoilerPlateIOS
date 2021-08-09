//
//  HttpClient.swift
//  ivids
//
//  Created by Muhammad Junaid on 4/24/20.
//  Copyright © 2020 Elemntray Logics. All rights reserved.
//

import UIKit
import Alamofire
import EVReflection
class HttpClient: NSObject {

    class func postRequest(input: NSDictionary,urlString: String, completion: @escaping (NSDictionary?, NSError?) -> Void) {
        
        let url = URL(string: urlString as String)!
        
        Alamofire.request(url, method: .post, parameters: input as? Parameters, encoding: JSONEncoding.default)
            .responseJSON { response in

                //to get status code

                if(response.result.isSuccess){
                    let result = response.result.value
                    if result == nil{
                        completion(nil ,NSError(domain: "Server error", code: 0, userInfo: [:]))
                    }
                    else{
                        let JSON = result as! NSDictionary
                        completion(JSON,nil);
                    }
                }else{
                    completion(nil ,response.result.error as NSError?);
                }
        }
    }
    

    
    class func uploadMediaFileWith(input: [String:Any],urlString: String,fileKey:String,fileData : Data, completion: @escaping (NSDictionary?, NSError?) -> Void) {
        
        let url = URL(string: urlString as String)!
        
//        var authorizationKey = String()
//        var authorizationValue = String()
        var authHeader : HTTPHeaders = [:]
        
//        let userToken = KUSERDEFAULTS.object(forKey: LOGIN_USER_TOKEN)
//        authorizationKey = "Bearer \(userToken ?? "")"
//        authorizationValue = "Authorization"
        authHeader = ["Accept":"application/json","Content-Type":"application/json"]
//        let authHeader : HTTPHeaders = ["Content-Type":"application/json"]
        
        
        Alamofire.upload(multipartFormData: { (MultipartFormData) in
            
            for (key, value) in input {
                MultipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
                
            }
            if (fileData != nil){
                MultipartFormData.append(fileData, withName: fileKey, fileName: "image.jpg", mimeType: "image/jpeg")
            }
            
        }, to: url, method : .post, headers : authHeader) { (result) in
            
            switch result {
            case .success(let upload, _, _):
                
                upload.responseJSON { response in
                    let result = response.result.value
                    
                    if result == nil{
                        completion(nil ,NSError(domain: "Server error", code: 0, userInfo: [:]))
                    }
                    else{
                        let JSON = result as! NSDictionary
                        completion(JSON,nil);
                    }
                }
                
            case .failure(let encodingError):
                completion(nil ,encodingError as NSError?)
            }
        }
        
        
    }
    
    
    class func getRequest(input: NSDictionary,urlString: String, completion: @escaping (NSArray?, NSError?) -> Void) {
        
        let url = URL(string: urlString as String)!
    
        
        let header : HTTPHeaders = ["Content-Type":"application/json"]
        
        Alamofire.request(url, parameters: input as? Parameters, headers: header).responseJSON { response in
            
            
            //to get status code
            
            if(response.result.isSuccess){
                let result = response.result.value;
                
                if result == nil{
                    completion(nil ,NSError(domain: "Server error", code: 0, userInfo: [:]))
                }
                else{
                    
                    if let JSON = result as? NSArray {
                        completion(JSON,nil);
                    }else{
                        completion(nil ,NSError(domain: "Server error", code: 0, userInfo: [:]))
                    }
               
                    
                }
            }else{
                completion(nil ,response.result.error as NSError?);
            }
        }
    }
   
   
   
   //MARK:- test generic api call
   class func getRequestGeneric<T:EVObject>(input: NSDictionary,resultType :T.Type,urlString: String, completion: @escaping (NSDictionary?, NSError?) -> Void) {
       
       let url = URL(string: urlString as String)!
   
       
       let header : HTTPHeaders = ["Content-Type":"application/json"]
       
       Alamofire.request(url, parameters: input as? Parameters, headers: header).responseJSON { response in
           
           
           //to get status code
           
           if(response.result.isSuccess){
               let result = response.result.value;
               
               if result == nil{
                   completion(nil ,NSError(domain: "Server error", code: 0, userInfo: [:]))
               }
               else{
                   let JSON = result as! NSDictionary
                   completion(JSON,nil);
               }
           }else{
               completion(nil ,response.result.error as NSError?);
           }
       }
   }
   
   
    

    // MARK: - Download files Sync
    static func loadFileSync(url: URL, completion: @escaping (String?, Error?) -> Void)
       {
           let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

           let destinationUrl = documentsUrl.appendingPathComponent(url.lastPathComponent)

           if FileManager().fileExists(atPath: destinationUrl.path)
           {
               print("File already exists [\(destinationUrl.path)]")
               completion(destinationUrl.path, nil)
           }
           else if let dataFromURL = NSData(contentsOf: url)
           {
               if dataFromURL.write(to: destinationUrl, atomically: true)
               {
                   print("file saved [\(destinationUrl.path)]")
                   completion(destinationUrl.path, nil)
               }
               else
               {
                   print("error saving file")
                   let error = NSError(domain:"Error saving file", code:1001, userInfo:nil)
                   completion(destinationUrl.path, error)
               }
           }
           else
           {
               let error = NSError(domain:"Error downloading file", code:1002, userInfo:nil)
               completion(destinationUrl.path, error)
           }
       }
// MARK: - Download files Async
    
    static func loadFileAsync(url: URL, completion: @escaping (String?, Error?) -> Void)
    {
        let documentsUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let destinationUrl = documentsUrl.appendingPathComponent(url.lastPathComponent)
        print(destinationUrl.lastPathComponent)
        if FileManager().fileExists(atPath: destinationUrl.path)
        {
            print("File already exists [\(destinationUrl.path)]")
            completion(destinationUrl.path, nil)
        }
        else
        {
            let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: nil)
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            let task = session.dataTask(with: request, completionHandler:
            {
                data, response, error in
                if error == nil
                {
                    if let response = response as? HTTPURLResponse
                    {
                        if response.statusCode == 200
                        {
                            if let data = data
                            {
                                if let _ = try? data.write(to: destinationUrl, options: .completeFileProtection)
                                {
                                    completion(destinationUrl.path, error)
                                }
                                else
                                {
                                    completion(destinationUrl.path, error)
                                }
                            }
                            else
                            {
                                completion(destinationUrl.path, error)
                            }
                        }
                    }
                }
                else
                {
                    completion(destinationUrl.path, error)
                }
            })
            task.resume()
        }
    }
}
