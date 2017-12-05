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
    
    // User registration
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
            print(exception!)
            hasRegistered = false
        })
        return hasRegistered
    }
    
    // Login service
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
    
    // Forgot password service
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
    
    // Returns a Class with the given name - nil if not in table
    func findClass(named:String?, timing:String?) -> ClaSS? {
        if named == nil && timing == nil {
            return nil
        }
        let queryBuilder = DataQueryBuilder()
        queryBuilder!.setWhereClause("name LIKE '%\(named!)%' and classTiming LIKE '%\(timing!)%'")
        
        if let classes = self.dataStoreClass?.find(queryBuilder) {
            return classes.count > 0 ? classes[0] as? ClaSS : nil
        } else {
            return nil
        }
        
    }
    
    // Adds a Class -- only if there are no duplicates
    func addNewClass(named possibleClassName:String?, timing possibleClassTiming:String?){
        
        if findClass(named: possibleClassName, timing: possibleClassTiming) == nil {
            dataStoreClass?.save(ClaSS(name:possibleClassName!, classTiming: possibleClassTiming!),
                                 response: {(result) in NotificationCenter.default.post(name: NSNotification.Name(rawValue: "New Class Added"), object: nil)},
                                 error: {(fault:Fault?)->Void in print("\(String(describing: fault)) happened while saving a Class)")})
        }
        
    }
    
    func addNewSheet(_ newSheet:Sheet, to claSS:ClaSS) -> Void {
        self.dataStoreSheet?.save(newSheet,
                                  response: {(result:Any?)->Void in
                                    let savedSheet = result as! Sheet
                                    let _ = self.dataStoreSheet?.setRelation("claSS:ClaSS:1",
                                                                             parentObjectId: savedSheet.objectId,
                                                                             childObjects: [claSS.objectId!])
                                    let _ = self.dataStoreClass?.addRelation("sheets:Sheet:n",
                                                                             parentObjectId: claSS.objectId,
                                                                             childObjects: [savedSheet.objectId!])
                                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "New Sheet Added"), object:nil)
        },
                                  error: {(fault:Fault?)->Void in print("\(String(describing: fault)) happened while saving a Sheet)")})
        
    }
    
    // returns all sheets in the database
    func retrieveAllSheets() ->[Sheet]{
        
        let numSheetsToFetch = dataStoreSheet?.getObjectCount() as! Int
        let pageSize = 10
        let queryBuilder = DataQueryBuilder()
        var numSheetsFetched = 0
        var allSheets:[Sheet] = []
        queryBuilder!.setPageSize(Int32(pageSize)).setOffset(0)
        
        while numSheetsFetched < numSheetsToFetch {
            let sheets = self.dataStoreSheet?.find(queryBuilder) as! [Sheet]
            allSheets += sheets
            numSheetsFetched += sheets.count
            queryBuilder!.prepareNextPage()
        }
        return allSheets
    }
    
    // retrns all sheets of a specified Class
    func retrieveSheets(of ClaSS:ClaSS) -> [Sheet] {
        
        let loadRelationsQueryBuilder = LoadRelationsQueryBuilder.of(ClaSS.ofClass())
        loadRelationsQueryBuilder!.setRelationName("sheets")
        var allSheets:[Sheet] = []
        
        while true {
            // retrieve a page of relatedObjects (Sheets)
            let relatedObjects = (dataStoreClass?.loadRelations(ClaSS.objectId, queryBuilder: loadRelationsQueryBuilder))! as! [Sheet]
            if relatedObjects.count == 0 {
                break
            }
            allSheets += relatedObjects
            
            loadRelationsQueryBuilder!.prepareNextPage()
        }
        
        return allSheets
    }
    
    // returns all Counties
    func retrieveAllClasses() ->[ClaSS]{
        
        let pageSize = 10
        var numClassesFetched = 0
        var allClasses:[ClaSS] = []
        Types.tryblock(
            {   ()->Void in
                let numClassesToFetch = self.dataStoreClass?.getObjectCount() as! Int
                print(numClassesToFetch)
                
                let queryBuilder = DataQueryBuilder()
                print("Query builder idi \(queryBuilder!)")
                print("datastore class idi \(self.dataStoreClass?.find(queryBuilder) )")
                queryBuilder!.setPageSize(Int32(pageSize)).setOffset(0)
                
                
                while(numClassesFetched < numClassesToFetch) {
                    print("while loop lo ki vachindi")
                    let classes = self.dataStoreClass?.find(queryBuilder) as! [ClaSS]
                    print(classes)
                    allClasses += classes
                    numClassesFetched += classes.count
                    queryBuilder!.prepareNextPage()
                }
        },catchblock:{(fault)->Void in print("Problem retrieving all classes: \(String(describing: fault))")}
        )
        return allClasses
    }
    
    // Delete data i.e. Classes and Sheets asynchronously
    func clearDatabase(){
        Types.tryblock(
            { ()->Void in
                let dispatchQueue = DispatchQueue(label: "clearer", qos:.utility)
                dispatchQueue.async { self.clearDatabaseSynchronously() }
        },catchblock:{(fault)->Void in print("Problem clearing database: \(String(describing: fault))")}
        )
    }
    
    // clears the database
    func clearDatabaseSynchronously(){
        // clear sheets first
        let allSheets = self.retrieveAllSheets()
        for sheet in allSheets {
            let dateStampRemoved = self.dataStoreSheet?.remove(sheet)
            print("Removing sheet ... date stamped removed: \(String(describing: dateStampRemoved))")
        }
        
        let allClasses = self.retrieveAllClasses()
        for claSS in allClasses {
            let dateStampRemoved = self.dataStoreClass?.remove(claSS)
            print("Removing class ... date stamped removed: \(String(describing: dateStampRemoved))")
        }
    }
    
    // updates the Sheet
    func updateSheet(_ sheet:Sheet){
        let _ = dataStoreSheet?.save(sheet) as! Sheet
    }
    
    // updates a Class
    func updateClass(_ claSS:ClaSS){
        let _ = dataStoreClass?.save(claSS) as! ClaSS
    }
    
}
