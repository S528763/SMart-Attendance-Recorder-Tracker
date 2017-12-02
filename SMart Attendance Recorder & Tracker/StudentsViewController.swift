//
//  StudentsViewController.swift
//  SMart Attendance Recorder & Tracker
//
//  Created by Moody,Christopher L on 12/2/17.
//  Copyright © 2017 Aditya Srimat Tirumala Pallerlamudi. All rights reserved.
//

import UIKit

class StudentsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var students = ["Chris", "Karthic", "Aditya", "John", "Sally", "Sue", "Amy", "Debra"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "student-cell")!// in lieu of UITableViewCell()
        cell.textLabel?.text = students[indexPath.row]
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func cancel(unwindSegue: UIStoryboardSegue){
        self.dismiss(animated: true) 
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
