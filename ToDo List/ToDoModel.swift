//
//  ToDoModel.swift
//  ToDo List
//
//  Created by Sayem on 3/22/17.
//  Copyright © 2017 Sayem. All rights reserved.
//

import UIKit

struct ToDoModel {
    
    var title:String
    var message:String
    var isDone:Bool = false
    
    
    init(title:String, message:String) {
        self.title = title
        self.message = message
    }
    
    mutating func toggleDone() {
        self.isDone = !isDone
    }
}
