//
//  AccountAuthenticateDelegate.swift
//  MultiClub
//
//  Created by Admin on 10/04/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

protocol AccountAuthenticateDelegate
{
    func accountDidSucceedAuthentication(account : Account)
    
    func accountDidFailedAuthentication(error : NSString)
    
    
}