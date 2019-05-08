//
//  signUpViewController.swift
//  studyBuddy
//
//  Created by Isa Muhammad on 16/03/2019.
//  Copyright © 2019 Isa Muhammad. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class signUpViewController: UIViewController, UITextFieldDelegate {
    
    //MARK:- Interface Builder
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUp: UIButton!
    
    //MARK:- Propetries
    let usersRef = Database.database().reference(withPath: "users")

    
    //MARK:- ViewController Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailTextField.delegate = self
    }
    
    //MARK:- Methods
    func saveUserInfoOnFirebase(userInfo: [String: Any]) {
        let myUserRef = usersRef.child(User.currentUser.id!)
        myUserRef.updateChildValues(userInfo, withCompletionBlock: { (error, ref) in
            if error != nil {
                print("User information doesn't saved on firebase!")
            }
        })
    }
    
    
    // Mark: Selectors
  
    @IBAction func signUpButton(_ sender: UIButton)
    {
    if emailTextField.text != "" && usernameTextField.text != "" && passwordTextField.text != ""
        {
           Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
            if user != nil
            {
                //sign UP success
                print("Successfully signed up")
                
                //save user information
                var userDataDic = [String: Any]()
                userDataDic["id"] = Auth.auth().currentUser!.uid
                userDataDic["email"] = Auth.auth().currentUser!.email!
                userDataDic["username"] = self.usernameTextField.text!
                User.currentUser.saveUserInformation(userInfo: userDataDic)
                self.saveUserInfoOnFirebase(userInfo: userDataDic)
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
        
        //hide keyboard on background touch
           // func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
           //     self.view.endEditing(true)
            //}
        
        //hide keyboard on pressing return
            func keyBoardReturn(_ textField: UITextField) -> Bool {
                emailTextField.resignFirstResponder()
                return (true)
            }
        
        
       
    
}

}

}
