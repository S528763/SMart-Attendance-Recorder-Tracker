//
//  LoginPageViewController.swift
//  SMart Attendance Recorder & Tracker
//
//  Created by Srimat Tirumala Pallerlamudi,Aditya on 10/5/17.
//  Copyright © 2017 Aditya Srimat Tirumala Pallerlamudi. All rights reserved.
//

import UIKit

class LoginPageViewController: UIViewController {
    
    @IBOutlet weak var signInBTN: UIButton!
    
//    @IBAction func signIn(_ sender: Any) {
//        let  navController = self.tabBarController?.viewControllers![1] as! UINavigationController
//        ///secondviewcontroller in your case is cart
//        let secondViewController = navController.viewControllers[0] as! HomePageViewController
//        //set values you want to pass
//        //lets say I want to pass name to secondVC
//        secondViewController.title = "ABCD"
//        
//        self.tabBarController?.selectedIndex = 1
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tabBarController?.tabBar.isHidden = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

