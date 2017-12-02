//
//  AttendanceViewController.swift
//  SMart Attendance Recorder & Tracker
//
//  Created by Moody,Christopher L on 10/5/17.
//  Copyright © 2017 Aditya Srimat Tirumala Pallerlamudi. All rights reserved.
//

import UIKit

class TakeAttendanceViewController: UITableViewController {
    
    var classData = AddNewClassViewController.classData
    
    @IBOutlet weak var courseLBL: UILabel!
    @IBOutlet weak var classTimLBL: UILabel!
    @IBOutlet weak var classAttperLBL: UILabel!
    
//    @IBOutlet weak var studentLBL: UILabel!
//    
//    @IBOutlet weak var percLBL: UILabel!
//    
//    @IBOutlet weak var presentAbsSWT: UISwitch!
    
    @IBAction func toggleValueChanged(_ sender: UISwitch) {
        tableView.reloadData()
    }
    
    
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
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsheet_cell", for: indexPath)
        
        let studentLBL = cell.viewWithTag(100) as! UILabel
        let percLBL = cell.viewWithTag(200) as! UILabel
        let presentAbsSWT = cell.viewWithTag(300) as! UISwitch
        
        
        studentLBL.text = "Aditya S T P"
        percLBL.text = "99%"
        presentAbsSWT.setOn(true, animated: true)
//        
//        let claSS = Professor.classes[indexPath.row]
//        cell.textLabel?.text = "claSS.name"
//        cell.detailTextLabel?.text = "12 - 12:50 PM"
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
    
}

