//
//  Student.swift
//  SMart Attendance Recorder & Tracker
//
//  Created by Moody,Christopher L on 12/3/17.
//  Copyright © 2017 Aditya Srimat Tirumala Pallerlamudi. All rights reserved.
//

import Foundation

class Student {
    var name:String
    var attendance:Double
    var phone:String
    var email:String
    
    init(_ name:String, _ attendance:Double, _ phone:String, _ email:String){
        self.name = name
        self.attendance = attendance
        self.phone = phone
        self.email = email
    }
    
    convenience init(){
        self.init("", 0.0, "", "")
    }
    
    
}
