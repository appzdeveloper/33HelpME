//
//  SideMenuController.swift
//  AlcoholDeliveryNow
//
//  Created by Duke on 4/20/17.
//  Copyright © 2017 Duke. All rights reserved.
//

import UIKit
import SwiftyDrop
import Alamofire

protocol SideMenuUserProfileDelegate: NSObjectProtocol {
    func userProfileRequestAction(_ string:String)
}


class SideMenuController: BaseViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    @IBOutlet weak var tblMenu :UITableView!
    @IBOutlet weak var imgUser :UIImageView!
    @IBOutlet weak var lblUserName :FCBaseLabel!
    @IBOutlet weak var lblEmail :FCBaseLabel!
    @IBOutlet weak var lblPhone :FCBaseLabel!
 
    
    var userProfileDelegate: SideMenuUserProfileDelegate?
    
    var menuArray:NSArray!
    
    
    
    @IBAction func btnCrossDidClicked () {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        menuArray = ["About","Logout"]
        lblUserName.text = UserDefaults.standard.value(forKey: Name) as? String
        lblEmail.text = UserDefaults.standard.value(forKey: Email) as? String
        
    //    tblMenu.backgroundColor = UIColor.getGreenMenuColor()
      //  let v = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 10))
       // v.backgroundColor =  UIColor.getGreenMenuColor()
     //   tblMenu.tableHeaderView = v
       
       
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        tblMenu.reloadData()
        
        
        self.view.layoutIfNeeded()
       //  imgUser = GlobelFunctions.cornerRadius(myObj: imgUser, color: UIColor.getButtonBakgroundYellow(), conerValue: imgUser.frame.height/2, borderValue: 8) as! UIImageView
        
//        if let strImage = UserDefaults.standard.value(forKey: USERD_Photo) as? String{
//             imgUser.kf.setImage(with:URL(string: strImage ) )
//        }
//
//
//        if let userName = UserDefaults.standard.value(forKey: USERD_UserName) as? String{
//            lblUserName.text = userName
//        }
//
//        if let userEmail = UserDefaults.standard.value(forKey: USERD_Email) as? String{
//            lblEmail.text = userEmail
//        }
//
//        if let userEmail = UserDefaults.standard.value(forKey: USERD_Mobile) as? String{
//                   lblPhone.text = userEmail
//               }
        
        
        
    }
    
    //    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.menuArray.count
        
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
//        return 56
//    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let menuCell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath)
        
        let lblMenu = menuCell.contentView.viewWithTag(2) as! UILabel
     //   let imageMenu = menuCell.contentView.viewWithTag(1) as! UIImageView
        
        
        lblMenu.text = self.menuArray[indexPath.row] as? String
      //  imageMenu.image = UIImage(named: self.menuArray[indexPath.row] as? String ?? "")
        

        
        return menuCell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = menuArray[indexPath.row] as? String
        if(data == "Logout"){
            self.logOut()
        }else if (data == "About"){
            let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                                        let vc:AboutViewController = storyboard.instantiateViewController(withIdentifier: "AboutViewController") as! AboutViewController
                                                       self.navigationController?.pushViewController(vc, animated: true)
        }
       
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
    
    
}
