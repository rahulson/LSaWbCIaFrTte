//
//  AFRequestDelegate.swift
//  MultiClub
//
//  Created by Admin on 10/04/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
@objc protocol AFRequestDelegate{
    func AFRequestDidSucceed(request:AFRequest);
    func AFRequestDidFail(request:AFRequest,and error:String);
}