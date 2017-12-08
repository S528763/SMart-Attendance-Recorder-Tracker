//
//  EditStudentProfileViewController.swift
//  SMart Attendance Recorder & Tracker
//
//  Created by Chris Moody  on 12/7/17.
//  Copyright © 2017 Aditya Srimat Tirumala Pallerlamudi. All rights reserved.
//

import UIKit

class EditStudentProfileViewController: UIViewController {

    
    var student = StudentProfileViewController.student
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var attendanceTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func cancelBTTN(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveBTTN(_ sender: Any) {
        if nameTF.text! != "" && nameTF.text != nil || attendanceTF.text! != "" && attendanceTF.text != nil || phoneTF.text! != "" && phoneTF.text != nil || emailTF.text! != "" && emailTF.text != nil {
        StudentProfileViewController.saveNewInfo( nameTF.text!, emailTF.text!, phoneTF.text!, Double(attendanceTF.text!)!)
        self.dismiss(animated: true, completion: nil)
        }
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
