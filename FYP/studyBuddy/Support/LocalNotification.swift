//
//  LocalNotification.swift
//  studyBuddy
//
//  Created by Isa Muhammad on 09/05/2019.
//  Copyright © 2019 Isa Muhammad. All rights reserved.
//

import UIKit
import UserNotifications

class LocalNotificationHandler: NSObject {
    func registerNotification() {
        let center = UNUserNotificationCenter.current()
        let options = UNAuthorizationOptions(arrayLiteral: .alert, .sound, .badge)
        center.requestAuthorization(options: options) { (isSuccess, error) in
            // handle or show message here if user dont allow to show notificagtion... like you will be miss deadline etc.
            if isSuccess == false {
                let controller = UIAlertController(title: "Attention", message: "You miss your deadline. You can change your mind by changing in Setting", preferredStyle: .alert)
                controller.addAction(UIAlertAction(title: "OK", style: .default))
                UIApplication.present(controller)
            }
        }
    }
    
    func scheduleNotification(message: String, subtitle: String, time: Date) {
        let content = UNMutableNotificationContent()
        content.title = message
        content.subtitle = subtitle
        content.userInfo = [
            "message": message
        ]
        
        let components = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second],
                                                         from: time)
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        
        
        let id = String(Date().timeIntervalSince1970)
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
    
        let center = UNUserNotificationCenter.current()
        center.add(request) { (error) in
            print(error)
        }
        
    }
    
    func showMessage(message: String) {
        let controller = UIAlertController(title: "Attention", message: message, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "OK", style: .default))
        UIApplication.present(controller)
    }
    
}


extension UIApplication {
    class func topViewController(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(presented)
        }
        return base
    }
    
    class func present(_ controller: UIViewController) {
        let topController = topViewController()
        topController?.present(controller, animated: true)
    }
    
}

