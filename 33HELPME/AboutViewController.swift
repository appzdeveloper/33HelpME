//
//  AboutViewController.swift
//  33HELPME
//
//  Created by Cgt_Jpr_Mac_BalkaranS on 5/9/20.
//  Copyright © 2020 33HELPME. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet var lblVersion : FCBaseLabel!
     @IBOutlet weak var lbtRights: FCBaseLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if  let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String{
                  lblVersion.text = String(format: "Version %@", appVersion )
        }
        
 
        // Do any additional setup after loading the view.
        
        let formatter = DateFormatter()
              formatter.dateFormat = "yyyy"
              let dateStr = formatter.string(from: NSDate() as Date)
              print(dateStr)
              
              lbtRights.text = String(format: "© 2019 - %@ 33 SYSTEMS INC. - All rights reserved.", dateStr)
    }
    

    
    // MARK: - IBAaction
    
    @IBAction func btnBackDidClicked(){
        self.navigationController?.popViewController(animated: true)
    }

    

}
