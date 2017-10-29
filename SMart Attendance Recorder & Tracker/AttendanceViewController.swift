//
//  AttendanceViewController.swift
//  SMart Attendance Recorder & Tracker
//
//  Created by Moody,Christopher L on 10/5/17.
//  Copyright © 2017 Aditya Srimat Tirumala Pallerlamudi. All rights reserved.
//

import UIKit

class AttendanceViewController: UIViewController {
    
    var classData = HomePageViewController.classData
    
    @IBOutlet weak var courseLBL: UILabel!
    @IBOutlet weak var classTimLBL: UILabel!
    @IBOutlet weak var classAttperLBL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadClassData()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadClassData() {
        courseLBL.text = classData["Course"]
        classTimLBL.text = classData["Class Timings"]
        classAttperLBL.text = "\(classAttendance())%"
    }
    
    func classAttendance() -> Double {
        //calculating mean of class attendance
        return 90 //just for time being
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

