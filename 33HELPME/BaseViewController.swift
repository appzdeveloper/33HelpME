//
//  BaseViewController.swift
//  demoTest
//
//  Created by conference on 02/05/17.
//  Copyright © 2017 conference. All rights reserved.
//

import UIKit
import SystemConfiguration


class BaseViewController: UIViewController {

      var alert: UIAlertController! = nil
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 13.0, *) {
                  overrideUserInterfaceStyle = .light
              } else {
                  // Fallback on earlier versions
              }
        // Do any additional setup after loading the view.
      
//        self.navigationController?.isNavigationBarHidden = false
//
//        //for change title color of navigation bar
//        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.white]
//        self.navigationController?.navigationBar.titleTextAttributes = titleDict as? [String : Any]
//        self.navigationController?.navigationBar.isTranslucent = false;
//        navigationController?.navigationBar.barTintColor = UIColor.getNavigationBarColor()
//
//        self.navigationController?.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate
//        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
//
//        if GlobelFunctions.getScrrenSize() <= 568.0
//        {
//            self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Avenir-Heavy", size: 15)!,NSForegroundColorAttributeName: UIColor.white]
//
//            print(self.title)
//
//        }
//        else
//        {
//            self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Avenir-Heavy", size: 20)!,NSForegroundColorAttributeName: UIColor.white]
//
//        }
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    func showAlertWithOutOk(title : NSString , message: NSString) -> Void {
//        alert = UIAlertController(title: title as String, message: message as String, preferredStyle: UIAlertController.Style.alert)
//        self.perform(#selector(BaseViewController.hide), with: nil, afterDelay: 4.0)
//        self.present(alert, animated: true, completion: nil)
        alert = UIAlertController(title: title as String, message: message as String, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ok".uppercased(), style: UIAlertAction.Style.default, handler: nil))
      //  self.perform(#selector(BaseViewController.hide), with: nil, afterDelay: 5.0)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(title : NSString , message: NSString) -> Void {
        alert = UIAlertController(title: title as String, message: message as String, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ok".uppercased(), style: UIAlertAction.Style.default, handler: nil))
        //self.perform(#selector(BaseViewController.hide), with: nil, afterDelay: 5.0)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    func showAlertNoHide(title : NSString , message: NSString) -> Void {
        alert = UIAlertController(title: title as String, message: message as String, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ok".uppercased(), style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlertNoHideWithCloseButton(title : NSString , message: NSString) -> Void {
        alert = UIAlertController(title: title as String, message: message as String, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "CLOSE".uppercased(), style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func hide() -> Void {
        alert.dismiss(animated: true, completion: nil)
    }

    
    override var prefersStatusBarHidden: Bool {
           return false
       }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIColor{
    class func getNavigationBarColor() -> UIColor{
        return  UIColor.init(red: 227.0/255.0, green: 34.0/2550, blue: 16.0/255.0, alpha: 1)
    }
  
    class func getButtonColor() -> UIColor{
        return  UIColor.init(red: 0.0/255.0, green: 152.0/255.0, blue: 158.0/255.0, alpha: 1)
    }
    
    class func getlightButtonColor() -> UIColor{
        return  UIColor.init(red: 197.0/255.0, green: 197.0/255.0, blue: 198.0/255.0, alpha: 1)
    }

    class func getlightLine() -> UIColor{
        return  UIColor.init(red: 239.0/255.0, green: 239.0/255.0, blue: 239.0/255.0, alpha: 1)
    }

    class func getHomeRed() -> UIColor{
        return  UIColor.init(red: 232.0/255.0, green:27.0/255.0, blue: 79.0/255.0, alpha: 0.9)
    }
    
    
    class func getButtonBakgroundYellow() -> UIColor{
          return  UIColor.init(red: 255.0/255.0, green: 210.0/255.0, blue: 3.0/255.0, alpha: 1)
      }
      
    class func getButtonTextColorOnYellow() -> UIColor{
           return  UIColor.init(red: 87.0/255.0, green: 17.0/255.0, blue: 130.0/255.0, alpha: 1)
       }
}


protocol Utilities {
}

extension NSObject:Utilities{
    
    
    enum ReachabilityStatus {
        case notReachable
        case reachableViaWWAN
        case reachableViaWiFi
    }
    
    var currentReachabilityStatus: ReachabilityStatus {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return .notReachable
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return .notReachable
        }
        
        if flags.contains(.reachable) == false {
            // The target host is not reachable.
            return .notReachable
        }
        else if flags.contains(.isWWAN) == true {
            // WWAN connections are OK if the calling application is using the CFNetwork APIs.
            return .reachableViaWWAN
        }
        else if flags.contains(.connectionRequired) == false {
            // If the target host is reachable and no connection is required then we'll assume that you're on Wi-Fi...
            return .reachableViaWiFi
        }
        else if (flags.contains(.connectionOnDemand) == true || flags.contains(.connectionOnTraffic) == true) && flags.contains(.interventionRequired) == false {
            // The connection is on-demand (or on-traffic) if the calling application is using the CFSocketStream or higher APIs and no [user] intervention is needed
            return .reachableViaWiFi
        }
        else {
            return .notReachable
        }
    }
    
}
extension Date {
    func currentTimeMillis() -> String {
        return String(Int64(self.timeIntervalSince1970 * 1000))
    }
}
extension UINavigationController {
    
    func popBack(_ nb: Int) {
        let viewControllers: [UIViewController] = self.viewControllers
        guard viewControllers.count < nb else {
            self.popToViewController(viewControllers[viewControllers.count - nb], animated: true)
            return
        }
    }
    
    /// pop back to specific viewcontroller
    func popBack<T: UIViewController>(toControllerType: T.Type) {
        var viewControllers: [UIViewController] = self.viewControllers
        viewControllers = viewControllers.reversed()
        for currentViewController in viewControllers {
            if currentViewController .isKind(of: toControllerType) {
                self.popToViewController(currentViewController, animated: true)
                break
            }
        }
    }
    
}



