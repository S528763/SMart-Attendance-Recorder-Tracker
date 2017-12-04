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
    func registerUser(userEmail : String , userPassword : String) -> Bool {
        // creating backendless user object
        var hasRegistered : Bool = false
        let user = BackendlessUser()
        user.setProperty("email", object: userEmail)
        user.password = userPassword as NSString
        Types.tryblock({() -> Void in
            self.backendless.userService.register(user)
            hasRegistered = true
        }, catchblock: {(exception)->Void in
            print(exception)
            hasRegistered = false
        })
        return hasRegistered
    }
    func loginUser (userEmail : String , userPassword : String )  -> Bool {
        var isLoggedIn : Bool = false
        Types.tryblock({ () -> Void in
            
            self.backendless.userService.login(userEmail, password: userPassword)
            
            isLoggedIn = true
            
            
        },
                       catchblock: { (exception) -> Void in
                        isLoggedIn = false
                        
        })
        
        
        return isLoggedIn
    }
    func forgotPassword(emailID : String) -> Bool {
        var hasSentMail : Bool = false
        
        Types.tryblock({()-> Void in
            self.backendless.userService.restorePassword(emailID)
            hasSentMail = true
        }, catchblock: {(exception)->Void in
            hasSentMail = false
        }
            
        )
        return hasSentMail
    }
}
