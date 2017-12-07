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
    
//    static var classes:[ClaSS] = [ClaSS(name: "iOS", sheets: [Sheet(name: "11/17/2017"), Sheet(name: "11/15/2017"), Sheet(name: "11/13/2017")]), ClaSS(name: "Android", sheets: [Sheet(name: "11/17/2017"), Sheet(name: "11/15/2017"), Sheet(name: "11/13/2017")])]

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
        let attTVC:AttendanceSheetsTableViewController = AttendanceSheetsTableViewController()
        addNewClass(ClaSS(name: attTVC.claSS.name, sheets: [], classTiming: attTVC.claSS.classTiming))
    }
}
