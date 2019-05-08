//
//  auViewController.swift
//  studyBuddy
//
//  Created by Isa Muhammad on 20/02/2019.
//  Copyright © 2019 Isa Muhammad. All rights reserved.
//

import UIKit
import FirebaseDatabase

class auViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func addUnit(data: [String: Any]) {
        let unitRef = Database.database().reference(withPath: "units").child(User.currentUser.id!).childByAutoId()
        unitRef.updateChildValues(data) { (error, ref) in
            if error == nil {
                self.navigationController?.popViewController(animated: true)
            } else {
                print(error!)
            }
        }
    }
    
    @IBAction func addItem(_ sender: Any)
    {
        //saving to database
        if input.text != "" {
            var dic = [String: Any]()
            dic["name"] = input.text!
            
            //Add data to firebase
            self.addUnit(data: dic)
        }
        
    }
}
