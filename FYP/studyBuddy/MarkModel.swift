//
//  MarkModel.swift
//  studyBuddy
//
//  Created by Isa Muhammad on 06/04/2019.
//  Copyright © 2019 Isa Muhammad. All rights reserved.
//

import Foundation

class MarkModel: NSObject {
    
    var marks       : Int? = 0
    var percentage  : Int? = 0
    var reference   : String = ""
    var isDataAvailable : Bool {
        if (marks == nil || percentage == nil)  {
            return false
        }else if (self.marks == 0 && self.percentage == 0) {
            return false
        }else{
            return true
        }
    }
    
    
    var calculation : Double {
        let result = Double(self.percentage!) / 100 * Double(self.marks!)
        return result
    }
    
    
    override init() {
        
    }
    
    
    init(marks : Int , percentage : Int) {
        self.marks              = marks
        self.percentage         = percentage
    }
    
}
