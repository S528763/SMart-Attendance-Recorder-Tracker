//
//  StudentsViewController.swift
//  SMart Attendance Recorder & Tracker
//
//  Created by Moody,Christopher L on 12/2/17.
//  Copyright © 2017 Aditya Srimat Tirumala Pallerlamudi. All rights reserved.
//

import UIKit

class StudentsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //var tableView = UITableView().self
    var old_students = ["Chris", "Karthic", "Aditya", "John", "Sally", "Sue", "Amy", "Debra"]
    static var students = [ Student("Chris Moody", 0.0, "641-871-0758", "s524268@nwmissouri.edu"), Student("Karthic Goud", 0.0, "000-000-0000", "s111111@nwmissouri.edu"), Student("Aditya Srimat Tirumala Pallerlamudi", 0.0, "111-111-1111", "s222222@nwmissouri.edu"), Student("John Smith", 0.0, "123-456-7890", "email@nwmissouri.edu"), Student("Sally Ann", 0.0, "123-456-7890", "email@nwmissouri.edu"), Student("Sue Richardson", 0.0, "123-456-7890", "email@nwmissouri.edu"), Student("Amy Lee", 0.0, "123-456-7890", "email@nwmissouri.edu"), Student("Debra Wheeler ", 0.0, "123-456-7890", "email@nwmissouri.edu") ]
    
    var selectedStudent:Student!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StudentsViewController.students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "student_cell")// in lieu of UITableViewCell()
        cell!.textLabel?.text = StudentsViewController.students[indexPath.row].name
        return cell!
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func cancelStudentProfile(unwindSegue: UIStoryboardSegue){
        self.dismiss(animated: true) 
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedStudent = StudentsViewController.students[indexPath.row]
        performSegue(withIdentifier: "student_profile_view_controller", sender: indexPath)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        /*
         if segue.identifier == "Bird_View_Controller" {
             let birdVC = segue.destination as! BirdViewController
             birdVC.bird = county.birds![(tableView.indexPathForSelectedRow?.row)!]
         }*/
        if segue.identifier == "student_profile_view_controller"{
            StudentProfileViewController.student = selectedStudent
        }
        
    }
 

}
