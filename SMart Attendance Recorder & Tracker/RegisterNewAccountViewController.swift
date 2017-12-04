//
//  RegisterNewAccountViewController.swift
//  SMart Attendance Recorder & Tracker
//
//  Created by Chris Moody  on 10/20/17.
//  Copyright © 2017 Aditya Srimat Tirumala Pallerlamudi. All rights reserved.
//

import UIKit

class RegisterNewAccountViewController: UIViewController {
    
  
    @IBOutlet weak var emailIDTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    
    @IBAction func registerAccountBTTN(_ sender: Any) {
        if shouldPerformSegue(withIdentifier: "newuserregistrationSegue", sender: self){
            performSegue(withIdentifier: "newuserregistrationSegue", sender: self)
        }
        else {
            let alertController = UIAlertController(title: "Message", message: "Please check the password or email that you have entered", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "newuserregistrationSegue" && passwordTF.text! == reEnterPasswordTF.text!{
            
            return dbManager.registerUser(userEmail: emailIDTF.text!, userPassword: passwordTF.text!)
        }
        else {
            return false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination as? LoginPageViewController
    }
    
//    @IBAction func cancelRegisterBTTN(_ sender: Any) {
//        self.dismiss(animated: true)
//    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    @IBAction func registerDone(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil)
//    }
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

