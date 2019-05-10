
//
//  dlViewController.swift
//  studyBuddy
//
//  Created by Isa Muhammad on 14/02/2019.
//  Copyright © 2019 Isa Muhammad. All rights reserved.
//

import UIKit
import FirebaseDatabase


class dlViewController: UIViewController {
    
    
    @IBOutlet weak var input: UITextField!
    
    
    //database reference
    var ref:DatabaseReference?
    
    
    
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
    
    func addDeadline(data: [String: Any]) {
        let deadlineRef = Database.database().reference(withPath: "deadlines").child(User.currentUser.id!).childByAutoId()
        deadlineRef.updateChildValues(data) { (error, ref) in
            if error == nil {
                self.navigationController?.popViewController(animated: true)
            } else {
                print(error!)
            }
        }
        // time trigger 24 hours
        if let message = input.text {
            let date = datePicker.date
            let triggerTime = date.addingTimeInterval(-24*60*60)
           
            addLocalNotification(message: message, time: triggerTime)
        }
        
        
        
    }
    
    func addLocalNotification(message: String, time: Date) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.localNotificationHandler.scheduleNotification(message: message, subtitle: "Nothing", time: time)
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
        if input.text != "" && inputDate.text != "" {
            var dic = [String: Any]()
            dic["description"] = input.text!
            dic["date"] = inputDate.text!
            
            //Add data to firebase
            self.addDeadline(data: dic)
        }
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


