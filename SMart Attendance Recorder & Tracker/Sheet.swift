//
//  Sheet.swift
//  SMart Attendance Recorder & Tracker
//
//  Created by Srimat Tirumala Pallerlamudi,Aditya on 11/9/17.
//  Copyright © 2017 Aditya Srimat Tirumala Pallerlamudi. All rights reserved.
//

import Foundation

@objcMembers
class Sheet : NSObject {
    var name:Date?
    var objectId:String?
    var created:NSDate?
    var updated:NSDate?    
    var claSS:ClaSS?
    
    override var description: String {
        return "Name: \(String(describing: name))"
    }
    
    override init(){
        super.init()
    }
    
    init(name:Date?) {
        self.name = name
    }
    
    static func ==(lhs: Sheet, rhs: Sheet) -> Bool {
        return lhs.name == rhs.name
    }
}
