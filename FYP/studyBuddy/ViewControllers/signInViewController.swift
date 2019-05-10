//
//  signInViewController.swift
//  studyBuddy
//
//  Created by Isa Muhammad on 05/02/2019.
//  Copyright © 2019 Isa Muhammad. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class signInViewController: UIViewController {
    
    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    //init ui textfields
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logIn: UIButton!
    
    //MARK:- Methods
    func fetchUserInfo() {
        let usersRef = Database.database().reference(withPath: "users")
        usersRef.child(User.currentUser.id!).observeSingleEvent(of: .value, with: {(snapshot) in
            if let value = snapshot.value as? [String: AnyObject] {
                User.currentUser.saveUserInformation(userInfo: value)
            } else {
                print("Not valid json!")
            }
        })
    }
    
    // Mark:  - Selectors
    
    @IBAction func logInButton(_ sender: UIButton)
    {
    if emailTextField.text != "" && passwordTextField.text != ""
        {
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
                if user != nil
                {
                    //switch to home screen after sign in success
                    print("Successfully signed in")
                    var userDataDic = [String: Any]()
                    userDataDic["id"] = Auth.auth().currentUser!.uid
                    userDataDic["email"] = Auth.auth().currentUser!.email!
                    User.currentUser.saveUserInformation(userInfo: userDataDic)
                    self.fetchUserInfo()
                    StoryboardManager.segueToMain()
                }
                else
                {
                    if let myError = error?.localizedDescription
                    {
                        print(myError)
                    }
                    else
                    {
                        print("ERROR")
                    }
                }
        })
    
    }
    }


}
