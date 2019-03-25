//
//  signUpViewController.swift
//  studyBuddy
//
//  Created by Isa Muhammad on 16/03/2019.
//  Copyright © 2019 Isa Muhammad. All rights reserved.
//

import UIKit
import FirebaseAuth

class signUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //init ui textfields
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUp: UIButton!
    
    
    
    // Mark: Selectors
  
    @IBAction func signUpButton(_ sender: UIButton)
    {
    if emailTextField.text != "" && usernameTextField.text != "" && passwordTextField.text != ""
        {
           Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
            if user != nil
            {
                //sign UP success
               self.performSegue(withIdentifier: "signUpSeg", sender: self)
                print("Successfully signed up")
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
        
        
        
        
        
        //guard let email = emailTextField.text else { return }
        //guard let password = passwordTextField.text else { return }
        //guard let username = usernameTextField.text else { return }
        //print("testing sign up")
        
        //createUser(withEmail: email, password: password, username: username)
    
    
    
    
    // Mark: - API
    
    //func createUser(withEmail email: String, password: String, username: String){
      //  Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            
        //    if let error = error {
          //      print("Failed to sign user up with error: ", error.localizedDescription)
            //    return
            //}
            
            //guard let uid = result?.user.uid else {return}
            
            //let values = ["email": email, "username": username]
            
            //Database.database().reference().child("users").child(uid).updateChildValues(values, withCompletionBlock: { (error,ref) in
              //  if let error = error {
                //    print("Failed to update database values with error: ", error.localizedDescription)
                  //  return
                //}
                
                //print("Successfully signed user up..")
            //})
        //}
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

}

}
