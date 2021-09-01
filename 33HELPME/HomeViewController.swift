//
//  HomeViewController.swift
//  33HELPME
//

//  Copyright © 2020 33HELPME. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyDrop
import SideMenu

class HomeViewController: BaseViewController {
    
   
    
    @IBOutlet weak var lblPurpouse: FCBaseLabel!
    @IBOutlet weak var lblTitle: FCBaseLabel!
    @IBOutlet weak var txtFeildLocation: FCBaseTextField!
    @IBOutlet weak var btnSave: FCBaseButton!
    @IBOutlet weak var viewLocation: UIView!
    
 
    @IBOutlet weak var lblAlertleft : FCBaseLabel!
    @IBOutlet weak var imageLeftAlert: UIImageView!
    
    
    
    @IBOutlet weak var viewBottom: UIView!
    @IBOutlet weak var lblcallRight: FCBaseLabel!
    @IBOutlet weak var imageRightCall: UIImageView!
    
    var currentPos = "Center"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    
       // let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
       // let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        
       // leftSwipe.direction = .left
        //rightSwipe.direction = .right
        
       
        
        imageLeftAlert.isUserInteractionEnabled = true
       let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleAlertTab))
        doubleTapGesture.numberOfTapsRequired = 2
        imageLeftAlert.addGestureRecognizer(doubleTapGesture)
        
         imageRightCall.isUserInteractionEnabled = true
        let doubleTapGesture2 = UITapGestureRecognizer(target: self, action: #selector(handleCallTab))
              doubleTapGesture2.numberOfTapsRequired = 2
              imageRightCall.addGestureRecognizer(doubleTapGesture2)
        
        
        viewLocation = GlobelFunctions.cornerRadius(myObj: viewLocation, color: .lightGray, conerValue: 0.0, borderValue: 0.5) as? UIView
             
        
        txtFeildLocation.delegateText = self
        
        self.setData()
        self.setupSideMenu()
        
     // self.roundCorners(view: viewBottom, corners: [.topLeft, .topRight], radius: 12.0)
        
        
    }
    
  
    @objc func handleAlertTab(_ sender:UITapGestureRecognizer){
        print("alert")
        imageLeftAlert.image = UIImage(named: "alert_active_button")
        self.sendAlert()
    }
    
    @objc func handleCallTab(_ sender:UITapGestureRecognizer){
           print("call")
          imageRightCall.image = UIImage(named: "call_active_button")
         if let phoneCallURL = URL(string: "tel://\(911)") {
                                let application:UIApplication = UIApplication.shared
                                if (application.canOpenURL(phoneCallURL)) {
                                 application.open(phoneCallURL, options: [:], completionHandler: nil)
         
                                }
                            }
       }

    
    func roundCorners(view :UIView, corners: UIRectCorner, radius: CGFloat){
            let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            view.layer.mask = mask
    }
 
     

    func setData(){
        btnSave.isHidden = true
        txtFeildLocation.tag = 1001
        lblPurpouse.isHidden = false
        lblPurpouse.text = UserDefaults.standard.value(forKey: AlertMessage) as? String
        txtFeildLocation.text =  UserDefaults.standard.value(forKey: Location) as? String
        lblPurpouse.text = UserDefaults.standard.value(forKey: AlertMessage) as? String
        lblTitle.text = UserDefaults.standard.value(forKey: SchoolName) as? String
       
        imageRightCall.isHidden = false
                      lblcallRight.isHidden = false
                  
        
        imageLeftAlert.isHidden = false
        lblAlertleft.isHidden = false
         imageLeftAlert.image = UIImage(named: "alert_button-1")
         imageRightCall.image = UIImage(named: "call_button")
     
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
     
        self.view.layoutIfNeeded()
        
        
        NotificationCenter.default.addObserver(self,
                                                        selector: #selector(applicationDidBecomeActive),
                                                        name: UIApplication.didBecomeActiveNotification,
                                                        object: nil)
        
        viewBottom.layer.cornerRadius = 30
        viewBottom.layer.masksToBounds = true
        viewBottom.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
     
              viewBottom.layer.masksToBounds = true
              self.viewBottom.layer.masksToBounds = false
              self.viewBottom.layer.shadowRadius = 10
              self.viewBottom.layer.shadowOpacity = 0.2
              self.viewBottom.layer.shadowColor = UIColor.black.cgColor
              self.viewBottom.layer.shadowOffset = CGSize(width: 0 , height:4)
          UserLocation.sharedInstance.startUpdateLocation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
         NotificationCenter.default.removeObserver(self, name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    
    
    @objc fileprivate func applicationDidBecomeActive() {
        self.setData()
          UserLocation.sharedInstance.startUpdateLocation()
         }
     
    
    func setupSideMenu() {
        // Define the menus
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let leftMenuViewController:SideMenuController = storyboard.instantiateViewController(withIdentifier:"Sidemenu") as! SideMenuController
        //    leftMenuViewController.userProfileDelegate = self
        let menuLeftNavigationController = SideMenuNavigationController(rootViewController:leftMenuViewController )
        menuLeftNavigationController.menuWidth = view.frame.width * 0.80
        menuLeftNavigationController.enableSwipeToDismissGesture = false
        menuLeftNavigationController.isNavigationBarHidden = true
        //menuLeftNavigationController.leftSide = true
        menuLeftNavigationController.presentationStyle = .menuSlideIn
        menuLeftNavigationController.statusBarEndAlpha = 0
        menuLeftNavigationController.presentationStyle.onTopShadowOpacity = 0.5
        menuLeftNavigationController.presentationStyle.presentingEndAlpha = 0.5
        
        //menuLeftNavigationController.prefersStatusBarHidden = false
        // menuLeftNavigationController.blurEffectStyle = .dark
        
        SideMenuManager.default.leftMenuNavigationController = menuLeftNavigationController
        //  SideMenuManager.default.menuEnableSwipeGestures = false
        //  SideMenuManager.default.menuPresentMode = .menuSlideIn
        //  SideMenuManager.default.menuWidth = view.frame.width * 0.85
        //  SideMenuManager.default.menuFadeStatusBar = false
        
        
    }
    
   @objc func toggleImage(_ sender: UILongPressGestureRecognizer){
        if sender.state == .began{
           // imageLeft.shake()
            //imageRight.shake()
        }else if sender.state == .ended{
            //imageLeft.layer.removeAllAnimations()
            //imageRight.layer.removeAllAnimations()
           }
    }
    
//    @objc func handleSwipes(_ sender:UISwipeGestureRecognizer)
//    {
//
//        if (sender.direction == .left)
//        {
//            print("Swipe Left")
//
//            if(currentPos == "Center"){
//
//                currentPos = "Left"
//              //  imageCenterConst.constant = -(viewSwipe.frame.size.width/2 - imageAlert.frame.size.width/2 - 15)
//               // imageLeft.isHidden = true
//                lblAlertleft.isHidden = true
//                imageLeftAlert.isHidden = true
//
//                self.sendAlert()
//
//            }else if(currentPos == "Right"){
//                currentPos = "Center"
//            //    imageCenterConst.constant = 0
//                self.setData()
//            }
//
//            // show the view from the right side
//        }
//
//        if (sender.direction == .right)
//        {
//            print("Swipe Right")
//
//            if(currentPos == "Center"){
//
//                currentPos = "Right"
//                imageCenterConst.constant = (viewSwipe.frame.size.width/2 - imageAlert.frame.size.width/2 - 15)
//
//                imageRightCall.isHidden = true
//                lblcallRight.isHidden = true
//                imageRight.isHidden = true
//
////                if let url = URL(string: "telprompt:\(911)") {
////                    if UIApplication.shared.canOpenURL(url) {
////                        UIApplication.shared.openURL(url)
////                    }
////                }
//
//
//                if let phoneCallURL = URL(string: "tel://\(911)") {
//                       let application:UIApplication = UIApplication.shared
//                       if (application.canOpenURL(phoneCallURL)) {
//                        application.open(phoneCallURL, options: [:], completionHandler: nil)
//
//                       }
//                   }
//
//            }else if(currentPos == "Left"){
//                currentPos = "Center"
//                imageCenterConst.constant = 0
//                 self.setData()
//            }
//
//            // show the view from the left side
//        }
//    }
    
    
    func sendAlert(){
        
        if(GlobelFunctions.isConnectedToInternet()){
            
            
            logInModel.sendAlertRequest { (response, data) in
                
                if response == true {
                    
                    let value = data as! DataResponse<Any>
                    let data = value.result.value as? [String:Any]
                    
                    
                    if  (data?["Code"] as? Int64 == 200){
                        
                        
                        
                     //   let signUpData =  value.result.value as? NSDictionary
                        
                        
                        self.showAlert(title: "", message: data?["Message"] as? String as! NSString )
                       
                        
                    }else if  (data?["Code"] as? Int64 == 205){
                                           
                                           
                                           
                                        //   let signUpData =  value.result.value as? NSDictionary
                                           
                                           
                                           self.showAlert(title: "Call 911", message: data?["Message"] as? String as! NSString )
                                          
                                           
                    }
                    else{
                        self.showAlert(title: "", message: data?["Message"] as? String as! NSString )
                        
                    }
                    
                      self.setData()
                    //   GlobelFunctions.SaveUserData(userData: signUpData)
                    
                }
                
            }
            
            
        } else{
            
            DispatchQueue.main.async {
                Drop.down(NoInternetMsg, state:.color( UIColor.getNavigationBarColor()))
            }
        }
        
        
    }
    
    
    
    func saveLocation(){
        
        if(GlobelFunctions.isConnectedToInternet()){
            
            guard let id =   UserDefaults.standard.value(forKey: StaffId) as? Int64 else{
                return
            }
            
            guard let location = txtFeildLocation.text else {
                return
            }
            
            
            let url  =   String(Setlocation) + "?staffid=\(id)" + "&location=\(location)"
            
            logInModel.saveLocationRequest(urlStr: url) { (response, data) in
                
                if response == true {
                    
                    let value = data as! DataResponse<Any>
                    if  ((value.result.value as? NSDictionary) != nil){
                        
                        
                        
                        UserDefaults.standard.setValue(self.txtFeildLocation.text, forKey: Location)
                        self.setData()
                        self.btnSave.isHidden = true
                        self.txtFeildLocation.resignFirstResponder()
                        
                        
                        
                    }
                    else{
                        //  self.showAlert(title: "", message: "Invalid Credentials!" )
                        
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
    
    
    // MARK: - IBActions
    
    @IBAction func openSideMenu()
    {
        //print(UIApplication.topViewController())
        
        if let vc = SideMenuManager.default.leftMenuNavigationController{
            print(vc)
            
            self.present(vc, animated: true, completion: nil)
        }else{
            self.setupSideMenu()
        }
    }
    
    @IBAction func btnSaveLocationDidClicke(){
        
        self.saveLocation()
        
        
    }
    
    @IBAction func btnSetPurposeDidClicked(){
        
        
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc:SelectPurpose = storyboard.instantiateViewController(withIdentifier: "SelectPurpose") as! SelectPurpose
        vc.delegate = self
        self.present(vc, animated: false, completion: nil)
        
    }
    
    
    
    @IBAction func btnAboutDidClicked(){
        
        
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc:AboutViewController = storyboard.instantiateViewController(withIdentifier: "AboutViewController") as! AboutViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
extension HomeViewController : SelectPurposeDelegate{
    func userSelectPurpose(data: [String : Any]) {
        lblPurpouse.isHidden = false
        lblPurpouse.text =  data["PurposeName"] as? String
        UserDefaults.standard.setValue(data["PurposeName"] as? String, forKey: AlertMessage)
    }
    
    
}
extension HomeViewController : FCBaseTextFieldDelegate{
    func endEdeting() {
        btnSave.isHidden = true
        setData()
    }
    
    func userCurrentString(str: String) {
        if(str.count > 0){
            btnSave.isHidden = false
        }else{
            btnSave.isHidden = true
        }
    }
    
    
}

extension UIImageView {
    func shake(){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.20
        animation.repeatCount = MAXFLOAT
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }
}
