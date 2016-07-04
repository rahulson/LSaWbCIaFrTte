//
//  CDHelper.swift
//  MultiClub
//
//  Created by Admin on 11/04/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class CDHelper: NSObject {
    class func mappingforclass(cls:AnyClass)->NSDictionary {
        var myDict: NSDictionary?
        var resultDict:NSDictionary?
        if let path = NSBundle.mainBundle().pathForResource("Mapping", ofType: "plist") {
            myDict = NSDictionary(contentsOfFile: path)
            let classString = NSStringFromClass(cls)
            resultDict = myDict?.objectForKey(classString) as? NSDictionary;
        }
        return resultDict!
    }
}
