//
//  User.swift
//  studyBuddy
//
//  Created by Isa Muhammad on 21/04/2019.
//  Copyright © 2019 Isa Muhammad. All rights reserved.
//

let UserID = "id"
let UserEmail = "email"
let UserName = "username"

import Foundation
import Firebase

class User {
    var id: String?
    var userName: String?
    var email: String?
    
    // Used to check either user is logged in or not
    var isLoggedIn: Bool {
        return self.id != nil
    }
    
    static let currentUser : User = {
        let instance = User()
        return instance
    }()
    
    init() {
        self.setUp()
    }
    
    fileprivate func setUp(){
        self.id = UserDefaults.standard.string(forKey: UserID)
        self.userName = UserDefaults.standard.string(forKey: UserName)
        self.email = UserDefaults.standard.string(forKey: UserEmail)
    }
    
    func saveUserInformation(userInfo: [String: Any]) {
        if let id = userInfo[UserID] as? String {
            self.id = id
            UserDefaults.standard.set(self.id, forKey: UserID)
        }
        if let name = userInfo[UserName] as? String {
            self.userName = name
            UserDefaults.standard.set(self.userName, forKey: UserName)
        }
        
        if let email = userInfo[UserEmail] as? String {
            self.email = email
            UserDefaults.standard.set(self.userName, forKey: UserEmail)
        }
    }
    
    func logOut(){
        self.id = nil
        self.userName = nil
        self.email = nil
        
        UserDefaults.standard.set(nil, forKey: UserID)
        UserDefaults.standard.set(nil, forKey: UserName)
        UserDefaults.standard.set(nil, forKey: UserEmail)
    }
}
