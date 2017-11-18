//
//  CourseTableViewController.swift
//  SMart Attendance Recorder & Tracker
//
//  Created by Srimat Tirumala Pallerlamudi,Aditya on 11/2/17.
//  Copyright © 2017 Aditya Srimat Tirumala Pallerlamudi. All rights reserved.
//

import UIKit

class ClassesTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Classes"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        NotificationCenter.default.addObserver(self, selector: #selector(newClassAdded(notification:)), name: NSNotification.Name(rawValue:"New Class Added"), object: nil)
    }
    
    @objc func newClassAdded(notification:Notification){
        refreshClasses()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        refreshClasses()
    }
    
    // Refreshes the lit of classes
    func refreshClasses(){
        //Professor.classes = dbManager.retrieveAllClasses()
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
        return Professor.classes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "class_cell", for: indexPath)
        let claSS = Professor.classes[indexPath.row]
        cell.textLabel?.text = claSS.name
        return cell
    }
    
    // to give an endpoint for the unwind segue
    @IBAction func cancelCreatingNewClass(segue:UIStoryboardSegue){
        
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "Attendance_Sheets_Table_View_Controller" {
            let attsheetsTVC = segue.destination as! AttendanceSheetsTableViewController
            attsheetsTVC.claSS = Professor.classes[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
}
