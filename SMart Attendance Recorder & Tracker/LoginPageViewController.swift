//
//  LoginPageViewController.swift
//  SMart Attendance Recorder & Tracker
//
//  Created by Srimat Tirumala Pallerlamudi,Aditya on 10/5/17.
//  Copyright © 2017 Aditya Srimat Tirumala Pallerlamudi. All rights reserved.
//

import UIKit

class LoginPageViewController: UIViewController {
    
    
//    @IBOutlet weak var usernameTF: UITextField!
//    @IBOutlet weak var passwordTF: UITextField!
//    @IBAction func signInBTTN(_ sender: Any) {
//        login( usernameTF.text!, passwordTF.text!)
//    }
    @IBOutlet weak var emailIDTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    var databaseManagerInstance : DatabaseManger = DatabaseManger()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tabBarController?.tabBar.isHidden = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func login(_ username:String, _ password:String) -> Void{
//        // Make sure that the username and password exist in the database
//        // If they exist, login to the user's account
//            // If logged in, then segue to main page
//        // If it doesn't exist produce a popup error that their account doesn't exist.
//            // If not logged in, then stay on page
//    }
    func dismissVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func cancel(unwindSegue: UIStoryboardSegue){
        
    }
}

