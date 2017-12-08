//
//  AttendanceViewController.swift
//  SMart Attendance Recorder & Tracker
//
//  Created by Moody,Christopher L on 10/5/17.
//  Copyright © 2017 Aditya Srimat Tirumala Pallerlamudi. All rights reserved.
//

import UIKit
import CoreLocation

class TakeAttendanceViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var claSS:ClaSS!
    
    var classData = AddNewClassViewController.classData
    var stVC = StudentsViewController()
    
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
        courseLBL.text! = classData["Course"]!
        classTimLBL.text! = classData["Class Timings"]!
        classAttperLBL.text! = "\(classAttendance())%"
    }
    
    func classAttendance() -> Double {
        //calculating mean of class attendance
        return 90 //just for time being
    }
    
    @IBAction func attendanceDone(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Professor.classes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsheet_cell", for: indexPath) as! SwitchTableViewCell
        cell.studentLBL.text = StudentsViewController.students[indexPath.row].name
        cell.percLBL.text = "\(StudentsViewController.students[indexPath.row].attendance)"
        cell.presentAbsSWT.setOn(true, animated: true)
        return cell
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    //    @IBAction func addNewSheet(_ sender: Any) {
    //        let sheetToAdd = Sheet(name: "12/08/2017")
    //        Professor.addNewSheet(sheetToAdd)
    //        todayDate = "12/08/2017"
    //        dismiss(animated: true, completion: nil)
    //    }
}

