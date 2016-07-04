//
//  URLSchemea.swift
//  MultiClub
//
//  Created by Admin on 10/04/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
/*
http://multiclub.thinktechsys.com/Service/MobileService.svc/SaveEventRegister?id=2&eventId=19&memberId=57&customerId=0&type=isleave&value=true

static let BASE_URL = "http://multiclubs.azurewebsites.net/Service/MobileService.svc"
*/
struct URLHelper {
    static let BASE_URL = "http://multiclub.thinktechsys.com/Service/MobileService.svc"
    static let LOGIN = "validateuser"
    static let GETALLCLUB = "GetAllClubs"
    static let GETEVENTREGISTERLIST = "GetEventRegisterList"
    static let GET_REGISTER_MEMBER_LIST = "GetEventRegisterMemberList"
    static let SAVE_MEMBER = "SaveEventFeature"
    static let SAVE_NON_MEMBER = "SaveNonMember"
    static let GET_EVENT_STATISTICS = "GetEventStatistics"
    static let GET_MEMBER_BY_CLUB_EVENT_ID = "GetMemberByClubIdAndEventId"
    static let SAVE_EVENT_REGISTER = "SaveEventRegister"
}