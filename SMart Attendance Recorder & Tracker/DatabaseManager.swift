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
    var dataStoreClasses:IDataStore!
    var dataStoreSheets:IDataStore!
    
    
    init(){
        backendless.hostURL = SERVER_URL
        backendless.initApp(APPLICATION_ID, apiKey: API_KEY)
        //        dataStoreClasses = backendless.data.of(County.ofClass())
        //        dataStoreBird = backendless.data.of(Bird.ofClass())
    }
}
