//
//  NSManagedObject+Mapping.swift
//  MultiClub
//
//  Created by Admin on 11/04/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import CoreData
import FastEasyMapping
extension NSManagedObject{
    /*
    + (FEMAttribute*) intAttributeFor:(NSString*)property andKeyPath:(NSString*)keyPath
    {
    FEMAttribute *attr = [[FEMAttribute alloc] initWithProperty:property keyPath:keyPath map:^id(id value) {
    if ([value isKindOfClass:[NSString class]]) {
    return [NSNumber numberWithInt:[value floatValue]];
    }
    return value;
    } reverseMap:^id(id value) {
    return [NSString stringWithFormat:@"%d", [value intValue]];
    }];
    return attr;
    }
*/
    class func intAttributeFor(property:NSString,keypath:NSString) -> FEMAttribute{
       
        let attr = FEMAttribute.init(property: property as String, keyPath: keypath as String, map: { (value:AnyObject) -> AnyObject? in
             print(property)
            if (value.isKindOfClass(NSString)){
                return NSNumber(integer:Int(value as! NSNumber));
            }
            return value;
            }) { (value:AnyObject) -> AnyObject? in
                return NSString(format: "%d",Int(value as! NSNumber));
        }
        
     return attr;
    }
    
    class func boolAttributeFor(property:NSString,keypath:NSString) -> FEMAttribute{
        let attr = FEMAttribute.init(property: property as String, keyPath: keypath as String, map: { (value:AnyObject) -> AnyObject? in
            if (value.isKindOfClass(NSString)){
                return NSNumber(bool: Bool(value as! NSNumber));
            }
            return value;
            }) { (value:AnyObject) -> AnyObject? in
                return NSString(format: "%d",Bool(value as! NSNumber));
        }
        
        return attr;
    }
    
}