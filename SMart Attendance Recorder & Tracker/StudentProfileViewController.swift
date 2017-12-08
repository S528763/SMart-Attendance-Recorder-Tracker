//
//  StudentProfileViewController.swift
//  SMart Attendance Recorder & Tracker
//
//  Created by Moody,Christopher L on 10/5/17.
//  Copyright © 2017 Aditya Srimat Tirumala Pallerlamudi. All rights reserved.
//

import UIKit

class StudentProfileViewController: UIViewController {
    
    static var student:Student!

    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBOutlet weak var nameLBL: UILabel!
    @IBOutlet weak var attendanceLBL: UILabel!
    @IBOutlet weak var phoneLBL: UILabel!
    @IBOutlet weak var emailLBL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameLBL.text! = StudentProfileViewController.student.name
        attendanceLBL.text! = "\(StudentProfileViewController.student.attendance)"
        phoneLBL.text! = StudentProfileViewController.student.phone
        emailLBL.text! = StudentProfileViewController.student.email
    }
    override func viewWillAppear(_ animated: Bool) {
        nameLBL.text! = StudentProfileViewController.student.name
        attendanceLBL.text! = "\(StudentProfileViewController.student.attendance)"
        phoneLBL.text! = StudentProfileViewController.student.phone
        emailLBL.text! = StudentProfileViewController.student.email
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    static func saveNewInfo(_ name:String, _ email:String, _ phone:String, _ attendance:Double){
        StudentProfileViewController.student.name = name
        StudentProfileViewController.student.email = email
        StudentProfileViewController.student.phone = phone
        StudentProfileViewController.student.attendance = attendance
    }
    @IBAction func cancelBTTN(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
