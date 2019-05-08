//
//  Unit.swift
//  studyBuddy
//
//  Created by Isa Muhammad on 21/04/2019.
//  Copyright © 2019 Isa Muhammad. All rights reserved.
//

import Foundation
import Firebase

class Unit {
    
    var name: String
    
    init(){
        self.name = ""
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: AnyObject],
            let name = value["name"] as? String else {
                return nil
        }
        
        self.name = name
    }
}
