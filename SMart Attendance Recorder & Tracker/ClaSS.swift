//
//  Classes.swift
//  SMart Attendance Recorder & Tracker
//
//  Created by Srimat Tirumala Pallerlamudi,Aditya on 11/2/17.
//  Copyright © 2017 Aditya Srimat Tirumala Pallerlamudi. All rights reserved.
//

import Foundation

@objcMembers
class ClaSS : NSObject {
    var objectId:String?
    var name:String?
    var created:NSDate?
    var updated:NSDate?
    var sheets: [Sheet]? = []
    
    init(name:String, sheets:[Sheet]){
        self.name = name
        self.sheets = sheets
    }
    
    override var description: String {
        return "name: \(String(describing:name)), sheets: \(String(describing: sheets)), objectId: \(String(describing:objectId))"
    }
    
    init(name:String){
        self.name = name
    }
    override init(){
        super.init()
    }
}

