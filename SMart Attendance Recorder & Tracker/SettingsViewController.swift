//
//  SettingsViewController.swift
//  SMart Attendance Recorder & Tracker
//
//  Created by Srimat Tirumala Pallerlamudi,Aditya on 10/5/17.
//  Copyright © 2017 Aditya Srimat Tirumala Pallerlamudi. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var claSS:ClaSS!
    
    static var info: [String] = ["Aditya STP", "stp.aditya@gmail.com", "+1 (000) 000 0000"]
    
    @IBOutlet weak var nameLBL: UILabel!
    @IBOutlet weak var emailLBL: UILabel!
    @IBOutlet weak var phoneNumberLBL: UILabel!   
    
    
    @IBAction func deleteSheetBTN(_ sender: Any) {
        let alert = UIAlertController(title: "Delete All Sheets", message: "Are you sure you want to delete all sheets?", preferredStyle: .alert)
        let clearAction = UIAlertAction(title: "Delete", style: .destructive) { (alert: UIAlertAction!) -> Void in
            //Needs to be uncommented below when sheets is up and working.
            //self.claSS.sheets = []
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (alert: UIAlertAction!) -> Void in
            //print("You pressed Cancel")
        }
        
        alert.addAction(clearAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion:nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        refreshData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refreshData(){
        nameLBL.text = SettingsViewController.info[0]
        emailLBL.text = SettingsViewController.info[1]
        phoneNumberLBL.text = SettingsViewController.info[2]
    }
    
    
    @IBAction func cancelEditProfessorProfile(segue:UIStoryboardSegue){
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
