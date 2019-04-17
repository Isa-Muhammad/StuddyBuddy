//
//  dlViewController.swift
//  studyBuddy
//
//  Created by Isa Muhammad on 14/02/2019.
//  Copyright © 2019 Isa Muhammad. All rights reserved.
//

import UIKit

class dlViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    
    
    //init UIDATEPICKER
    let datePicker = UIDatePicker.init()
    
    @IBOutlet weak var inputDate: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        inputDate.inputView = datePicker
        
        let gestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(backgroundTap(gesture:)));
        view.addGestureRecognizer(gestureRecognizer)
        
    }
    
    @objc func backgroundTap(gesture : UITapGestureRecognizer) {
        inputDate.resignFirstResponder() // or view.endEditing(true)
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        
        let strDate = dateFormatter.string(from: datePicker.date)
        inputDate.text = String(strDate)
        
        print(strDate)
    }
    
    
   
    @IBAction func dateChanged(_ sender: Any) {
        
        let dateFormatter = DateFormatter()
    
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        
        let strDate = dateFormatter.string(from: datePicker.date)
        inputDate.text = strDate
        print(strDate)
    }
    
    
    
    
    @IBAction func addall(_ sender: Any) {
        
        
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        
        let strDate = dateFormatter.string(from: datePicker.date)
        inputDate.text = String(strDate)
        
        print(strDate)
        
        
        if(input.text! + inputDate.text! != "")
        {
            list.append(input.text! + "                                       " +  inputDate.text!)
            inputDate.text = ""
            input.text = ""
        }
        self.dismiss(animated: true, completion:  nil)
    }
    

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
    
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


