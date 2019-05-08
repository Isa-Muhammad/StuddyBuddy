//
//  Deadline.swift
//  studyBuddy
//
//  Created by Isa Muhammad on 21/04/2019.
//  Copyright © 2019 Isa Muhammad. All rights reserved.
//

import Foundation
import Firebase

class Deadline {
    
    var date: String
    var description: String
    
    init(){
        self.date = ""
        self.description = ""
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: AnyObject],
            let date = value["date"] as? String,
            let description = value["description"] as? String else {
                return nil
        }
        
        self.date = date
        self.description = description
    }
}
