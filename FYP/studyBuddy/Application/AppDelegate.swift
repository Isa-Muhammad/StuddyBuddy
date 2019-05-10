//
//  AppDelegate.swift
//  studyBuddy
//
//  Created by Isa Muhammad on 05/02/2019.
//  Copyright © 2019 Isa Muhammad. All rights reserved.
//

import UIKit
import Firebase
import UserNotifications



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let localNotificationHandler = LocalNotificationHandler()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        
        localNotificationHandler.registerNotification()
        return true
    }

    

    func replaceRootViewController(with vc: UIViewController, animated: Bool) {
        UIView.transition(with: self.window!, duration: 0.1, options: UIView.AnimationOptions.transitionFlipFromLeft, animations: {
            self.window!.rootViewController = vc
            self.window!.makeKeyAndVisible()
        }, completion: nil)
    }
    
    
    func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
        print(notification)
        guard let message =  notification.userInfo?["message"] as? String else { return }
        localNotificationHandler.showMessage(message: message)
    }
    
    
    
}

