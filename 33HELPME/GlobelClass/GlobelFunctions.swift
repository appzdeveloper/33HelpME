//
//  GlobelFunctions.swift
//  Yiu Pai
//
//  Created by conference on 03/05/17.
//  Copyright © 2017 cgtechnosoft. All rights reserved.
//

import UIKit
import SystemConfiguration



class GlobelFunctions: NSObject {
    
    static var  rootDir : String? = nil
    static var  cropDir : String? = nil
     //MARK: Convert Hex Color Code To UIColor
    class func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

    
    
      class func getViewWithWithoutCornerRadius(myObj:AnyObject, color:UIColor?) -> AnyObject
      {
        
           if #available(iOS 13.0, *) {
                 
                        //myObj.layer.cornerRadius = 8.0
                        myObj.layer.masksToBounds = true
                              
                              if (color != nil) {
                                  myObj.layer.borderColor = color?.cgColor
                                  myObj.layer.borderWidth = 0.5
                              }
                    } else {
                        // Fallback on earlier versions
                        if  let view = myObj as? UIView{
                            //view.layer.cornerRadius = 8.0
                                    view.layer.masksToBounds = true
            
                                    if (color != nil) {
                                        view.layer.borderColor = color?.cgColor
                                       view.layer.borderWidth = 0.5
                                    }
                            return view
                               }
                        if  let btn = myObj as? UIButton{
                                      // btn.layer.cornerRadius = 8.0
                                               btn.layer.masksToBounds = true
            
                                            if (color != nil) {
                                                   btn.layer.borderColor = color?.cgColor
                                                btn.layer.borderWidth = 0.5
                                               }
                            return btn
                                           }
                        if  let textView = myObj as? UITextView{
                                               //  textView.layer.cornerRadius = 8.0
                                                          textView.layer.masksToBounds = true
            
                                                          if (color != nil) {
                                                              textView.layer.borderColor = color?.cgColor
                                                              textView.layer.borderWidth = 0.5
                                                          }
                            return textView
                                                      }
                                   }
                        
                        
                    return myObj
          
          return myObj
      }
    
    class func getViewWithCornerRadius(myObj:AnyObject, color:UIColor?) -> AnyObject
    {
      
         if #available(iOS 13.0, *) {
               
                      myObj.layer.cornerRadius = 4.0
                      myObj.layer.masksToBounds = true
                            
                            if (color != nil) {
                                myObj.layer.borderColor = color?.cgColor
                                myObj.layer.borderWidth = 0.5
                            }
                  } else {
                      // Fallback on earlier versions
                      if  let view = myObj as? UIView{
                          view.layer.cornerRadius = 4.0
                                  view.layer.masksToBounds = true
          
                                  if (color != nil) {
                                      view.layer.borderColor = color?.cgColor
                                     view.layer.borderWidth = 0.5
                                  }
                          return view
                             }
                      if  let btn = myObj as? UIButton{
                                     btn.layer.cornerRadius = 4.0
                                             btn.layer.masksToBounds = true
          
                                          if (color != nil) {
                                                 btn.layer.borderColor = color?.cgColor
                                              btn.layer.borderWidth = 0.5
                                             }
                          return btn
                                         }
                      if  let textView = myObj as? UITextView{
                                               textView.layer.cornerRadius = 4.0
                                                        textView.layer.masksToBounds = true
          
                                                        if (color != nil) {
                                                            textView.layer.borderColor = color?.cgColor
                                                            textView.layer.borderWidth = 0.5
                                                        }
                          return textView
                                                    }
                                 }
                      
                      
                  return myObj
        
        return myObj
    }
    
    
    class func cornerRadius(myObj:AnyObject, color:UIColor? , conerValue:CGFloat , borderValue:CGFloat) -> AnyObject
      {
        
           if #available(iOS 13.0, *) {
                 
                        myObj.layer.cornerRadius = conerValue
                        myObj.layer.masksToBounds = true
                              
                              if (color != nil) {
                                  myObj.layer.borderColor = color?.cgColor
                                  myObj.layer.borderWidth = borderValue
                              }
                    } else {
                        // Fallback on earlier versions
                        if  let view = myObj as? UIView{
                            view.layer.cornerRadius = conerValue
                                    view.layer.masksToBounds = true
            
                                    if (color != nil) {
                                        view.layer.borderColor = color?.cgColor
                                       view.layer.borderWidth = borderValue
                                    }
                            return view
                               }
                        if  let btn = myObj as? UIButton{
                                       btn.layer.cornerRadius = conerValue
                                               btn.layer.masksToBounds = true
            
                                            if (color != nil) {
                                                   btn.layer.borderColor = color?.cgColor
                                                btn.layer.borderWidth = borderValue
                                               }
                            return btn
                                           }
                        if  let textView = myObj as? UITextView{
                                                 textView.layer.cornerRadius = conerValue
                                                          textView.layer.masksToBounds = true
            
                                                          if (color != nil) {
                                                              textView.layer.borderColor = color?.cgColor
                                                              textView.layer.borderWidth = borderValue
                                                          }
                            return textView
                                                      }
                                   }
                        
                        
                    return myObj
          
          return myObj
      }
    
    
    class func getViewWithCornerRadiusWithmorRound(myObj:AnyObject, color:UIColor?) -> AnyObject
      {
           if #available(iOS 13.0, *) {
                        myObj.layer.cornerRadius = 8.0
                        myObj.layer.masksToBounds = true
                              
                              if (color != nil) {
                                  myObj.layer.borderColor = color?.cgColor
                                  myObj.layer.borderWidth = 0.5
                              }
                    } else {
                        // Fallback on earlier versions
                        if  let view = myObj as? UIView{
                            view.layer.cornerRadius = 8.0
                                    view.layer.masksToBounds = true
            
                                    if (color != nil) {
                                        view.layer.borderColor = color?.cgColor
                                       view.layer.borderWidth = 0.5
                                    }
                            return view
                               }
                        if  let btn = myObj as? UIButton{
                                       btn.layer.cornerRadius = 8.0
                                               btn.layer.masksToBounds = true
            
                                            if (color != nil) {
                                                   btn.layer.borderColor = color?.cgColor
                                                btn.layer.borderWidth = 0.5
                                               }
                            return btn
                                           }
                        if  let textView = myObj as? UITextView{
                                                 textView.layer.cornerRadius = 8.0
                                                          textView.layer.masksToBounds = true
            
                                                          if (color != nil) {
                                                              textView.layer.borderColor = color?.cgColor
                                                              textView.layer.borderWidth = 0.5
                                                          }
                            return textView
                                                      }
                                   }
                        
                        
                    return myObj
          
          return myObj
      }
    
    static func isValidEmail(testStr:String) -> Bool {
        
        print("validate emilId: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
        return result
        
    }
    
      static func isValidEmailORUserName(testStr:String) -> Bool {
          
          print("validate emilId: \(testStr)")
          let emailRegEx =  "/^(?:[A-Z\\d][A-Z\\d_-]{2,10}|[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4})$"
          let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
          let result = emailTest.evaluate(with: testStr)
          return result
          
      }
    
    class func isPasswordValid(_ password : String) -> Bool{
          let laxString: String = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=!.])(?=\\S+$).{8,}$"
          //        let laxString: String = "^(?=.*[0-9])(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"
          let passwordRegex = laxString
          
          let passwordTest: NSPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
          return passwordTest.evaluate(with: password)
      }
    

    class func checkUserNameValid(testStr:String) -> Bool{
        
        let emailRegEx =  "^[A-Za-z][a-zA-Z0-9]{2,30}$"
                 let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
                 let result = emailTest.evaluate(with: testStr)
                 return result
    }

    // Mark : Make BarButton Whithe Color
    class func makeButtonWithWhiteColorImageForNAVBAR(imageName:String,x:Int,y:Int,width:Int,height:Int,selectorString:Selector,onVC: Any) -> UIBarButtonItem {
        let button = UIButton.init(type: .custom)
        //let image = UIImage(named:imageName)?.withRenderingMode(.automatic)
        // button.setImage(image, for: UIControlState.normal)
        
        let origImage = UIImage(named: imageName)
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        button.tintColor = UIColor.white
        button.showsTouchWhenHighlighted = true
        
        //button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 8, 2);
        button.addTarget(onVC, action:Selector("\(selectorString)"), for: UIControl.Event.touchUpInside)
        button.frame = CGRect.init(x: x, y: y, width: width, height: height) //CGRectMake(0, 0, 30, 30)
        let widthConstraint = button.widthAnchor.constraint(equalToConstant: CGFloat(width))
        let heightConstraint = button.heightAnchor.constraint(equalToConstant: CGFloat(height))
        heightConstraint.isActive = true
        widthConstraint.isActive = true
        
        let barButton = UIBarButtonItem.init(customView: button)
        return barButton
    }
    
    
    class func createBarButtonItemViewWith(title:String,  imageName : String , selector:Selector,frame:CGRect, onVC: Any)->UIView{
        
        
        let containView = UIView()
        
        if title == ""{
            containView.frame = CGRect(x: 0, y: 0, width: 80, height: 50)
        }
        else
        {
            containView.frame = CGRect(x: 0, y: 0, width: 180, height: 50)
        }
        
        let label = UILabel(frame:frame)
        label.text = title
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = NSTextAlignment.center
        label.textColor = UIColor.white
        
        containView.addSubview(label)
        
        let imageView = UIImageView()
        //        frame: CGRect(x: 0, y: 0, width: 17, height: 17)
        imageView.image = UIImage(named: imageName)
        // imageView.backgroundColor = UIColor.yellow
  
        let leftBarBtn = UIButton(type: .custom)
        // leftBarBtn.setImage(UIImage(named: imageName), for: .normal)
        leftBarBtn.frame = CGRect(x: 0, y: 0, width: 80, height: 50)
        leftBarBtn.addTarget(onVC, action:Selector("\(selector)"), for: UIControl.Event.touchUpInside)
        
       // leftBarBtn.backgroundColor = UIColor.green
        
        containView.addSubview(imageView)
        containView.addSubview(leftBarBtn)
        imageView.frame = CGRect(x: 0, y: 14, width: 10, height: 17)

       
        return containView;

    }
    
    class func setArrowImageInTextField(_ textField:UITextField)
    {

      
        let leftView2 = UIView.init(frame: CGRect(x: 10, y: 0, width:50, height: 50))
       // leftView2.backgroundColor = UIColor.green
        textField.rightView = leftView2;
        textField.rightViewMode = UITextField.ViewMode.always
    }
    //MARK: Convert json string to Dict
    static func convertToDictionary(text: String) -> Dictionary<String,Any>? {
        
        let data = text.data(using: .utf8)!
        do {
            if let jsonDict = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? Dictionary<String,Any>
            {
                print(jsonDict) // use the json here
                
                if(jsonDict["status"] as! Int == 0)
                {
                   
                    if(jsonDict["code"] as! Int == 400 || jsonDict["code"] as! Int == 205){
                       //GlobelFunctions.logout()
                    }
                    
                     GlobelFunctions.showAlert(title: jsonDict["message"]  as! String, withMessage:"" )
                    
                }
                else
                {
                    return jsonDict
                }
 
            } else {
                print("bad json")
                return nil
            }
        } catch let error as NSError {
            print(error)
        }
        
        return nil
        
    }
    
    //MARK: Set Value in Defaults
//    static func setAccessToken(token:String)
//    {
//        UserDefaults.standard.setValue(token, forKey: "accessToken")
//    }
//    static func getAccessToken() -> String
//    {
//        return UserDefaults.standard.string(forKey: "accessToken") ?? ""
//    }
    
   
    
//    class func clearUserDefaultsValues(){
//
//
//
//        let defaultsDict = UserDefaults.standard.dictionaryRepresentation()
//
//        for keyName in defaultsDict.keys {
//
////            if(keyName == orderId || keyName == removeImgsId ){
////
////            }else{
//                 UserDefaults.standard.removeObject(forKey:keyName)
//            //}
//
//        }
//
//        UserDefaults.standard.synchronize()
//    }
    
    class func getDateFormStirng(strDate:String)->String{

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"                 // Note: S is fractional second
        let dateFromString = dateFormatter.date(from: strDate)      // "Nov 25, 2015, 4:31 AM" as NSDate
        
         let suff = GlobelFunctions.daySuffix(from: dateFromString!)
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = String(format: "dd'%@' MMM, yyyy",suff )
        
        let stringFromDate = dateFormatter2.string(from: dateFromString!)
        return stringFromDate
    }
    
    class func getTimeStirng(strDate:String)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        
        let date = dateFormatter.date(from: strDate)
        dateFormatter.dateFormat = "h:mm a"
         return dateFormatter.string(from: date!)
    }
    
    class func daySuffix(from date: Date) -> String {
        let calendar = Calendar.current
        let dayOfMonth = calendar.component(.day, from: date)
        switch dayOfMonth {
        case 1, 21, 31: return "st"
        case 2, 22: return "nd"
        case 3, 23: return "rd"
        default: return "th"
        }
    }
    
    
    class func showAlert(title:String, withMessage:String) -> Void
    {
        let alert = UIAlertController(title: title, message: withMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ok".uppercased(), style: UIAlertAction.Style.default, handler: nil))
        
        if let topController = UIApplication.topViewController()
        {
            if !(topController is UIAlertController) {
                
                topController.present(alert, animated: true, completion: nil)
            }
            
            
        }
    }
    
    class func checkObjectIsBlankOrNot(ob:Any?) ->Bool
    {
        print(ob ?? String())
        
        if ob as? Int == 0{
            return false
        }
        else if ob as? String == "" {
            return false
        }
        else if ob == nil
        {
            return false
        }
        else if ob as? String == "<null>"
        {
            return false
        }
        else if ob as? String ==  nil
        {
            return false
        }
        
        return true
    }
    
    class func isConnectedToInternet() -> Bool {
      
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        return (isReachable && !needsConnection)
        
    }
    
    class func validatePhone(value: String) -> Bool {
        let phoneRegex = "^([+]?)[0-9]{1,4}?\\s[0-9]{7,10}$";
        let valid = NSPredicate(format: "SELF MATCHES %@", phoneRegex).evaluate(with: value)
        return valid
    }
    
  
    
    class func showAlertOnWindow(msg:String){
        
        let alertController = UIAlertController(title: "", message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            UIAlertAction in
            NSLog("OK Pressed")
        }
       
        alertController.addAction(okAction)
      
           let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        window?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
     class func isPhoneXandXSDevice() -> Bool {
        return UIScreen.main.bounds.height / UIScreen.main.bounds.width >= 896.0 / 414.0
    }

    class func createAudioDir(){
        rootDir = GlobelFunctions.createImagesFolder()
       
    }
    
    class func createImagesFolder()-> String {
        // path to documents directory
        let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        if let documentDirectoryPath = documentDirectoryPath {
            // create the custom folder path
            let imagesDirectoryPath = documentDirectoryPath.appending("/audio")
            let fileManager = FileManager.default
            if !fileManager.fileExists(atPath: imagesDirectoryPath) {
                do {
                    try fileManager.createDirectory(atPath: imagesDirectoryPath,
                                                    withIntermediateDirectories: false,
                                                    attributes: nil)
                } catch {
                    print("Error creating images folder in documents dir: \(error)")
                }
            }
            
            return imagesDirectoryPath
        }
        
        return "" 
    }
    
    class func createCropImagesFolder()-> String {
        // path to documents directory
        let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        if let documentDirectoryPath = documentDirectoryPath {
            // create the custom folder path
            let imagesDirectoryPath = documentDirectoryPath.appending("/Crop")
            let fileManager = FileManager.default
            if !fileManager.fileExists(atPath: imagesDirectoryPath) {
                do {
                    try fileManager.createDirectory(atPath: imagesDirectoryPath,
                                                    withIntermediateDirectories: false,
                                                    attributes: nil)
                } catch {
                    print("Error creating images folder in documents dir: \(error)")
                }
            }
            
            return imagesDirectoryPath
        }
        
        return ""
    }
    
    
    
    class func getAudioRoot()->String{
       return rootDir!
    }
    
    class func getCropImagesFolder()->String{
        return cropDir!
    }
    
    class  func saveAudioIntoDocumetDirectory(audioName:String , audioData : Data? ){
    
        var nameAudio = ""
        
        if audioName.contains(".mp3") {
           nameAudio = audioName
        }else{
            nameAudio = audioName + ".mp3"
        }
        
        
    // get the documents directory url
        let documentsDirectory = GlobelFunctions.getAudioRoot()
    // choose a name for your image
   
    // create the destination file url to save your image
    let fileURL = URL(fileURLWithPath: documentsDirectory).appendingPathComponent(nameAudio) //documentsDirectory.appendingPathComponent(fileName)
    // get your UIImage jpeg data representation and check if the destination file url already exists
    if let data = audioData,
    !FileManager.default.fileExists(atPath: fileURL.absoluteString) {
    do {
    // writes the image data to disk
    try data.write(to: fileURL)
    print("file saved")
    } catch {
    print("error saving file:", error)
    }
    }
    }
    
    class  func saveImageIntoCropFolder(imageName:String , image : UIImage ){
        
        // get the documents directory url
        let documentsDirectory = GlobelFunctions.getCropImagesFolder()
        // choose a name for your image
        
        // create the destination file url to save your image
        let fileURL = URL(fileURLWithPath: documentsDirectory).appendingPathComponent(imageName) //documentsDirectory.appendingPathComponent(fileName)
        // get your UIImage jpeg data representation and check if the destination file url already exists
        
        
        
        if var data = image.jpegData(compressionQuality:  1.0){
            
            let bytes = data.count
            let kB = Double(bytes) / 1000.0
            
            if(kB > 25000){
                data  = image.jpegData(compressionQuality:  0.01)!
            }
            else if(kB > 12000){
                data  = image.jpegData(compressionQuality:  0.10)!
            }
            else if(kB > 3000){
                data  = image.jpegData(compressionQuality:  0.70)!
            }
            
            if   !FileManager.default.fileExists(atPath: fileURL.absoluteString) {
                do {
                    // writes the image data to disk
                    try data.write(to: fileURL)
                    print("file saved")
                } catch {
                    print("error saving file:", error)
                }
            }
            else{
                
                do {
                    try FileManager.default.removeItem(atPath: fileURL.absoluteString)
                    print("Local path removed successfully")
                    
                    if let data = image.jpegData(compressionQuality:  1.0),
                        !FileManager.default.fileExists(atPath: fileURL.absoluteString) {
                        do {
                            // writes the image data to disk
                            try data.write(to: fileURL)
                            print("file saved")
                        } catch {
                            print("error saving file:", error)
                        }
                    }
                    
                    
                    
                } catch let error as NSError {
                    print("------Error",error.debugDescription)
                }
                
            }
            
        }
        
       
        
        
    }
    
    class  func deleteAllAudioForDocumetDirectory(imageName:String){
        
        // get the documents directory url
        let documentsDirectory = GlobelFunctions.getAudioRoot()
       
        let filemanager = FileManager.default
       
        let fileURL = documentsDirectory + "/" + imageName
        let destinationPath = fileURL
        do {
            try filemanager.removeItem(atPath: destinationPath)
            print("Local path removed successfully")
        } catch let error as NSError {
            print("------Error",error.debugDescription)
        }
        
    }
    
    
    class  func deleteImageFromCropImagesFolder(imageName:String){
        
        // get the documents directory url
        let documentsDirectory = GlobelFunctions.getCropImagesFolder()
        
        let filemanager = FileManager.default
        
        let fileURL = documentsDirectory + "/" + imageName
        let destinationPath = fileURL
        do {
            try filemanager.removeItem(atPath: destinationPath)
            print("Local path removed successfully")
        } catch let error as NSError {
            print("------Error",error.debugDescription)
        }
        
    }
    
    class  func getImageFromCropImagesFolder(imageName:String)->UIImage?{
        
        // get the documents directory url
        let documentsDirectory = GlobelFunctions.getCropImagesFolder()
        
    
        let fileURL = documentsDirectory + "/" + imageName
        let destinationPath = fileURL
        
        let image  = UIImage(contentsOfFile: destinationPath)
        
        
        return image
      
        
    }
    
    class  func getCropImagesPath(imageName:String)->String{
        
        // get the documents directory url
        let documentsDirectory = GlobelFunctions.getCropImagesFolder()
        
        
        let fileURL = documentsDirectory + "/" + imageName
        return fileURL
        
      
        
        
    }
    
    
    class  func getAudioFromDocumetDirectory(imageName:String)->Data?{
        
        // get the documents directory url
        
        var nameAudio = ""
               
               if imageName.contains(".mp3") {
                  nameAudio = imageName
               }else{
                   nameAudio = imageName + ".mp3"
               }
        
        let documentsDirectory = GlobelFunctions.getAudioRoot()
        
        
        let fileURL = documentsDirectory + "/" + nameAudio
        let destinationPath = fileURL
        
      
        
        let data = FileManager.default.contents(atPath: destinationPath)
        
      
        
        
        return data
        
        
    }
    
    
    class  func getAudioUrlWith(imageName:String)->String?{
          
          // get the documents directory url
          let documentsDirectory = GlobelFunctions.getAudioRoot()
          
          
          let fileURL = documentsDirectory + "/" + imageName
          let destinationPath = fileURL
          
        
          
          
          
        
          
          
          return destinationPath
          
          
      }
    
    
    
    
    class  func isKeyPresentInUserDefaults(key: String) -> Bool {
        
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
    class func clearUserDefaultsValuesOnSelfLogout(){
        
        
        let defaultsDict = UserDefaults.standard.dictionaryRepresentation()
        
        for keyName in defaultsDict.keys {

            if( keyName == pushToken){
                
            }
            else{
                  UserDefaults.standard.removeObject(forKey:keyName)
            }
      

        }
        UserDefaults.standard.synchronize()
    }
    
    
  
    
    class func SaveUserData(userData:[String:Any]?){
        
        if  let email = userData?["AlertMessage"] as? String{
                UserDefaults.standard.setValue(email, forKey: AlertMessage)
        }
              
        if  let id = userData?["SchoolId"] as? Int64{
                      UserDefaults.standard.setValue(id, forKey: SchoolId)
              }
        if  let id = userData?["EmployeeId"] as? Int64{
                           UserDefaults.standard.setValue(id, forKey: EmployeeId)
                   }
       
        if  let email = userData?["Location"] as? String{
                UserDefaults.standard.setValue(email, forKey: Location)
        }
        
        if  let email = userData?["Name"] as? String{
                       UserDefaults.standard.setValue(email, forKey: Name)
               }
        
        
        if  let id = userData?["SchoolCode"] as? Int64{
                                  UserDefaults.standard.setValue(id, forKey: SchoolCode)
                          }
        
        if  let id = userData?["SchoolId"] as? Int64{
                                       UserDefaults.standard.setValue(id, forKey: SchoolId)
                               }
        
        if  let email = userData?["SchoolName"] as? String{
                              UserDefaults.standard.setValue(email, forKey: SchoolName)
                      }
        
        if  let id = userData?["StaffId"] as? Int64{
                                             UserDefaults.standard.setValue(id, forKey: StaffId)
                                     }

        UserDefaults.standard.synchronize()
    }
    
    class  func decodeJwtToken(_ token: String) -> [String: AnyObject]? {
        let string = token.components(separatedBy: ".")
        let toDecode = string[1] as String


        var stringtoDecode: String = toDecode.replacingOccurrences(of: "-", with: "+") // 62nd char of encoding
        stringtoDecode = stringtoDecode.replacingOccurrences(of: "_", with: "/") // 63rd char of encoding
        switch (stringtoDecode.utf16.count % 4) {
        case 2: stringtoDecode = "\(stringtoDecode)=="
        case 3: stringtoDecode = "\(stringtoDecode)="
        default: // nothing to do stringtoDecode can stay the same
            print("")
        }
        let dataToDecode = Data(base64Encoded: stringtoDecode, options: [])
        let base64DecodedString = NSString(data: dataToDecode!, encoding: String.Encoding.utf8.rawValue)

        var values: [String: AnyObject]?
        if let string = base64DecodedString {
            if let data = string.data(using: String.Encoding.utf8.rawValue, allowLossyConversion: true) {
                values = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String : AnyObject]
            }
        }
        return values
    }
    
    class func SaveAddressData(userData:[String:Any]?){
        
        
        if(userData?["address_1"] as? String != nil){
            UserDefaults.standard.setValue(userData?["address_1"] as? String, forKey: "address_1")
        }
        
        if(userData?["city"] as? String != nil){
            UserDefaults.standard.setValue(userData?["city"] as? String, forKey: "city")
        }
        
        if(userData?["country_id"] as? String != nil){
            UserDefaults.standard.setValue(userData?["country_id"] as? String, forKey: "country_id")
        }
        
        if(userData?["postcode"] as? String != nil){
            
            UserDefaults.standard.setValue(userData?["postcode"] as? String, forKey: "postcode")
        }
        
        if(userData?["state"] as? String != nil){
            
            UserDefaults.standard.setValue(userData?["state"] as? String, forKey: "state")
        }
        
      
        
        
    }
    class func getAddress()->String{
        
        return GlobelFunctions.getValueFromKey(key: "address_1") + ", " +  GlobelFunctions.getValueFromKey(key: "city") + ", " + GlobelFunctions.getValueFromKey(key: "state") + " " + GlobelFunctions.getValueFromKey(key: "postcode") + ", USA"
    }
    
    class func getTintedImage(imageName:String) -> UIImage {
        let origImage = UIImage(named: imageName)
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        return tintedImage!
    }
    
    class func getValueFromKey(key:String)->String{
        
        return UserDefaults.standard.string(forKey: key) ?? ""
    }
    
   class func cropToBounds(image: UIImage, width: Double, height: Double) -> UIImage {
        
        let cgimage = image.cgImage!
        let contextImage: UIImage = UIImage(cgImage: cgimage)
        let contextSize: CGSize = contextImage.size
        var posX: CGFloat = 0.0
        var posY: CGFloat = 0.0
        var cgwidth: CGFloat = CGFloat(width)
        var cgheight: CGFloat = CGFloat(height)
        
        // See what size is longer and create the center off of that
        if contextSize.width > contextSize.height {
            posX = ((contextSize.width - contextSize.height) / 2)
            posY = 0
            cgwidth = contextSize.height
            cgheight = contextSize.height
        } else {
            posX = 0
            posY = ((contextSize.height - contextSize.width) / 2)
            cgwidth = contextSize.width
            cgheight = contextSize.width
        }
        
        let rect: CGRect = CGRect(x: posX, y: posY, width: cgwidth, height: cgheight)
        
        // Create bitmap image from context using the rect
        let imageRef: CGImage = cgimage.cropping(to: rect)!
        
        // Create a new image based on the imageRef and rotate back to the original orientation
        let image: UIImage = UIImage(cgImage: imageRef, scale: image.scale, orientation: image.imageOrientation)
    
    
    
    
        return image
    }
    
    class func goTOHome(){
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        // let homeVC = mainStoryBoard.instantiateViewController(withIdentifier: "HomeVC") as! HomeViewController
        let homeNavController:UINavigationController = mainStoryBoard.instantiateViewController(withIdentifier: "NavLogin") as! UINavigationController
        
          let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
          window?.rootViewController = homeNavController
          window?.makeKeyAndVisible()
    }
    
 
    class func setHomeVC(){
        
       
        GlobelFunctions.clearUserDefaultsValuesOnSelfLogout()
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        // let homeVC = mainStoryBoard.instantiateViewController(withIdentifier: "HomeVC") as! HomeViewController
        let homeNavController:UINavigationController = mainStoryBoard.instantiateViewController(withIdentifier: "LanguageNav") as! UINavigationController
        
          let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
          window?.rootViewController = homeNavController
          GlobelFunctions.clearAllFileFromDocumentDirectory()
    }
    
  
    
    class func setHomeVCAfterEndSession(){
           
           
         //  GlobelFunctions.clearUserDefaultsValuesOnSelfLogout()
           let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
           // let homeVC = mainStoryBoard.instantiateViewController(withIdentifier: "HomeVC") as! HomeViewController
           let homeNavController:UINavigationController = mainStoryBoard.instantiateViewController(withIdentifier: "LanguageNav") as! UINavigationController
           
             let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
             window?.rootViewController = homeNavController
       }
       
    
    
    
    class  func convertIntoJSONString(arrayObject: [[String : Any]]) -> NSString? {
        
        do {
            let jsonData: Data = try JSONSerialization.data(withJSONObject: arrayObject, options: [])
            if  let jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue) {
                return jsonString 
            }
            
        } catch let error as NSError {
            print("Array convertIntoJSON - \(error.description)")
        }
        
        
        
        
        return nil
    }
    
    class func getImageSizeInKb(image:UIImage) -> Double{
        
        if let imageData = image.pngData() {
            let bytes = imageData.count
            let kB = Double(bytes) / 1000.0 // Note the difference
            let KB = Double(bytes) / 1024.0 // Note the difference
            
            return kB
        }
        return 0.0
    }
    
 
    
    class func clearAllFileFromDocumentDirectory() {

        let documentsDirectory = GlobelFunctions.getAudioRoot()

        let filemanager = FileManager.default

        let fileURL = documentsDirectory
        let destinationPath = fileURL
        do {
            try filemanager.removeItem(atPath: destinationPath)
            print("Local path removed successfully")
        } catch let error as NSError {
            print("------Error",error.debugDescription)
        }

//        let documentsDirectory2 = GlobelFunctions.getCropImagesFolder()
//
//        let filemanager2 = FileManager.default
//
//        let fileURL2 = documentsDirectory2
//        let destinationPath2 = fileURL2
//        do {
//            try filemanager2.removeItem(atPath: destinationPath2)
//            print("Local path removed successfully")
//        } catch let error as NSError {
//            print("------Error",error.debugDescription)
//        }

        // UserDefaults.standard.removeObject(forKey:couponText)
       //  UserDefaults.standard.removeObject(forKey:orderId)
       //  UserDefaults.standard.removeObject(forKey:removeImgsId)
       

//        for i in 0...CoreDataSinglton.sharedManager.persistentContainer.managedObjectModel.entities.count-1 {
//            let entity = CoreDataSinglton.sharedManager.persistentContainer.managedObjectModel.entities[i]
//
//            do {
//
//                let query = NSFetchRequest<NSFetchRequestResult>(entityName: entity.name!)
//                let deleterequest = NSBatchDeleteRequest(fetchRequest: query)
//                try CoreDataSinglton.sharedManager.persistentContainer.viewContext.execute(deleterequest)
//                try CoreDataSinglton.sharedManager.persistentContainer.viewContext.save()
//
//            } catch let error as NSError {
//                print("Error: \(error.localizedDescription)")
//                abort()
//            }
//        }


    }
    
    
    
    
}
