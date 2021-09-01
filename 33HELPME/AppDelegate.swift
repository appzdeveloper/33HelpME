//
//  AppDelegate.swift
//  33HELPME
//

//  Copyright © 2020 33HELPME. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import Alamofire

var AFManager = SessionManager()
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
          Thread.sleep(forTimeInterval:2 )
           IQKeyboardManager.shared.enable = true
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest =  TimeInterval(150) // seconds
        configuration.timeoutIntervalForResource =  TimeInterval(150)
        configuration.httpMaximumConnectionsPerHost = 1
        configuration.allowsCellularAccess = true
        AFManager = Alamofire.SessionManager(configuration: configuration)
          UserLocation.sharedInstance.startUpdateLocation()
      
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
       
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

extension UIApplication {
    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}
