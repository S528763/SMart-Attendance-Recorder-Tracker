//
//  HomePageViewController.swift
//  SMart Attendance Recorder & Tracker
//
//  Created by Srimat Tirumala Pallerlamudi,Aditya on 10/5/17.
//  Copyright © 2017 Aditya Srimat Tirumala Pallerlamudi. All rights reserved.
//

import UIKit

class AddNewClassViewController: UIViewController {
    
    @IBOutlet weak var courseTF: UITextField!
    @IBOutlet weak var classTimTF: UITextField!
    
    static var classData: [String:String] = ["Professor":"MP Rogers", "Course":"iOS", "Class Timings":"12:00 PM - 12:50 PM"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // self.tabBarController?.tabBar.isHidden = false
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
//    @IBAction func addNewClass(_ sender: Any) {
//        // add new class
//        dbManager.addNewClass(named: courseTF.text!, timing: classTimTF.text!)
//        dismiss(animated: true, completion: nil)
//    }
    
    @IBAction func addNewClass(sender: Any){
        let classToAdd = ClaSS(name: courseTF.text!, sheets: [], classTiming: classTimTF.text!)
        Professor.addNewClass(classToAdd)
        self.dismiss(animated: true, completion: nil)
    }
    
}
