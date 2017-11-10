//
//  ForgotPasswordViewController.swift
//  SMart Attendance Recorder & Tracker
//
//  Created by Aditya S T P on 10/20/17.
//  Copyright © 2017 Aditya Srimat Tirumala Pallerlamudi. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    
    @IBOutlet weak var submitBTN: UIButton!
    
    @IBAction func submit() {
        alertForForgotPassword(submitBTN)
    }
    
    @IBAction func alertForForgotPassword(_ sender: UIButton) {
        let alert = UIAlertController(title: "Reset done!", message: "Check email for credentials", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sendEmailBTTN(_ sender: Any) {
        //send the person an email.... Somehow...
        self.dismiss(animated: true)
    }
    
    @IBAction func cancelBTTN(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func forgotDone(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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

