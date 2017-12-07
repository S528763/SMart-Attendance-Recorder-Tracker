//
//  Classes.swift
//  SMart Attendance Recorder & Tracker
//
//  Created by Srimat Tirumala Pallerlamudi,Aditya on 11/2/17.
//  Copyright © 2017 Aditya Srimat Tirumala Pallerlamudi. All rights reserved.
//

import Foundation

class ClaSS {
    var name:String
    var classTiming:String
    var sheets:[Sheet]
    
    init(name:String, sheets:[Sheet], classTiming:String){
        self.name = name
        self.sheets = sheets
        self.classTiming = classTiming
    }
}
