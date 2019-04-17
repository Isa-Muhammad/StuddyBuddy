//
//  auViewController.swift
//  studyBuddy
//
//  Created by Isa Muhammad on 20/02/2019.
//  Copyright © 2019 Isa Muhammad. All rights reserved.
//

import UIKit

class auViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    
    @IBAction func addItem(_ sender: Any)
    {
        if(input.text != "")
        {
            list2.append(input.text!)
            input.text = ""
        }
        
       //self.dismiss(animated: true, completion:  nil)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
