//
//  BaseTabBarViewController.swift
//  studyBuddy
//
//  Created by Isa Muhammad on 08/05/2019.
//  Copyright © 2019 Isa Muhammad. All rights reserved.
//

import UIKit

class BaseTabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        if User.currentUser.isLoggedIn == false {
            StoryboardManager.segueToLogin()
        }
    }
}
