//
//  ChecklistIttem.swift
//  TodoApp
//
//  Created by Alumno on 06/04/16.
//  Copyright © 2016 ITESM. All rights reserved.
//

import Foundation

class ChecklistIttem: NSObject, NSCoding{
    var text  = ""
    var checked = false
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(text, forKey: "Text")
        aCoder.encodeBool(checked, forKey: "Checked")
    }
    required init?(coder aDecoder: NSCoder) {
        text = aDecoder.decodeObjectForKey("Text") as! String
        checked = aDecoder.decodeBoolForKey("Checked")
        super.init()
    }
    override init() {
        super.init()
    }
    func toggleCheckmark() {
        self.checked = !checked
    }
}