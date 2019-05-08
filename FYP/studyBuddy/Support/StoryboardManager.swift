//
// StoryboardManager.swift
//  studyBuddy
//
//  Created by Isa Muhammad on 21/04/2019.
//  Copyright © 2019 Isa Muhammad. All rights reserved.
//

import UIKit

class StoryboardManager {
    class func segueToLogin() {
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = mainStoryBoard.instantiateViewController(withIdentifier: "LoginNavigationViewController") as! UINavigationController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.replaceRootViewController(with: loginViewController, animated: true)
    }
    
    class func segueToMain() {
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = mainStoryBoard.instantiateViewController(withIdentifier: "BaseTabBarViewController") as! UITabBarController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.replaceRootViewController(with: mainViewController, animated: true)
    }
}
