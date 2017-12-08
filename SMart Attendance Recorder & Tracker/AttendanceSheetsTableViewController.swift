//
//  AttendanceSheetsTableViewController.swift
//  SMart Attendance Recorder & Tracker
//
//  Created by Srimat Tirumala Pallerlamudi,Aditya on 11/2/17.
//  Copyright © 2017 Aditya Srimat Tirumala Pallerlamudi. All rights reserved.
//

import UIKit

class AttendanceSheetsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//    @IBOutlet weak var tableView: UITableView!
    
    var claSS:ClaSS!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = claSS.name
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Professor.numClasses()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sheets_cell", for: indexPath)
       // cell.textLabel?.text = tdVC.todayDate
        //"\(claSS.sheets[indexPath.row].name)"
        let sheet = claSS.sheets[indexPath.row]
        cell.textLabel?.text = "12/08/2017"
        return cell
    }
    
    // destination for Unwind Segue
    @IBAction func cancelAddingNewSheet(segue: UIStoryboardSegue){
        
    }
    
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//
//        if segue.identifier == "Today_Attendance_View_Controller" {
//            let sheetVC = segue.destination as! TodayAttendanceViewController
//            sheetVC.sheet = claSS.sheets[i]
//        } else {
//            let addNewSheetVC = segue.destination as! TakeAttendanceViewController
//            addNewSheetVC.claSS = claSS
//        }
//    }
    
    
}
