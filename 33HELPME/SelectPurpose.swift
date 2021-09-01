//
//  GOTSelectAudioViewController.swift
//  GOT
//
//  Created by Cgt_Jpr_Mac_BalkaranS on 4/15/20.
//  Copyright © 2020 Cgt_Jpr_Mac_BalkaranS. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyDrop

protocol  SelectPurposeDelegate{
    func userSelectPurpose(data:[String:Any])
}

class SelectPurpose: BaseViewController {

  
    var delegate : SelectPurposeDelegate?
    var arrayPurpose : [[String:Any]]?
    @IBOutlet var tblParpose : UITableView!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("data")
         self.getPurpose()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func getPurpose(){
            
             if(GlobelFunctions.isConnectedToInternet()){
                 
               
                 
            
                            
                 logInModel.getPurPoseListRequest() { (response, data) in
                                
                                if response == true {
                                    
                                    let value = data as! DataResponse<Any>
                                    if  ((value.result.value as? [[String:Any]]) != nil){
                                        
                                        
                                        
                                        if  let data =  value.result.value as? [[String:Any]]{
                                             self.arrayPurpose = data
                                        }
                                     
                                        
                                      print(self.arrayPurpose)
                                      
                                        
                                    }
                                    else{
                                      //  self.showAlert(title: "", message: "Invalid Credentials!" )
                                        
                                    }
                                    //   GlobelFunctions.SaveUserData(userData: signUpData)
                                    self.tblParpose.reloadData()
                                }
                                
                            }
                            
                            
                        } else{
                            
                            DispatchQueue.main.async {
                                Drop.down(NoInternetMsg, state:.color( UIColor.getNavigationBarColor()))
                            }
                        }
            
            
        }
    
    
   
   
    

}
extension SelectPurpose : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayPurpose?.count ?? 0
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 65
//    }
//    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AudiosCell", for: indexPath) as UITableViewCell
        
        let lbl = cell.contentView.viewWithTag(2) as? FCBaseLabel
          // let imageCheck = cell.contentView.viewWithTag(20) as? UIImageView
       
     //   var viewBack = cell.contentView.viewWithTag(1) as! UIView
        
      //  viewBack = GlobelFunctions.cornerRadius(myObj: viewBack, color:nil , conerValue: 20, borderValue: 0.0) as! UIView
        if  let data = self.arrayPurpose?[indexPath.row]{
           // GOTCurrentSessionData.shared.SelectAudioData = data
            lbl?.text = data["PurposeName"] as? String
            
            
            
        }
        
 
       

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  
       // if  let data = self.arrayPurpose?[indexPath.row]{

       // tableView.deselectRow(at: indexPath, animated: false)
          //    delegate?.userSelectAuio(data: data)
       // self.dismiss(animated: true, completion: nil)
          //  }
        self.setPurbose(indexPath: indexPath)
    }
    
    func setPurbose(indexPath: IndexPath){
          
      guard  let dataParpuse = self.arrayPurpose?[indexPath.row]else{
        return
        }
        
        
             if(GlobelFunctions.isConnectedToInternet()){
                 
                 guard let id =   UserDefaults.standard.value(forKey: StaffId) as? Int64 else{
                           return
                       }
                 
                 guard let parid = dataParpuse["ID"] as? Int64 else {
                     return
                 }
                 
                 let url  =   String(SetPurpose) + "?staffid=\(id)" + "&purposeid=\(parid)"
                            
                 logInModel.saveLocationRequest(urlStr: url) { (response, data) in
                                
                                if response == true {
                                    
                                    let value = data as! DataResponse<Any>
                                    if  ((value.result.value as? NSDictionary) != nil){
                                        
                                        
                                        self.delegate?.userSelectPurpose(data: dataParpuse as! [String : Any])
                                     //   let signUpData =  value.result.value as? NSDictionary
                                        
                                      self.dismiss(animated: true, completion: nil)
                                        
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
    
}
