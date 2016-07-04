//
//  ClubManager.swift
//  MultiClub
//
//  Created by Admin on 10/04/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit
import MagicalRecord
import FastEasyMapping

var clubarray = NSMutableArray();
public typealias CompletionHandler = ((success: Bool) -> ())
public typealias ItemLoadedBlock = ((success: Bool) -> ())
public typealias SaveMemberBlock = ((success: Bool) -> ())
public typealias SaveEventRegisterBlock = ((success: Bool) -> ())
class ClubManager: NSObject,AFRequestDelegate {
    var completionblock:CompletionHandler!
    var itemLoadedBlock:ItemLoadedBlock!
    var memberSavedBlock:SaveMemberBlock!
    var eventSavedBlock:SaveEventRegisterBlock!
    class var Instance: ClubManager {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: ClubManager? = nil
        }
        
        dispatch_once(&Static.onceToken) {
            Static.instance = ClubManager()
        }
        return Static.instance!
    }
    
    func loadClubListWithblock(block:CompletionHandler){
        completionblock = block;
        let request = AFRequest(urlString: URLHelper.GETALLCLUB, andDelegate:self, andRequestMethod: RequestMethod.POST);
        request.Tag = URLHelper.GETALLCLUB;
        request.startRequest();
    }
    
    func loadEventRegisterList(club_id:Int,block:ItemLoadedBlock){
        itemLoadedBlock = block
        let urlstring:NSString = NSString(format: "%@?startPageIndex=0&pageIndex=10&sortOrder=ASC&sortBy=StartDate&clubId=%d&culture=en-US&eventSearchCriteriaName=0&searchField=dfsdfsf",URLHelper.GETEVENTREGISTERLIST,club_id);
        let request = AFRequest(urlString: urlstring, andDelegate:self, andRequestMethod: RequestMethod.POST);
        request.Tag = URLHelper.GETEVENTREGISTERLIST;
        request.startRequest();
    }
    
    func filterEventRegisterList(club_id:Int,filter_type:String,block:ItemLoadedBlock){
        itemLoadedBlock = block
        let urlstring:NSString = NSString(format: "%@?startPageIndex=0&pageIndex=10&sortOrder=ASC&sortBy=StartDate&clubId=%d&culture=en-US&eventSearchCriteriaName=%@&searchField=dfsdfsf",URLHelper.GETEVENTREGISTERLIST,club_id,filter_type);
        let request = AFRequest(urlString: urlstring, andDelegate:self, andRequestMethod: RequestMethod.POST);
        request.Tag = URLHelper.GETEVENTREGISTERLIST;
        request.startRequest();
    }
    
    func loadMemberList(event_id:Int,block:ItemLoadedBlock){
        itemLoadedBlock = block
        let urlstring:NSString = NSString(format: "%@?startPageIndex=0&pageIndex=10&sortOrder=ASC&sortBy=StartDate&EventId=%d&culture=en-US",URLHelper.GET_REGISTER_MEMBER_LIST,event_id);
        let request = AFRequest(urlString: urlstring, andDelegate:self, andRequestMethod: RequestMethod.POST);
        request.Tag = URLHelper.GET_REGISTER_MEMBER_LIST;
        request.startRequest();
    }
    
    func loadMemberByClubandEventID(event_id:Int,club_id:Int,block:ItemLoadedBlock){
        itemLoadedBlock = block
        let urlstring:NSString = NSString(format: "%@?clubId=%d&eventId=%d",URLHelper.GET_MEMBER_BY_CLUB_EVENT_ID,club_id,event_id);
        let request = AFRequest(urlString: urlstring, andDelegate:self, andRequestMethod: RequestMethod.POST);
        request.Tag = URLHelper.GET_MEMBER_BY_CLUB_EVENT_ID;
        request.startRequest();
    }
    
    func saveEventRegister(club_id:Int,event_id:Int,member_id:Int,customer_id:Int,typestr:String,value:Bool,block:SaveEventRegisterBlock){
        eventSavedBlock = block
        let str:String?
        if (value == true){
            str = "true"
        }else{
            str = "false"
        }
        let urlstring:NSString = NSString(format: "%@?id=%d&eventId=%d&memberId=%d&customerId=%d&type=%@&value=%@",URLHelper.SAVE_EVENT_REGISTER,club_id,event_id,member_id,customer_id,typestr,str!)
        let request = AFRequest(urlString: urlstring, andDelegate:self, andRequestMethod: RequestMethod.POST);
        request.Tag = URLHelper.SAVE_EVENT_REGISTER;
        request.startRequest();
    }
    func saveEventRegister(club_id:Int,event_id:Int,member_id:Int,customer_id:Int,typestr:String,comment:String,block:SaveEventRegisterBlock){
        eventSavedBlock = block
        
        
        let urlstring:NSString = NSString(format: "%@?id=%d&eventId=%d&memberId=%d&customerId=%d&type=%@&value=%@",URLHelper.SAVE_EVENT_REGISTER,club_id,event_id,member_id,customer_id,typestr,comment)
        let request = AFRequest(urlString: urlstring, andDelegate:self, andRequestMethod: RequestMethod.POST);
        request.Tag = URLHelper.SAVE_EVENT_REGISTER;
        request.startRequest();
    }
    func saveMember(event_id:Int,member_id:String,block:SaveMemberBlock){
        memberSavedBlock = block
        let account = AccountManager.Instance.activeAccount;
        let urlstring:NSString = NSString(format: "%@?eventId=%d&memberId=%@&customerId=%d",URLHelper.SAVE_MEMBER,event_id,member_id,(account?.CustomerID)!);
        let request = AFRequest(urlString: urlstring, andDelegate:self, andRequestMethod: RequestMethod.POST);
        request.Tag = URLHelper.SAVE_MEMBER;
        request.startRequest();

    }
    /*
    (http://multiclub.thinktechsys.com/Service/MobileService.svc/SaveNonMember?userId=76&firstName=SS&lastName=rr&email=ww@gmail.com&phone=12)

    */
    func saveNonMember(firstname:String,lastname:String,phone:String,email:String,block:SaveMemberBlock){
        memberSavedBlock = block
        let account = AccountManager.Instance.activeAccount;
        let urlstring:NSString = NSString(format: "%@?userId=%d&firstname=%@&lastname=%@&email=%@&phone=%@",URLHelper.SAVE_NON_MEMBER,(account?.Id)!,firstname,lastname,email,phone);
        let request = AFRequest(urlString: urlstring, andDelegate:self, andRequestMethod: RequestMethod.POST);
        request.Tag = URLHelper.SAVE_NON_MEMBER;
        request.startRequest();
        
    }
    /*
    http://multiclub.thinktechsys.com/Service/MobileService.svc/GetEventStatistics?eventId=1
    */
    func getEventStatistics(event_id:Int,block:CompletionHandler){
        completionblock = block
        let urlstring:NSString = NSString(format: "%@?eventId=%d",URLHelper.GET_EVENT_STATISTICS,event_id);
        let request = AFRequest(urlString: urlstring, andDelegate:self, andRequestMethod: RequestMethod.POST);
        request.Tag = URLHelper.GET_EVENT_STATISTICS;
        request.startRequest();
    }
    func AFRequestDidSucceed(request: AFRequest) {
        if(request.IsSuccess == true){
            let response:NSDictionary = request.serverData.dictionaryObject!
            if (request.Tag .isEqual(URLHelper.GETALLCLUB)){

            let array:NSArray? = response["GetAllClubsResult"]!["data"] as? NSArray
            clubarray = NSMutableArray();
                if(array?.count > 0 && array != nil){
            MagicalRecord.saveWithBlock({ (localContext:NSManagedObjectContext) -> Void in
                Club.MR_truncateAllInContext(localContext);
                 let arr = FEMDeserializer.collectionFromRepresentation((array as? [AnyObject])!, mapping:Club.defaultMapping(), context: localContext) as NSArray
                print(arr);
                }, completion: { (success:Bool, error:NSError?) -> Void in
                    dispatch_async(dispatch_get_main_queue()) {
                        if (self.completionblock != nil){
                            self.completionblock(success: true);
                        }
                    }
            });
                }
            }
            if(request.Tag .isEqual(URLHelper.GETEVENTREGISTERLIST)){
                let array:NSArray? = response["GetEventRegisterListResult"]!["data"] as? NSArray
                if (array?.count > 0){
                clubarray = NSMutableArray();
                
                MagicalRecord.saveWithBlock({ (localContext:NSManagedObjectContext) -> Void in
                    Event.MR_truncateAllInContext(localContext);
                    let arr = FEMDeserializer.collectionFromRepresentation((array as? [AnyObject])!, mapping:Event.defaultMapping(), context: localContext) as NSArray
                    print(arr);
                    }, completion: { (success:Bool, error:NSError?) -> Void in
                        dispatch_async(dispatch_get_main_queue()) {
                            if (self.itemLoadedBlock != nil){
                                self.itemLoadedBlock(success: true);
                            }
                        }
                });
                }else{
                    dispatch_async(dispatch_get_main_queue()) {
                        if (self.itemLoadedBlock != nil){
                            self.itemLoadedBlock(success: false);
                        }
                    }
                }
            }
            if(request.Tag .isEqual(URLHelper.GET_REGISTER_MEMBER_LIST)){
                let array:NSArray? = response["GetEventRegisterMemberListResult"]!["data"] as? NSArray
                if (array?.count > 0){
                    clubarray = NSMutableArray();
                    
                    MagicalRecord.saveWithBlock({ (localContext:NSManagedObjectContext) -> Void in
                        Member.MR_truncateAllInContext(localContext);
                        let arr = FEMDeserializer.collectionFromRepresentation((array as? [AnyObject])!, mapping:Member.defaultMapping(), context: localContext) as NSArray
                        print(arr);
                        }, completion: { (success:Bool, error:NSError?) -> Void in
                            dispatch_async(dispatch_get_main_queue()) {
                                if (self.itemLoadedBlock != nil){
                                    self.itemLoadedBlock(success: true);
                                }
                            }
                    });
                }else{
                    dispatch_async(dispatch_get_main_queue()) {
                        if (self.itemLoadedBlock != nil){
                            self.itemLoadedBlock(success: false);
                        }
                    }
                }
            }
            
            if(request.Tag .isEqual(URLHelper.GET_MEMBER_BY_CLUB_EVENT_ID)){
                let dict = response["GetMemberByClubIdAndEventIdResult"] as! NSDictionary!
                let array:NSArray? = dict["data"] as? NSArray
                if (array?.count > 0){
                    clubarray = NSMutableArray();
                    
                    MagicalRecord.saveWithBlock({ (localContext:NSManagedObjectContext) -> Void in
                        ClubMember.MR_truncateAllInContext(localContext);
                        let arr = FEMDeserializer.collectionFromRepresentation((array as? [AnyObject])!, mapping:ClubMember.defaultMapping(), context: localContext) as NSArray
                        print(arr);
                        }, completion: { (success:Bool, error:NSError?) -> Void in
                            dispatch_async(dispatch_get_main_queue()) {
                                if (self.itemLoadedBlock != nil){
                                    self.itemLoadedBlock(success: true);
                                }
                            }
                    });
                }else{
                    dispatch_async(dispatch_get_main_queue()) {
                        if (self.itemLoadedBlock != nil){
                            self.itemLoadedBlock(success: false);
                        }
                    }
                }

            }
            
            if(request.Tag.isEqual(URLHelper.SAVE_MEMBER)){
                let success = response["SaveEventFeatureResult"]!["success"] as! Bool
                if(success){
                    memberSavedBlock(success: true);
                }else{
                    memberSavedBlock(success: false);
                }
            }
            if(request.Tag.isEqual(URLHelper.SAVE_NON_MEMBER)){
                let success = response["SaveNonMemberResult"]!["success"] as! Bool
                if(success){
                    memberSavedBlock(success: true);
                }else{
                    memberSavedBlock(success: false);
                }
            }
            
            if(request.Tag.isEqual(URLHelper.SAVE_EVENT_REGISTER)){
                let success = response["SaveEventRegisterResult"]!["success"] as! Bool
                if(success){
                    eventSavedBlock(success: true);
                }else{
                    eventSavedBlock(success: false);
                }
            }
            
            if(request.Tag.isEqual(URLHelper.GET_EVENT_STATISTICS)){
                let dict = response["GetEventStatisticsResult"] as! NSDictionary!
                let array:NSArray? = dict["data"] as? NSArray
                if (array?.count > 0){
                    MagicalRecord.saveWithBlock({ (localContext:NSManagedObjectContext) -> Void in
                        EventStatistics.MR_truncateAllInContext(localContext);
                        let eventobj = FEMDeserializer.objectFromRepresentation(array?.objectAtIndex(0) as! NSDictionary as [NSObject : AnyObject], mapping:EventStatistics.defaultMapping(), context: localContext) as! EventStatistics
                        print(eventobj);
                        }, completion: { (success:Bool, error:NSError?) -> Void in
                            dispatch_async(dispatch_get_main_queue()) {
                                if (self.completionblock != nil){
                                    self.completionblock(success: true);
                                }
                            }
                    });
                }
            }
           
        }
    }
    
    func AFRequestDidFail(request: AFRequest, and error: String) {
        if (completionblock != nil){
            completionblock(success: false);
        }
    }
    
}
