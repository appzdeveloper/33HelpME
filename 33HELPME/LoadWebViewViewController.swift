//
//  LoadWebViewViewController.swift
//  33HELPME
//
//  Created by Cgt_Jpr_Mac_BalkaranS on 3/18/21.
//  Copyright © 2021 33HELPME. All rights reserved.
//

import UIKit
import WebKit
class LoadWebViewViewController: UIViewController {

    @IBOutlet var webView: WKWebView!
    var viewtitle = ""
    override func viewDidLoad() {
        super.viewDidLoad()

       //WKWebView.clean()
        
        webView.navigationDelegate = self
        webView.isUserInteractionEnabled = true
        
        if let url = URL.init(string: "https://www.33systems.net/privacypolicy.html"){
            let urlRequest = URLRequest.init(url:url )
            webView.load(urlRequest)
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension LoadWebViewViewController : WKNavigationDelegate{
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("Start loading")
        ShowHUD()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("End loading")
        RemoveHUD()
    }
}
