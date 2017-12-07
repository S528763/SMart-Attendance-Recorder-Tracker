//
//  CourseTableViewController.swift
//  SMart Attendance Recorder & Tracker
//
//  Created by Srimat Tirumala Pallerlamudi,Aditya on 11/2/17.
//  Copyright © 2017 Aditya Srimat Tirumala Pallerlamudi. All rights reserved.
//

import UIKit

class ClassesTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "class_cell", for: indexPath)
        let claSS = Professor.classNum(indexPath.row)
        cell.textLabel?.text = claSS.name
        cell.detailTextLabel?.text = claSS.classTiming
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sheetsFound:AttendanceSheetsTableViewController = AttendanceSheetsTableViewController()
        sheetsFound.claSS = Professor.classNum(indexPath.row)
        self.navigationController?.pushViewController(sheetsFound, animated: true)
    }
    
    // to give an endpoint for the unwind segue
    @IBAction func cancelCreatingNewClass(segue:UIStoryboardSegue){
        
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//        
//        if segue.identifier == "Attendance_Sheets_Table_View_Controller" {
//            let attsheetsTVC:AttendanceSheetsTableViewController = segue.destination as! AttendanceSheetsTableViewController
//            attsheetsTVC.claSS = Professor.classNum(tableView.indexPathForSelectedRow!.row)
//        }
//    }
}
