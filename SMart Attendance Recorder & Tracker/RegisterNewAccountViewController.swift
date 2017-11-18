//
//  RegisterNewAccountViewController.swift
//  SMart Attendance Recorder & Tracker
//
//  Created by Chris Moody  on 10/20/17.
//  Copyright © 2017 Aditya Srimat Tirumala Pallerlamudi. All rights reserved.
//

import UIKit

class RegisterNewAccountViewController: UIViewController {
    
//    let questions = ["What is your favorite color?", "What city were you born in?", "What was your pets first name?", "What is your favorite movie?", "What was the color of your first car?", "What is your favorite team?", "In what town was your first job?", "Where did you attend high  school?"]
//
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return questions[row]
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return questions.count
//    }
//
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        //Save the chosen question to the database here...
//    }
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//        var pickerLabel = view as? UILabel;
//        if (pickerLabel == nil){
//            pickerLabel = UILabel()
//            pickerLabel?.font = UIFont(name: "Montserrat", size: 10)
//        }
//        pickerLabel?.text = questions[row]
//
//        return pickerLabel!;
//    }
    
    //outlets
    @IBOutlet weak var emailIDTF: UITextField!
//    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
//    @IBOutlet weak var pickerView: UIPickerView!
    var databaseManagerInstance : DatabaseManager = DatabaseManager()
    
    @IBAction func registerAccountBTTN(_ sender: Any) {
        //Create an instance of a new account with DATABASE MANAGER
        databaseManagerInstance.registerUser(userEmail: emailIDTF.text!, userPassword: passwordTF.text!)
         self.dismiss(animated: true)
    }
//    @IBAction func cancelRegisterBTTN(_ sender: Any) {
//        self.dismiss(animated: true)
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

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

