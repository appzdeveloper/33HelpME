//
//  LoginViewController.swift
//  33HELPME
//

//  Copyright © 2020 33HELPME. All rights reserved.
//

import UIKit
import SwiftyDrop
import Alamofire


class LoginViewController: BaseViewController {
    
    @IBOutlet weak var textfUserName: FCBaseTextField!
    @IBOutlet weak var textfPwd: FCBaseTextField!
    @IBOutlet weak var viewUser: UIView!
    @IBOutlet weak var viewPwd: UIView!
    @IBOutlet weak var lbtRights: FCBaseLabel!
    @IBOutlet weak var textview : UITextView!
    
    
    var userInfo : [String:Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textview.delegate = self
        textview.isEditable = false
        textview.isUserInteractionEnabled = true
        
        textview.addHyperLinksToText(originalText: "Privacy Policy", hyperLinks: [ "Privacy Policy": "someUrl2"])
        
        
        viewUser = GlobelFunctions.cornerRadius(myObj: viewUser, color: .lightGray, conerValue: 0.0, borderValue: 0.5) as? UIView
        
        viewPwd = GlobelFunctions.cornerRadius(myObj: viewPwd, color: .lightGray, conerValue: 0.0, borderValue: 0.5) as? UIView
        // Do any additional setup after loading the view.
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        let dateStr = formatter.string(from: NSDate() as Date)
        print(dateStr)
        
        lbtRights.text = String(format: "© 2019 - %@ 33 SYSTEMS INC. - All rights reserved.", dateStr)
        
        
        if GlobelFunctions.isKeyPresentInUserDefaults(key: StaffId) {
                 let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                   let vc:HomeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                                  self.navigationController?.pushViewController(vc, animated: false)
                  
                  
              }
        //self.logOut()
    }
    
    func logOut(){
                 
                  if(GlobelFunctions.isConnectedToInternet()){
                      
                      guard let id =   UserDefaults.standard.value(forKey: StaffId) as? Int64 else{
                                            return
                                        }
                                  
                                
                                  
                                  let url  =   String(DeleteLog) + "?staffid=\(id)"
                                             
                                  logInModel.DeleteLogRequest(urlStr: url){ (response, data) in
                                     
                                     if response == true {
                                         
                                         let value = data as! DataResponse<Any>
                                          let data = value.result.value as? [String:Any]
                                       
                                       
                                         if  (data?["Code"] as? Int64 == 200){
                                             
                                             
                                             
                                            // if  let data =  value.result.value as? [[String:Any]]{
                                                 // self.arrayPurpose = data
                                           //  }
                                          
                                           GlobelFunctions.clearUserDefaultsValuesOnSelfLogout()
                                           
                                           
                                           GlobelFunctions.goTOHome()
                                          // self.navigationController?.popBack(toControllerType: LoginViewController.self)
                                          // print(self.arrayPurpose)
                                           
                                             
                                         }
                                         else{
                                           //  self.showAlert(title: "", message: "Invalid Credentials!" )
                                             
                                         }
                                         //   GlobelFunctions.SaveUserData(userData: signUpData)
                                       //  self.tblParpose.reloadData()
                                     }
                                     
                                 }
                                 
                                 
                             } else{
                                 
                                 DispatchQueue.main.async {
                                     Drop.down(NoInternetMsg, state:.color( UIColor.getNavigationBarColor()))
                                 }
                             }
                 
                 
             }
    
    // MARK: - IBActions
    
    @IBAction func BtnLoginDidClilcked(){
        
        if self.validate(){
            
            if(GlobelFunctions.isConnectedToInternet()){
                
                
                logInModel.logInInto(with: userInfo) { (response, data) in
                    
                    if response == true {
                        
                        let value = data as! DataResponse<Any>
                        if  ((value.result.value as? NSDictionary) != nil){
                            
                            
                            
                            let signUpData =  value.result.value as? NSDictionary
                            
                            print(signUpData)
                            
                            let dateString = signUpData?["ExpirationDate"] as! String
                            
                            let formatter = DateFormatter()
                            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
                            formatter.locale = Locale.current
                            let date = formatter.date(from: dateString)
                            
                            
                            
                            if signUpData?["IsAllowedForButton"] as? Int == 0{
                                
                                self.showAlert(title: "", message: "You are not authorized to use this app! Please contact your school admin." )
                                return
                                }
                            else  if signUpData?["LogInStatus"] as? String != nil && signUpData?["LogInStatus"] as? String != "" {

                                self.showAlert(title: "", message: "You are already logged in some other system, please logout from there and try to login again!" )
                                return

                            }
                                else if (date?.timeIntervalSince1970 ?? 0.0) <= Date().timeIntervalSince1970{
                                
                                self.showAlert(title: "", message: "Your district has been expired!" )
                                return
                            }
                            
                            UserDefaults.standard.setValue(self.textfUserName.text, forKey: Email)
                            GlobelFunctions.SaveUserData(userData: signUpData as! [String : Any])
                            
                            let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                                            let vc:HomeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                                                           self.navigationController?.pushViewController(vc, animated: true)
                            
                        }
                        else{
                            self.showAlert(title: "", message: "Invalid Credentials!" )
                            
                        }
                        //   GlobelFunctions.SaveUserData(userData: signUpData)
                        
                        
                        
                        
                    }
                    
                }
                
                
            } else{
                
                DispatchQueue.main.async {
                    Drop.down(NoInternetMsg, state:.color( UIColor.getNavigationBarColor()))
                }
            }
            
        }
        
    }
    
    @IBAction func btnEyesDidClicked(){
        
        if(textfPwd.isSecureTextEntry){
            textfPwd.isSecureTextEntry = false
        }else{
            textfPwd.isSecureTextEntry = true
        }
        
    }
    
    
    
    
    
    
    
    func validate() -> Bool {
        
        textfUserName.text = textfUserName.text?.trimmingCharacters(in: .whitespaces)
        
        if textfUserName.text?.trimmingCharacters(in: .whitespaces) == "" {
            textfUserName.becomeFirstResponder()
            self.showAlert(title: "", message: enter_email_UserName  as NSString)
            return false
        }else if textfPwd.text! == "" {
            textfPwd.becomeFirstResponder()
            self.showAlert(title: "", message: enter_psw  as NSString )
            return false
        }
        userInfo["Email"] = textfUserName.text
        userInfo["Password"] = textfPwd.text
        
        return true
    }
    
}
extension LoginViewController : UITextViewDelegate{
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool{
        print(URL)
        
       
            
            let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                              let vc:LoadWebViewViewController = storyboard.instantiateViewController(withIdentifier: "LoadWebViewViewController") as! LoadWebViewViewController
        if(URL.absoluteString == "someUrl2"){
             vc.viewtitle = "Terms & Conditions"
        }
         
         
                                              self.present(vc, animated: false, completion: nil)
        
        return false
    }
    
}
extension UITextView {

  func addHyperLinksToText(originalText: String, hyperLinks: [String: String]) {
    let style = NSMutableParagraphStyle()
    style.alignment = .center
    let attributedOriginalText = NSMutableAttributedString(string: originalText)
    attributedOriginalText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black , range: attributedOriginalText.mutableString.range(of: originalText))
     attributedOriginalText.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 14.0, weight: UIFont.Weight.regular), range: attributedOriginalText.mutableString.range(of: originalText))
    for (hyperLink, urlString) in hyperLinks {
        let linkRange = attributedOriginalText.mutableString.localizedStandardRange(of: hyperLink)
        let fullRange = NSRange(location: 0, length: attributedOriginalText.length)
        attributedOriginalText.addAttribute(NSAttributedString.Key.link, value: urlString, range: linkRange)
        attributedOriginalText.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: fullRange)
       
       
        
        attributedOriginalText.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 14.0, weight: UIFont.Weight.regular), range: linkRange)
      

    }

    self.linkTextAttributes = [
        NSAttributedString.Key.foregroundColor: UIColor.black,
        NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
    ]
    self.attributedText = attributedOriginalText
  }
}
