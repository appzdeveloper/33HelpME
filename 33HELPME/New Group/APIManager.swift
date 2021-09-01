//
//  APIManager.swift
//  AlcoholDeliveryNow
//
//  Created by Duke on 4/18/17.
//  Copyright © 2017 Duke. All rights reserved.
//

import Foundation
import Alamofire

enum ADNError: Error
{
    case apiError
    case internetConnectivityError
    case serverDownError
    case unknownError
    case noError
    case logout
}

class APIManager: NSObject {
    
    typealias CompletionHandler = (_ response: DataResponse <Any>) -> Void
    
    class var sharedInstance : APIManager {
        struct Static {
            static let instance : APIManager = APIManager()
            
        }
        return Static.instance
    }
    
    //This prevents others from using the default '()' initializer for this class.
    fileprivate override init() {}
    
    fileprivate func isServerDown(_ statusCode: Int) -> ADNError {
        if statusCode == 200 {
            return .noError
        } else {
            return .serverDownError
        }
    }
    
    fileprivate func validateAPIResponse(_ response: (DataResponse<Any>)) -> ADNError {
        // Check Internet connectivity
        print("Status Code : \(response.response?.statusCode) API Value : \(response.result.value) \n")
        
        print(response)
        switch response.result
        {
        case .success: // internet works
            let statusCode = (response.response?.statusCode)!
            // Check server status
            if statusCode == 200
            {
                return .noError
            }
            else if statusCode == 422 || statusCode == 403 || statusCode == 404
            {
                return .apiError
            }
            else
            {
                return .unknownError
            }
        case .failure: // internet fails
            if response.response?.statusCode == nil
            {
                return .internetConnectivityError
            }
            else if response.response?.statusCode == 500
            {
                return .unknownError
            }
            else
            {
                return .unknownError
            }
        }
    }
    
    func makePostRequestToServer (_ apiURL: URLConvertible, parameters : [String: Any],headerParam: [String: String]?,completionHandler: @escaping CompletionHandler)
    {
        NetworkLayer.sharedInstance.performRequestWithURL(apiURL, method: HTTPMethod.POST, headers: headerParam, parameters: parameters) {
                (response) in
            
                completionHandler(response)
        }
    }
    
    func makeGetRequestToServer (_ apiURL: URLConvertible, parameters : [String: Any],headerParam: [String: String],completionHandler: @escaping CompletionHandler)
    {
        NetworkLayer.sharedInstance.performRequestWithURL(apiURL, method: HTTPMethod.GET, headers: headerParam, parameters: parameters) {
            (response) in
            
            
                completionHandler(response)

        }
    }
    
    
    func makePostRequestToServerWithUrlEncoding (_ apiURL: URLConvertible, parameters : [String: Any],headerParam: [String: String]?,completionHandler: @escaping CompletionHandler)
     {
         NetworkLayer.sharedInstance.performRequestWithURL(apiURL, method: HTTPMethod.PUT, headers: headerParam, parameters: parameters) {
                 (response) in
             
                 completionHandler(response)
         }
     }
    
    
    func makeImageUploadRequestToServer (_ apiURL: URLConvertible, parameters : [String: Any],headerParam: [String: String],imageData : Data?, imageName:String, completionHandler: @escaping CompletionHandler)
    {
        NetworkLayer.sharedInstance.sendImageToServerWithURL(apiURL, method: HTTPMethod.POST, headers: headerParam, parameters: parameters,imageData: imageData,imageName: imageName) {
            (response) in
            
            
            completionHandler(response)
            
        }
    }
    
    
    func makeAudioRequestToServer (_ apiURL: URLConvertible, parameters : [String: Any],headerParam: [String: String],imageData : Data?, imageName:String, completionHandler: @escaping CompletionHandler)
       {
           NetworkLayer.sharedInstance.sendAudioServerWithURL(apiURL, method: HTTPMethod.POST, headers: headerParam, parameters: parameters,imageData: imageData,imageName: imageName) {
               (response) in
               
               
               completionHandler(response)
               
           }
       }
    
    
//    func SendMultipalImageToServer (_ apiURL: URLConvertible, parameters : [[String: Any]]?,headerParam: [String: String],imageData : [[String: Any]], imageName:String, completionHandler: @escaping CompletionHandler)
//    {
////        NetworkLayer.sharedInstance.sendImageToServerWithURL(apiURL, method: HTTPMethod.POST, headers: headerParam, parameters: parameters,imageData: imageData,imageName: imageName) {
////            (response) in
////
////
////            completionHandler(response)
////
////        }
//        
//        NetworkLayer.sharedInstance.sendMultipleImageToServerWithURL(apiURL, method: HTTPMethod.POST, headers: headerParam, parameters: parameters, imageData: imageData, imageKey: imageName)  {
//                        (response) in
//            
//            
//                       completionHandler(response)
//            
//                    }
//    }
    
    
}
