//
//  AccountManager.swift
//  MultiClub
//
//  Created by Admin on 10/04/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class AccountManager: NSObject {
    var kActiveUserKey:String = "EncodedActiveFieldworkUser";
    
    private var _activeAccount:Account? = nil;
    
    var activeAccount:Account? {
        set(newacc){
            self._activeAccount = newacc;
            self.saveAccount();
        }
        get{
            return self._activeAccount;
        }
    };
    var savedAccounts:NSMutableDictionary = NSMutableDictionary();
    
    class var Instance: AccountManager {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: AccountManager? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = AccountManager()
        }
        return Static.instance!
    }
    
    
    override init() {
        
        super.init()
        
        let accountData:NSData? = NSUserDefaults.standardUserDefaults().objectForKey(kActiveUserKey) as! NSData?;
        if(accountData != nil)
        {
            activeAccount = (NSKeyedUnarchiver.unarchiveObjectWithData(accountData!) as! Account);
        }
        
        let path:String = accountFileName();
        if(NSFileManager.defaultManager().fileExistsAtPath(path) == false)
        {
            return;
        }
        
        savedAccounts = NSKeyedUnarchiver.unarchiveObjectWithFile(accountFileName()) as! NSMutableDictionary;
        if (savedAccounts is NilLiteralConvertible)
        {
            self.savedAccounts = NSMutableDictionary();
        }
    }
    
    func accountFileName() -> String
    {
        let doc_path: NSArray = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true);
        return doc_path[0].stringByAppendingPathComponent("ShareventAccount.dat")
    }
    
    
    func saveAccounts() -> Void
    {
        NSKeyedArchiver .archiveRootObject(savedAccounts, toFile: self.accountFileName());
    }
    
    func saveAccount() -> Void
    {
        var data:NSData? = nil;
        if(activeAccount != nil){
            data = NSKeyedArchiver.archivedDataWithRootObject(activeAccount!);
        }
        if(data != nil){
            NSUserDefaults.standardUserDefaults().setObject(data, forKey: kActiveUserKey);
        }else{
            NSUserDefaults.standardUserDefaults().removeObjectForKey(kActiveUserKey);
        }
        
        if(activeAccount != nil){
            savedAccounts.setObject(activeAccount!, forKey: activeAccount!.Email!);
            self.saveAccounts();
        }
    }
}
