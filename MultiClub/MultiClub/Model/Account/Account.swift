//
//  Account.swift
//  MultiClub
//
//  Created by Admin on 10/04/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit
public typealias AccountHandler = ((success: Bool,error:String) -> ())
class Account: NSObject,NSCoding,AFRequestDelegate {
    var accountloadedblock:AccountHandler!
/*
    "Active": true
    "AdminComment": ""
    "AffiliateId": 0
    "CreatedOnUtc": "/Date(1441823662623-0700)/"
    "CustomerGuid": "942e2aa6-510b-4837-ace8-fd1793359343"
    "CustomerID": 0
    "DateOfBirth": null
    "Deleted": false
    "Email": "admin@multiclubs.com"
    "FirstName": "John"
    "HasShoppingCartItems": false
    "Id": 1
    "IsSystemAccount": false
    "IsTaxExempt": false
    "LastActivityDateUtc": "/Date(1458337321643-0700)/"
    "LastIpAddress": "127.0.0.1"
    "LastLoginDateUtc": "/Date(1458337054973-0700)/"
    "LastName": "Smith"
    "Name": null
    "Password": "4979B76FA83268C05FAD40D6077CB1986CC60EFD"
    "PasswordFormat": 1
    "PasswordFormatId": 1
    "PasswordSalt": "95v1LTo="
    "Phone": null
    "c": ""
    "Username": "admin@multiclubs.com"
    "c": 0
    "XeroCustomerId": null
    "XeroStatus": 0
*/
    let ENCODING_VERSION:Int? = 1;
    var Active:Int? = 0;
    var AdminComment:String? = "";
    var AffiliateId:Int? = 0;
    var CreatedOnUtc:String? = "";
    var CustomerGuid:String? = "";
    var CustomerID:Int? = 0;
    var DateOfBirth:String? = "";
    var Deleted:Bool? = false;
    var Email:String? = "";
    var FirstName:String? = "";
    var HasShoppingCartItems:Bool? = false;
    var Id:Int? = 0;
    var LastIpAddress:String? = "";
    var IsSystemAccount:Bool? = false;
    var IsTaxExempt:Bool? = false;
    var LastActivityDateUtc:String? = "";
    var LastLoginDateUtc:String? = "";
    var LastName:String? = "";
    var Name:String? = "";
    var SystemName:String? = "";
    var VendorId:Int? = 0;
    var Password:String? = "";
    var PasswordFormat:Int? = 0;
    var PasswordFormatId:Int? = 0;
    var PasswordSalt:String? = "";
    var Phone:String? = "";
    var Username:String? = "";
    var XeroCustomerId:Int? = 0;
    var XeroStatus:Int? = 0;
    var delegate:AccountAuthenticateDelegate!
    override init() {
    }
    
    func encodeWithCoder(aCoder: NSCoder)
    {
        aCoder.encodeInteger(ENCODING_VERSION!, forKey: "version");
        aCoder.encodeObject(Active, forKey: "Active");
        aCoder.encodeObject(AdminComment, forKey: "AdminComment");
        aCoder.encodeObject(AffiliateId, forKey: "AffiliateId");
        aCoder.encodeObject(CreatedOnUtc, forKey: "CreatedOnUtc");
        aCoder.encodeObject(CustomerGuid, forKey: "CustomerGuid");
        aCoder.encodeObject(Email, forKey: "Email");
        aCoder.encodeObject(FirstName, forKey: "FirstName");
        aCoder.encodeObject(LastName, forKey: "LastName");
        aCoder.encodeObject(CustomerID, forKey: "CustomerID");
        aCoder.encodeObject(DateOfBirth, forKey: "DateOfBirth");
        aCoder.encodeObject(Deleted, forKey: "Deleted");
        aCoder.encodeObject(HasShoppingCartItems, forKey: "HasShoppingCartItems");
        aCoder.encodeObject(Id, forKey: "Id");
        aCoder.encodeObject(IsSystemAccount, forKey: "IsSystemAccount");
        aCoder.encodeObject(IsTaxExempt, forKey: "IsTaxExempt");
        aCoder.encodeObject(LastActivityDateUtc, forKey: "LastActivityDateUtc");
        aCoder.encodeObject(LastIpAddress, forKey: "LastIpAddress");
        aCoder.encodeObject(LastLoginDateUtc, forKey: "LastLoginDateUtc");
        aCoder.encodeObject(Name, forKey: "Name");
        aCoder.encodeObject(Password, forKey: "Password");
        aCoder.encodeObject(PasswordFormat, forKey: "PasswordFormat");
        aCoder.encodeObject(PasswordFormatId, forKey: "PasswordFormatId");
        aCoder.encodeObject(PasswordSalt, forKey: "PasswordSalt");
        aCoder.encodeObject(SystemName, forKey: "SystemName");
        aCoder.encodeObject(VendorId, forKey: "VendorId");
        aCoder.encodeObject(Phone, forKey: "Phone");
        aCoder.encodeObject(Username, forKey: "Username");
        aCoder.encodeObject(XeroCustomerId, forKey: "XeroCustomerId");
        aCoder.encodeObject(XeroStatus, forKey: "XeroStatus");
        
    }
    required init(coder aDecoder: NSCoder)
    {
        if(aDecoder.decodeIntegerForKey("version") == ENCODING_VERSION)
        {
           
            
            Active = aDecoder.decodeObjectForKey("Active") as? Int;
            AdminComment = aDecoder.decodeObjectForKey("AdminComment") as? String;
            AffiliateId = aDecoder.decodeObjectForKey("AffiliateId") as? Int;
            CreatedOnUtc = aDecoder.decodeObjectForKey("CreatedOnUtc") as? String;
            CustomerGuid = aDecoder.decodeObjectForKey("CustomerGuid") as? String;
            Email = aDecoder.decodeObjectForKey("Email") as? String;
            FirstName = aDecoder.decodeObjectForKey("FirstName") as? String;
            LastName = aDecoder.decodeObjectForKey("LastName") as? String;
            CustomerGuid = aDecoder.decodeObjectForKey("CustomerGuid") as? String;
            CustomerID = aDecoder.decodeObjectForKey("CustomerID") as? Int;
            DateOfBirth = aDecoder.decodeObjectForKey("DateOfBirth") as? String;
            Deleted = aDecoder.decodeObjectForKey("Deleted") as? Bool;
            HasShoppingCartItems = aDecoder.decodeObjectForKey("HasShoppingCartItems") as? Bool;
            Id = aDecoder.decodeObjectForKey("Id") as? Int;
            IsSystemAccount = aDecoder.decodeObjectForKey("IsSystemAccount") as? Bool;
            IsTaxExempt = aDecoder.decodeObjectForKey("IsTaxExempt") as? Bool;
            LastActivityDateUtc = aDecoder.decodeObjectForKey("LastActivityDateUtc") as? String;
            LastIpAddress = aDecoder.decodeObjectForKey("LastIpAddress") as? String;
            LastLoginDateUtc = aDecoder.decodeObjectForKey("LastLoginDateUtc") as? String;
            Name = aDecoder.decodeObjectForKey("Name") as? String;
            Password = aDecoder.decodeObjectForKey("Password") as? String;
            SystemName = aDecoder.decodeObjectForKey("SystemName") as? String;
            PasswordFormat = aDecoder.decodeObjectForKey("PasswordFormat") as? Int;
            VendorId = aDecoder.decodeObjectForKey("VendorId") as? Int;
            PasswordSalt = aDecoder.decodeObjectForKey("PasswordSalt") as? String;
            Phone = aDecoder.decodeObjectForKey("Phone") as? String;
            Username = aDecoder.decodeObjectForKey("Username") as? String;
            XeroCustomerId = aDecoder.decodeObjectForKey("XeroCustomerId") as? Int;
            XeroStatus = aDecoder.decodeObjectForKey("XeroStatus") as? Int;
        }
    }
    
    func authenticateUserWithDelegate(del : AccountAuthenticateDelegate, uname : String, password: String) -> Void {
        delegate = del;
        let loginUrl:NSString = NSString(format: "%@?Username=%@&password=%@",URLHelper.LOGIN,uname,password);
        let request = AFRequest(urlString: loginUrl, andDelegate:self, andRequestMethod: RequestMethod.POST);
        request.Tag = URLHelper.LOGIN;
        request.startRequest();
    }
    func authenticateUserWithDelegate(uname : String, password: String,block:AccountHandler) -> Void {
        accountloadedblock = block;
        let loginUrl:NSString = NSString(format: "%@?Username=%@&password=%@",URLHelper.LOGIN,uname,password);
        let request = AFRequest(urlString: loginUrl, andDelegate:self, andRequestMethod: RequestMethod.POST);
        request.Tag = URLHelper.LOGIN;
        request.startRequest();
    }
    
    func AFRequestDidSucceed(request: AFRequest) {
        if (request.IsSuccess == true){
  
            if let response:NSArray = request.serverData["ValidateUserResult"]["data"].arrayObject{
            if(response.count > 0){
            let dict = response.objectAtIndex(0) as! NSDictionary;
            
                self.Active = dict["Active"] as? Int;
                self.Phone = dict["Phone"] as? String;
                self.AdminComment = dict["AdminComment"] as? String;
                self.AffiliateId = dict["AffiliateId"] as? Int;
                self.CreatedOnUtc = dict["CreatedOnUtc"] as? String;
                self.CustomerGuid = dict["CustomerGuid"] as? String;
                self.CustomerID = dict["CustomerID"] as? Int;
                self.DateOfBirth = dict["DateOfBirth"] as? String;
                self.Deleted = dict["Deleted"] as? Bool;
                self.FirstName = dict["FirstName"] as? String;
                self.Email = dict["Email"] as? String;
                self.HasShoppingCartItems = dict["HasShoppingCartItems"] as? Bool;
                self.Id = dict["Id"] as? Int;
                self.IsSystemAccount = dict["IsSystemAccount"] as? Bool;
                self.IsTaxExempt = dict["IsTaxExempt"] as? Bool;
                self.LastActivityDateUtc = dict["LastActivityDateUtc"] as? String;
                self.LastIpAddress = dict["LastIpAddress"] as? String
                self.LastLoginDateUtc = dict["LastLoginDateUtc"] as? String
                self.LastName = dict["LastName"] as? String;
                self.Name = dict["Name"] as? String;
                self.Password = dict["Password"] as? String;
                self.PasswordFormat = dict["PasswordFormat"] as? Int;
                self.PasswordSalt = dict["PasswordSalt"] as? String;
                self.SystemName = dict["SystemName"] as? String;
                self.Username  = dict["Username"] as? String;
                self.VendorId = dict["VendorId"] as? Int;
                self.XeroCustomerId = dict["XeroCustomerId"] as? Int;
                self.XeroStatus = dict["XeroStatus"] as? Int;
            
            delegate?.accountDidSucceedAuthentication(self);
            }
            }else{
//                if((accountloadedblock) != nil){
                    let str = request.serverData["ValidateUserResult"]["result"].string;
                    delegate?.accountDidFailedAuthentication(str!);
                    //accountloadedblock(success: true,error: str!)
               // }
            }
        }
    }
    
    func AFRequestDidFail(request: AFRequest, and error: String) {
        delegate?.accountDidFailedAuthentication(error);
    }
}
