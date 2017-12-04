//
//  StudentProfileViewController.swift
//  SMart Attendance Recorder & Tracker
//
//  Created by Moody,Christopher L on 10/5/17.
//  Copyright © 2017 Aditya Srimat Tirumala Pallerlamudi. All rights reserved.
//

import UIKit

class StudentProfileViewController: UIViewController {
    
  //  var student:Student!

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
//        nameLBL.text! = student.name
//        attendanceLBL.text! = "\(student.attendance)"
//        phoneLBL.text! = student.phone
//        emailLBL.text! = student.email
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
