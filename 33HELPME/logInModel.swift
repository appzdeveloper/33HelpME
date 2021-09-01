//
//  ImageModel.swift
//  Snaptiles
//
//  Created by Cgt_Jpr_Mac_BalkaranS on 7/4/19.
//  Copyright © 2019 Cgt_Jpr_Mac_BalkaranS. All rights reserved.
//

import UIKit
import Alamofire

class logInModel: NSObject {
    
    typealias CompletionHandler = (_ response: Bool, _ object: AnyObject) -> Void
    
    
  
    
    //MARK:  logIn Request
    
    class func logInInto(with param: Parameters,completionHandler: @escaping CompletionHandler)
    {
        // HUD.flash(.progress, delay: 0)
        
        ShowHUD()
        let url: URLConvertible = String(login)

        
        APIManager.sharedInstance.makePostRequestToServer(url, parameters: param, headerParam: nil)
        {
            (response) in
            
            print(response)
            switch response.result
            {
            case .success: // internet works
                
                
                let statusCode = (response.response?.statusCode)!
                // Check server status
                if statusCode == 200
                {
                    print(response)
                    _ = response.result.value as? NSDictionary
                    
                    
                    
                }
                completionHandler(response.result.isSuccess, response as AnyObject)
                
            case .failure:
                // internet fails
                if response.response?.statusCode == nil
                {
                    GlobelFunctions.showAlert(title: "Error", withMessage: serverError.errorMsgNoInternet)
                }
                else if response.response?.statusCode == 500
                {
                    GlobelFunctions.showAlert(title: "Error", withMessage: serverError.errorMsgGeneral)
                }
                else
                {
                    GlobelFunctions.showAlert(title: "Error", withMessage: serverError.errorMsgGeneral)
                }
                
            }
            RemoveHUD()
        }
    }
    
    
    //MARK:  SendAlert Request
    
    class func sendAlertRequest(completionHandler: @escaping CompletionHandler)
    {
        // HUD.flash(.progress, delay: 0)
        
     
        
        guard let id =   UserDefaults.standard.value(forKey: StaffId) as? Int64 else{
            return
        }
        
           ShowHUD()
        
        
        let lat = String(format: "%f",  UserLocation.sharedInstance.latitude)
                  let long = String(format: "%f",  UserLocation.sharedInstance.longitude)
                 
                 
                 
                 
        
        let urlString = String(SendAlerts) + "?staffid=\(id)" + "&staffLat=\(lat)" + "&staffLong=\(long)"
        
        
        if let encoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),let url = URL(string: encoded)
        {
           
            let param = [String: Any]()
                  APIManager.sharedInstance.makePostRequestToServer(url, parameters: param, headerParam: nil)
                  {
                      (response) in
                      
                      print(response)
                      switch response.result
                      {
                      case .success: // internet works
                          
                          
                          let statusCode = (response.response?.statusCode)!
                          // Check server status
                          if statusCode == 200
                          {
                              print(response)
                              _ = response.result.value as? NSDictionary
                              
                              
                              
                          }
                          completionHandler(response.result.isSuccess, response as AnyObject)
                          
                      case .failure:
                          // internet fails
                          if response.response?.statusCode == nil
                          {
                              GlobelFunctions.showAlert(title: "Error", withMessage: serverError.errorMsgNoInternet)
                          }
                          else if response.response?.statusCode == 500
                          {
                              GlobelFunctions.showAlert(title: "Error", withMessage: serverError.errorMsgGeneral)
                          }
                          else
                          {
                              GlobelFunctions.showAlert(title: "Error", withMessage: serverError.errorMsgGeneral)
                          }
                          
                      }
                      RemoveHUD()
                  }
            
        }

      
    }
    
   //MARK:  SaveLocation Request
    
    class func saveLocationRequest(urlStr :String,completionHandler: @escaping CompletionHandler)
    {
        // HUD.flash(.progress, delay: 0)
        
     
        
      
        
           ShowHUD()
      //  let url: URLConvertible = String(urlStr)
        
        
        if let encoded = urlStr.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),let url = URL(string: encoded)
                {
        
        
        
        let param = [String: Any]()
        APIManager.sharedInstance.makePostRequestToServer(url, parameters: param, headerParam: nil)
        {
            (response) in
            
            print(response)
            switch response.result
            {
            case .success: // internet works
                
                
                let statusCode = (response.response?.statusCode)!
                // Check server status
                if statusCode == 200
                {
                    print(response)
                    _ = response.result.value as? NSDictionary
                    
                    
                    
                }
                completionHandler(response.result.isSuccess, response as AnyObject)
                
            case .failure:
                // internet fails
                if response.response?.statusCode == nil
                {
                    GlobelFunctions.showAlert(title: "Error", withMessage: serverError.errorMsgNoInternet)
                }
                else if response.response?.statusCode == 500
                {
                    GlobelFunctions.showAlert(title: "Error", withMessage: serverError.errorMsgGeneral)
                }
                else
                {
                    GlobelFunctions.showAlert(title: "Error", withMessage: serverError.errorMsgGeneral)
                }
                
            }
            RemoveHUD()
        }
        }
    }
    
    

    
    //MARK:  SendAlert Request
      
      class func getPurPoseListRequest(completionHandler: @escaping CompletionHandler)
      {
          // HUD.flash(.progress, delay: 0)
          
       
          
          guard let id =   UserDefaults.standard.value(forKey: SchoolId) as? Int64 else{
              return
          }
          
             ShowHUD()
          
          
          let urlString = String(GetPurposes) + "?schoolid=\(id)"
            let headerparam = [String: Any]()
          
          if let encoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),let url = URL(string: encoded)
          {
             
              let param = [String: Any]()
            APIManager.sharedInstance.makeGetRequestToServer(url, parameters: param, headerParam: headerparam as! [String : String])
                    {
                        (response) in
                        
                        print(response)
                        switch response.result
                        {
                        case .success: // internet works
                            
                            
                            let statusCode = (response.response?.statusCode)!
                            // Check server status
                            if statusCode == 200
                            {
                                print(response)
                                _ = response.result.value as? NSDictionary
                                
                                
                                
                            }
                            completionHandler(response.result.isSuccess, response as AnyObject)
                            
                        case .failure:
                            // internet fails
                            if response.response?.statusCode == nil
                            {
                                GlobelFunctions.showAlert(title: "Error", withMessage: serverError.errorMsgNoInternet)
                            }
                            else if response.response?.statusCode == 500
                            {
                                GlobelFunctions.showAlert(title: "Error", withMessage: serverError.errorMsgGeneral)
                            }
                            else
                            {
                                GlobelFunctions.showAlert(title: "Error", withMessage: serverError.errorMsgGeneral)
                            }
                            
                        }
                        RemoveHUD()
                    }
              
          }

        
      }
    
    
    //MARK:  SaveLocation Request
    
    class func setPurposeRequest(urlStr :String,completionHandler: @escaping CompletionHandler)
    {
        // HUD.flash(.progress, delay: 0)
        
     
        
      
        
           ShowHUD()
      //  let url: URLConvertible = String(urlStr)
        
        
        if let encoded = urlStr.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),let url = URL(string: encoded)
                {
        
        
        
        let param = [String: Any]()
        APIManager.sharedInstance.makePostRequestToServer(url, parameters: param, headerParam: nil)
        {
            (response) in
            
            print(response)
            switch response.result
            {
            case .success: // internet works
                
                
                let statusCode = (response.response?.statusCode)!
                // Check server status
                if statusCode == 200
                {
                    print(response)
                    _ = response.result.value as? NSDictionary
                    
                    
                    
                }
                completionHandler(response.result.isSuccess, response as AnyObject)
                
            case .failure:
                // internet fails
                if response.response?.statusCode == nil
                {
                    GlobelFunctions.showAlert(title: "Error", withMessage: serverError.errorMsgNoInternet)
                }
                else if response.response?.statusCode == 500
                {
                    GlobelFunctions.showAlert(title: "Error", withMessage: serverError.errorMsgGeneral)
                }
                else
                {
                    GlobelFunctions.showAlert(title: "Error", withMessage: serverError.errorMsgGeneral)
                }
                
            }
            RemoveHUD()
        }
        }
    }
    
    
    
    //MARK:  DeleteLog Request
       
       class func DeleteLogRequest(urlStr :String,completionHandler: @escaping CompletionHandler)
       {
           // HUD.flash(.progress, delay: 0)
           
        
           
         
           
              ShowHUD()
         //  let url: URLConvertible = String(urlStr)
           
           
           if let encoded = urlStr.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),let url = URL(string: encoded)
                   {
           
           
           
           let param = [String: Any]()
           APIManager.sharedInstance.makePostRequestToServer(url, parameters: param, headerParam: nil)
           {
               (response) in
               
               print(response)
               switch response.result
               {
               case .success: // internet works
                   
                   
                   let statusCode = (response.response?.statusCode)!
                   // Check server status
                   if statusCode == 200
                   {
                       print(response)
                       _ = response.result.value as? NSDictionary
                       
                       
                       
                   }
                   completionHandler(response.result.isSuccess, response as AnyObject)
                   
               case .failure:
                   // internet fails
                   if response.response?.statusCode == nil
                   {
                       GlobelFunctions.showAlert(title: "Error", withMessage: serverError.errorMsgNoInternet)
                   }
                   else if response.response?.statusCode == 500
                   {
                       GlobelFunctions.showAlert(title: "Error", withMessage: serverError.errorMsgGeneral)
                   }
                   else
                   {
                       GlobelFunctions.showAlert(title: "Error", withMessage: serverError.errorMsgGeneral)
                   }
                   
               }
               RemoveHUD()
           }
           }
       }
    
}
