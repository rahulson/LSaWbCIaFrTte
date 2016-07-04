//
//  AFRequestManager.swift
//  MultiClub
//
//  Created by Admin on 10/04/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit
import Alamofire
import netfox
 var manager:Alamofire.Manager!
class AFRequestManager: NSObject {
   
    class var sharedInstance: AFRequestManager {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: AFRequestManager? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = AFRequestManager()
        }
        return Static.instance!
    }
    
    
    func requestManager()->Alamofire.Manager{
        if (manager == nil){
            let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
            configuration.protocolClasses?.insert(NFXProtocol.self, atIndex: 0)
            configuration.HTTPAdditionalHeaders = Alamofire.Manager.defaultHTTPHeaders
            manager = Alamofire.Manager(configuration: configuration)
            
        }
        return manager
    }
    //var constant:GlobalConstants!
}
