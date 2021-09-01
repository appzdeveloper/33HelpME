//
//  NetworkLayer.swift
//  AlcoholDeliveryNow
//
//  Created by Duke on 4/18/17.
//  Copyright © 2017 Duke. All rights reserved.
//

import Foundation
import Alamofire

public enum HTTPMethod : String {
    case GET
    case POST
    case PUT
    case DELETE
}

class NetworkLayer: NSObject ,URLSessionDelegate {
    
    typealias CompletionHandler = (_ response: DataResponse<Any>) -> Void
    
    static let sharedInstance = NetworkLayer()
    var session:URLSessionConfiguration?
    
    var manager: SessionManager {
        let manager = Alamofire.SessionManager.default
       // manager.session.configuration.timeoutIntervalForRequest = 60
        return manager
    }
    
    //This prevents others from using the default '()' initializer for this class.
    fileprivate override init() {
        super.init()
        self.setupNetworkSession()
    }
    
    func setupNetworkSession() {
            let sessionConfiguration:URLSessionConfiguration = URLSessionConfiguration.default
            sessionConfiguration.timeoutIntervalForRequest = 30.0
            sessionConfiguration.timeoutIntervalForResource = 30.0
            sessionConfiguration.httpMaximumConnectionsPerHost = 1;
            sessionConfiguration.allowsCellularAccess = true
    }
    
    func performRequestWithURL(_ URLString: URLConvertible, method: HTTPMethod, headers: [String : String]?, parameters: [String: Any]?, completionHandler: @escaping CompletionHandler) {
        
//        debugPrint("URL: \(URLString)")
//        debugPrint("Parameters: \(parameters)")
//        debugPrint("Headers: \(headers)")
//        let configuration = URLSessionConfiguration.default
//        configuration.urlCache = nil
        
       
       // JSONEncoding.default
   print(AFManager.session.configuration.timeoutIntervalForRequest)
        if method == .POST
        {
            AFManager.request(URLString, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON
                { response in
                    completionHandler(response)
            }
            
//            AFManager.request(URLString, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseString
//                { response in
//                    print(response)
//            }
        }
        else if method == .GET
        {
            AFManager.request(URLString, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON
                { response in
                    completionHandler(response)
            }
            
//            AFManager.request(URLString, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseString
//                { response in
//                  print(response)
//            }
        }else   if method == .PUT
                {
                    AFManager.request(URLString, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON
                        { response in
                            completionHandler(response)
                    }
                    
        //            AFManager.request(URLString, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseString
        //                { response in
        //                    print(response)
        //            }
                }
    }
    
    
    func sendImageToServerWithURL(_ URLString: URLConvertible, method: HTTPMethod, headers: [String : String]?, parameters: [String: Any]?, imageData : Data?,imageName:String,completionHandler: @escaping CompletionHandler) {
          Alamofire.SessionManager.default.session.configuration.timeoutIntervalForRequest = 60
        
        AFManager.upload(multipartFormData: { (multipartFormData) in
            
            if((imageData) != nil)
            {
                 multipartFormData.append(imageData!, withName:imageName, fileName: "swift_file.png", mimeType: "image/png")
            }
   
            for (key, value) in parameters!
            {
                multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
            }
        }, to:URLString ,headers : headers)
        { (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.uploadProgress(closure: { (progress) in
                    //Print progress
                })
                
                upload.responseJSON { response in
                    print (response.result)
                   
                    completionHandler(response)
                }
                
              
                
            case .failure( _): break
                //print encodingError.description
            }
        }
    }
    
    
    func sendAudioServerWithURL(_ URLString: URLConvertible, method: HTTPMethod, headers: [String : String]?, parameters: [String: Any]?, imageData : Data?,imageName:String,completionHandler: @escaping CompletionHandler) {
            Alamofire.SessionManager.default.session.configuration.timeoutIntervalForRequest = 60
          
          AFManager.upload(multipartFormData: { (multipartFormData) in
              
              if((imageData) != nil)
              {
                   multipartFormData.append(imageData!, withName:"audio_file", fileName: imageName, mimeType: "audio/mpeg")
                
                //multipartFormData.append(imageData!, withName: imageName)
              }
     
              for (key, value) in parameters!
              {
                  multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
              }
          }, to:URLString ,headers : headers)
          { (result) in
              switch result {
              case .success(let upload, _, _):
                  
                  upload.uploadProgress(closure: { (progress) in
                      //Print progress
                  })
                  
                  upload.responseJSON { response in
                      print (response.result)
                     
                      completionHandler(response)
                  }
                  
                
                  
              case .failure( _): break
                  //print encodingError.description
              }
          }
      }
    
    
//    func sendMultipleImageToServerWithURL(_ URLString: URLConvertible, method: HTTPMethod, headers: [String : String]?, parameters: [[String: Any]]?, imageData : [[String: Any]],imageKey:String,completionHandler: @escaping CompletionHandler) {
//        
//        Alamofire.upload(multipartFormData: { (multipartFormData) in
//            
//            if imageData.count > 0{
//                
//                for i in 0...imageData.count - 1
//                {
//                    let imageUplodedData =  imageData[i]["image"]! as! Data
//                    
//                    if(!(imageUplodedData.isEmpty))
//                    {
//                        multipartFormData.append(imageUplodedData, withName:imageKey , fileName: imageData[i]["name"]! as! String, mimeType: "image/jpeg")
//                    }
//                    
//                    
//                }
//            }
//            
//            
//            
//            let strJason = GlobelFunctions.convertIntoJSONString(arrayObject: parameters! )
//           
//            let str = strJason?.replacingOccurrences(of: "'\'", with: "")
//            print(str ?? "")
//            
//            multipartFormData.append((str as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: "detail")
//           
//            if(GlobelFunctions.isKeyPresentInUserDefaults(key: orderId)){
//              
//                if let str =   UserDefaults.standard.value(forKey: orderId) as? Int{
//                      multipartFormData.append(("\(str)" as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: "order_id")
//                }
//   
//                
//            }
//            
//            
//            if(GlobelFunctions.isKeyPresentInUserDefaults(key: removeImgsId)){
//                
//                let str =   UserDefaults.standard.value(forKey: removeImgsId) as! String
//                
//                
//                multipartFormData.append((str as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: removeImgsId)
//            }
//            
////            if let param = parameters?.count{
////                for i in 0...param - 1{
////
////                    let data = parameters?[i]
////
////                    for (key, value) in data!
////                    {
////                        multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
////                    }
////
////
////
////                }
////                multipartFormData.app
////            }
//            
//            
//            
////            for (key, value) in parameters!
////            {
////                multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
////            }
//        }, to:URLString ,headers : headers)
//        { (result) in
//            switch result {
//            case .success(let upload,_,_):
//                
//                upload.uploadProgress(closure: { (progress) in
//                    //Print progress
//                })
//                
////                upload.responseString(completionHandler: { (data) in
////                    print(data)
////                })
//                
//                upload.responseJSON { response in
//                    print (response.result)
//                    completionHandler(response)
//                }
//                
//            case .failure( _):
//                RemoveHUD()
//              //  showAlertWithTitle(title: "", strMessage: serverError.errorMsgGeneral)
//                break
//                //print encodingError.description
//            }
//        }
//    }
}
