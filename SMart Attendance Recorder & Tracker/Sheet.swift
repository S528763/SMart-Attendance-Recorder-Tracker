//
//  Sheet.swift
//  SMart Attendance Recorder & Tracker
//
//  Created by Srimat Tirumala Pallerlamudi,Aditya on 11/9/17.
//  Copyright © 2017 Aditya Srimat Tirumala Pallerlamudi. All rights reserved.
//

import Foundation

class Sheet: Equatable {
    
    var name:Date!
    
    init(name:Date?) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: Date())
    }
    
    static func ==(lhs: Sheet, rhs: Sheet) -> Bool {
        return lhs.name == rhs.name
    }
}
