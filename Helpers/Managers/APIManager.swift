//
//  APIManager.swift
//  ManagersDemo
//
//  Created by iOS Developer on 27/02/18.
//  Copyright © 2018 MobileCoderz. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class APIManager: NSObject {
    
    
    class func getHeader() -> HTTPHeaders{
        let user = ""
        let password = ""
        let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers: HTTPHeaders = [
             "Authorization": "Basic"+" "+"\(base64Credentials)",
             "api_key":""
        ]
        return headers
    }
    

    class  func postService(url: String, params: [String:Any]?, success successBlock: @escaping ((_ json:JSON?) -> ()), failure failureBlock:@escaping ((_ error:Error?) -> ())) {
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: APIManager.getHeader()).responseJSON { (response) in
            switch response.result {
            case .success(_):
                if let data = response.result.value {
                    let json = JSON(data)
                    successBlock(json)
                }
            case .failure(_):
                failureBlock(response.result.error!)
            }
        }
    }
    
    
    class  func postServiceWithJSONEncoding(url: String, params: [String:Any]?, success successBlock: @escaping ((_ json:JSON?) -> ()), failure failureBlock:@escaping ((_ error:Error?) -> ())) {
        Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: APIManager.getHeader()).responseJSON { (response) in
            switch response.result {
            case .success(_):
                if let data = response.result.value {
                    let json = JSON(data)
                    successBlock(json)
                }
            case .failure(_):
                failureBlock(response.result.error!)
            }
        }
    }
    
    
    
    
    class func uploadImageWithMultipartRequest(serviceURL: String, andParams params: [String:String], andImage images:[UIImage], success successBlock: @escaping ((_ json:JSON) -> ()), failure failureBlock:@escaping ((_ error:Error) -> ())) {
        

        
        Alamofire.upload(multipartFormData: { (fromData:MultipartFormData) in
            
            for (key, value) in params {
                fromData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
            }
            
            for image in images{
                
               fromData.append(UIImagePNGRepresentation(image)!, withName: "Photo", fileName: "photo.jpg", mimeType: "image/jpeg")
            }
            
            
            
          //  multipartFormData.append(image, withName: "image", fileName: "image.png", mimeType: "image/png")
            
        }, usingThreshold:UInt64.init(), to: serviceURL, method: .post, headers: APIManager.getHeader()) { (responseJson:SessionManager.MultipartFormDataEncodingResult) in
            
            switch responseJson {
            case .success(let upload, _, _):
                
                upload.responseJSON { response in
                    
                    print(response.result.value!)
                    
                    let data = JSON(response.result.value!)
                    successBlock(data)
                }
                
            case .failure(let encodingError):
                
                print(encodingError)
                
                failureBlock(encodingError)
                
                break
                
            }
        }
    }
    
}
    

