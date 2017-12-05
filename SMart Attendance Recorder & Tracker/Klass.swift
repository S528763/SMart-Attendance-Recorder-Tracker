//
//  Classes.swift
//  SMart Attendance Recorder & Tracker
//
//  Created by Srimat Tirumala Pallerlamudi,Aditya on 11/2/17.
//  Copyright © 2017 Aditya Srimat Tirumala Pallerlamudi. All rights reserved.
//

import Foundation

@objcMembers
class Klass : NSObject {
    var objectId:String?
    var name:String?
    var created:NSDate?
    var updated:NSDate?
    var sheets: [Sheet]? = []
    var classTiming:String?
    
    init(name:String, sheets:[Sheet], classTiming:String){
        self.name = name
        self.sheets = sheets
        self.classTiming = classTiming
    }
    
    override var description: String {
        return "name: \(String(describing:name)), sheets: \(String(describing: sheets)), class Timing: \(String(describing:classTiming)), objectId: \(String(describing:objectId))"
    }
    
    init(name:String, classTiming:String){
        self.name = name
        self.classTiming = classTiming
    }
    override init(){
        super.init()
    }
}

