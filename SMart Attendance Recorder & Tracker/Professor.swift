//
//  Professor.swift
//  SMart Attendance Recorder & Tracker
//
//  Created by Srimat Tirumala Pallerlamudi,Aditya on 11/9/17.
//  Copyright © 2017 Aditya Srimat Tirumala Pallerlamudi. All rights reserved.
//

import Foundation
import CoreLocation

class Professor {
    
    static var classes:[ClaSS] = []
    
//    static var classes:[ClaSS] = [ClaSS(name: "iOS", sheets: [Sheet(name: Date())], classTiming: "12:00"), ClaSS(name: "Android", sheets: [Sheet(name: Date())], classTiming: "12:00")]

    static func numClasses()->Int {
        return classes.count
    }

    // returns a particular classroom
    static func classNum(_ index:Int) -> ClaSS {
        return classes[index]
    }

    // adds a new classroom to the mix
    static func addNewClass(_ claSS:ClaSS){
        classes.append(claSS)
    }
    
    // adds a new bird
    static func addNewSheet(_ sheet:Sheet) {
        //let attTVC:AttendanceSheetsTableViewController = AttendanceSheetsTableViewController()
        addNewClass(ClaSS(name: AttendanceSheetsTableViewController.claSS.name, sheets: [], classTiming: AttendanceSheetsTableViewController.claSS.classTiming))
    }
}
