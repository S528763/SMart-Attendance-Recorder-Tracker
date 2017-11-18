//
//  DatabaseManager.swift
//  SMart Attendance Recorder & Tracker
//
//  Created by Srimat Tirumala Pallerlamudi,Aditya on 11/9/17.
//  Copyright © 2017 Aditya Srimat Tirumala Pallerlamudi. All rights reserved.
//

import Foundation

let dbManager:DatabaseManager = DatabaseManager()

class DatabaseManager {
    
    let APPLICATION_ID = "033D8EE3-DAB9-AD58-FF40-9251E379F700"
    let API_KEY = "AE53D760-B74B-A970-FFFE-EBFDD6988300"
    let SERVER_URL = "https://api.backendless.com"
    let backendless = Backendless.sharedInstance()!
    var dataStoreClass:IDataStore!
    var dataStoreSheet:IDataStore!
    
    init(){
        backendless.hostURL = SERVER_URL
        backendless.initApp(APPLICATION_ID, apiKey: API_KEY)
        dataStoreClass = backendless.data.of(ClaSS.ofClass())
        dataStoreSheet = backendless.data.of(Sheet.ofClass())
    }
    func registerUser(userEmail : String , userPassword : String, firstName : String, lastName : String) {
        // creating backendless user object
        let user = BackendlessUser()
        user.setProperty("email", object: userEmail)
        user.password = userPassword as NSString
        user.setProperty("firstName", object: firstName)
        user.setProperty("lastName", object: lastName)
        self.backendless.userService.register(user,
                                              response: {
                                                (registeredUser : BackendlessUser?) -> Void in
                                                print("User registered \(String(describing: registeredUser?.value(forKey: "email")))")
        },
                                              error: {
                                                (fault : Fault?) -> Void in
                                                print("Server reported an error: \(String(describing: fault?.description))")
        })
    }
    func loginUser (userEmail : String , userPassword : String )  -> Bool{
        var isLoggedIn : Bool = false
        self.backendless.userService.login(userEmail,
                                           password: userPassword,
                                           response: {
                                            (loggedUser : BackendlessUser?) -> Void in
                                            isLoggedIn = true
                                            print("Logged In Succesfull")
        },
                                           error: {
                                            (fault : Fault?) -> Void in
                                            isLoggedIn = false
        })
        return isLoggedIn
    }
    func forgotPassword(emailID : String){
        self.backendless.userService.restorePassword(emailID,
                                                     response: {
                                                        (result : Any) -> Void in
                                                        print("Please check your email inbox to reset your password")
        },
                                                     error: {
                                                        (fault : Fault?) -> Void in
                                                        print("Server reported an error: \(String(describing: fault?.description))")
        })
    }
}
