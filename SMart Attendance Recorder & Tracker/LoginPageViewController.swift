//
//  LoginPageViewController.swift
//  SMart Attendance Recorder & Tracker
//
//  Created by Srimat Tirumala Pallerlamudi,Aditya on 10/5/17.
//  Copyright © 2017 Aditya Srimat Tirumala Pallerlamudi. All rights reserved.
//

import UIKit

class LoginPageViewController: UIViewController {
    
    @IBOutlet weak var emailIDTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBAction func signIn(_ sender: Any) {
        if shouldPerformSegue(withIdentifier: "loginSegue", sender: self) {
            performSegue(withIdentifier: "loginSegue", sender: self)
        }
        else {
            let alertController = UIAlertController(title: "Oops!", message: "Login unsucessful, Please try again.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func newUserRegistration(_ sender: Any) {
        if shouldPerformSegue(withIdentifier: "registrationSegue", sender: self){
            performSegue(withIdentifier: "registrationSegue", sender: self)
        }
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
        if shouldPerformSegue(withIdentifier: "forgotpasswordSegue", sender: self){
            performSegue(withIdentifier: "forgotpasswordSegue", sender: self)
        }
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "loginSegue" {
            return dbManager.loginUser(userEmail: emailIDTF.text!, userPassword: passwordTF.text!)
        }
        else if identifier == "registrationSegue"{
            return true
        }
        else if identifier == "forgotpasswordSegue" {
            return true
        }
        else {
            return false
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginSegue"{
            _ = segue.destination as? ClassesTableViewController
        }
        else if segue.identifier == "newuserregistrationSegue" {
            _ =  segue.destination as? RegisterNewAccountViewController
        }
        else if segue.identifier == "forgotpasswordSegue" {
            _ = segue.destination as? ForgotPasswordViewController
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tabBarController?.tabBar.isHidden = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    
//    @IBAction func alertForInvalidSignIn(_ sender: UIButton) {
//        let alert = UIAlertController(title: "Oops!", message: "You havn't entered a valid value, Please try again.", preferredStyle: UIAlertControllerStyle.alert)
//
//        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
//
//        self.present(alert, animated: true, completion: nil)
//    }

//    func login(_ username:String, _ password:String) -> Void{
//        // Make sure that the username and password exist in the database
//        // If they exist, login to the user's account
//            // If logged in, then segue to main page
//        // If it doesn't exist produce a popup error that their account doesn't exist.
//            // If not logged in, then stay on page
//    }
//    func dismissVC(_ sender: Any) {
//        dismiss(animated: true, completion: nil)
//    }
    
    @IBAction func cancel(unwindSegue: UIStoryboardSegue){
        
    }
}

