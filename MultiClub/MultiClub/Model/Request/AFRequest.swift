//
//  AFRequest.swift
//  MultiClub
//
//  Created by Admin on 10/04/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

enum RequestMethod:Int{
    case GET = 0,
    POST = 1,
    PUT = 2,
    DELETE = 3
}
class AFRequest: NSObject {
    var delegate:AFRequestDelegate!
    var urlPart:NSString!
    var post_params:[String: AnyObject]!
    var methodType:RequestMethod!
    var serverData:JSON!
    var rawResponse:NSString!
    var IsSuccess:Bool!
    var StatusCode:NSInteger!
    var Tag:NSString!
    
    
    
    init(urlString:NSString,andDelegate del:AFRequestDelegate,andRequestMethod method:RequestMethod){
        urlPart = NSString(format:"%@/%@",URLHelper.BASE_URL,urlString);
        methodType = method;
        delegate = del;
    }
    
    func setParameters(parameters:[String: AnyObject]){
        post_params = parameters
    }
    
    
    func startRequest(){
        
        let urlstring:String = urlPart as String!
        if (methodType == RequestMethod.GET){
            AFRequestManager.sharedInstance.requestManager().request(.GET,urlstring, parameters:nil, encoding:.JSON, headers: nil).responseJSON { response in
                    
                self.StatusCode = response.response?.statusCode
                self.IsSuccess = response.result.isSuccess
                if let value: AnyObject = response.result.value {
                    // handle the results as JSON, without a bunch of nested if loops
                    self.serverData = JSON(value)}
                let jsondict = self.serverData.dictionary
                print(jsondict);
                if response.result.isSuccess {
                    self.requestSuccessed()
                }else{
                    let error = response.result.error
                    self.requestFailed(error!)
                }
            }
        }
        else if(methodType == RequestMethod.POST){
            
            AFRequestManager.sharedInstance.requestManager().request(.POST,urlstring, parameters:post_params, encoding:.URL, headers: nil).responseJSON { response in
                self.StatusCode = response.response?.statusCode
                self.IsSuccess = response.result.isSuccess
                if let value: AnyObject = response.result.value {
                    // handle the results as JSON, without a bunch of nested if loops
                    self.serverData = JSON(value)}
                //let jsondict = self.serverData.dictionary
                //print(jsondict);
                if (response.result.isSuccess == true) {
                    self.requestSuccessed()
                }else{
                    let error = response.result.error
                    self.requestFailed(error!)
                }
            }
            
        }
        else if(methodType == RequestMethod.PUT){
            
            AFRequestManager.sharedInstance.requestManager().request(.PUT,urlstring, parameters:post_params, encoding:.URL, headers: nil).responseJSON { response in
                self.StatusCode = response.response?.statusCode
                self.IsSuccess = response.result.isSuccess
                if let value: AnyObject = response.result.value {
                    // handle the results as JSON, without a bunch of nested if loops
                    self.serverData = JSON(value)}
                
                if response.result.isSuccess {
                    self.requestSuccessed()
                }else{
                    let error = response.result.error
                    self.requestFailed(error!)
                }
            }
            
        }
        else{
            AFRequestManager.sharedInstance.requestManager().request(.DELETE,urlstring, parameters:post_params, encoding:.URL, headers: nil).responseJSON { response in
                self.StatusCode = response.response?.statusCode
                self.IsSuccess = response.result.isSuccess
                if let value: AnyObject = response.result.value {
                    // handle the results as JSON, without a bunch of nested if loops
                    self.serverData = JSON(value)}
                if response.result.isSuccess {
                    self.requestSuccessed()
                }else{
                    let error = response.result.error
                    self.requestFailed(error!)
                }
            }
        }
    }
    
    func requestSuccessed()
    {
        self.delegate.AFRequestDidSucceed(self)
    }
    
    func requestFailed(error:NSError)
    {
        self.delegate.AFRequestDidFail(self, and: error.localizedDescription)
    }
}
