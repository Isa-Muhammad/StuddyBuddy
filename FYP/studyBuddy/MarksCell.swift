//
//  MarksCell.swift
//  studyBuddy
//
//  Created by Isa Muhammad on 06/04/2019.
//  Copyright © 2019 Isa Muhammad. All rights reserved.
//

import UIKit

class MarksCell: UITableViewCell , UITextFieldDelegate {
    
    var markObj : MarkModel? {
        didSet {
            
            if(markObj!.isDataAvailable){
                self.marks.text         = String(markObj!.marks!)
                self.percentage.text    = String(markObj!.percentage!)
                self.reference.text     = String(markObj!.reference)
            }
        }
    }
    
    
    @IBOutlet weak var marks: UITextField!
    @IBOutlet weak var percentage: UITextField!
    @IBOutlet weak var reference: UITextField!
    
    var callback: (()->())!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.marks.delegate         = self
        self.percentage.delegate    = self
        self.reference.delegate     = self
        
        self.addDoneButtonOnKeyboard()
        
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.getData(textField)
        return true
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
        self.getData(textField)
    }
    
    
    func getData(_ textField: UITextField){
        if textField == self.marks {
            guard textField.text?.isEmpty == false else{
                return
            }
            
            let marks           = Int(textField.text!)
            self.markObj?.marks = marks!
        }
        
        if textField == self.percentage {
            guard textField.text?.isEmpty == false else{
                return
            }
            
            let percentage                = Int(textField.text!)
            self.markObj?.percentage = percentage!
        }
        
        if textField == self.reference {
            guard textField.text?.isEmpty == false else{
                return
            }
            let reference           = textField.text!
            self.markObj?.reference = reference
        }
        
        self.callback()
    }
    
    
    
    
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle       = UIBarStyle.default
        let flexSpace              = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem  = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.doneButtonAction))
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.marks.inputAccessoryView = doneToolbar
        self.percentage.inputAccessoryView = doneToolbar
        
        inputAssistantItem.leadingBarButtonGroups = []
        inputAssistantItem.trailingBarButtonGroups = []
    }
    
    
    @objc func doneButtonAction() {
        self.marks.resignFirstResponder()
        self.percentage.resignFirstResponder()
    }
    
}
