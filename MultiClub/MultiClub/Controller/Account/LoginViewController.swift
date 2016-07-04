//
//  LoginViewController.swift
//  MultiClub
//
//  Created by Admin on 10/04/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit
import SVProgressHUD
class LoginViewController: UIViewController,AccountAuthenticateDelegate {
    @IBOutlet var txtEmail:UITextField!;
    @IBOutlet var txtPassword:UITextField!;
    override func viewDidLoad() {
        super.viewDidLoad()
        txtEmail.text = "mrp@starbritestudios.co.uk";
        txtPassword.text = "P@55w0rd";
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    class func initViewControler() -> LoginViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("LoginViewController") as! LoginViewController
        return vc
    }
    
    @IBAction func btnLoginClicked(sender: UIButton) {
        var message : String = "";
       
        if(txtEmail.text?.isEmpty == true){
            message = "Please enter email.";
        }else if(txtPassword.text?.isEmpty == true){
            message = "Please enter password.";
        }
        if(message.characters.count > 0){
            let alert = UIAlertView(title: "Alert" as String, message:message, delegate: nil, cancelButtonTitle: "Ok")
            alert.show()
            return;
        }
         if (AppDelegate.appdelegate().isReachable()){
        let account = Account ()
            SVProgressHUD.showInfoWithStatus("Logging In...")
            account.authenticateUserWithDelegate(self, uname: txtEmail.text!, password:txtPassword.text!)}
         else{
            let actionSheetController: UIAlertController = UIAlertController(title: "Alert", message: "Internet Connection not available", preferredStyle: .Alert)
            
            //Create and add the Cancel action
            let cancelAction: UIAlertAction = UIAlertAction(title: "Ok", style: .Cancel) { action -> Void in
                //Do some stuff
            }
            actionSheetController.addAction(cancelAction)
            //Create and an option action
           
            //Add a text field
            
            //Present the AlertController
            self.presentViewController(actionSheetController, animated: true, completion: nil)
        }
    }
    
    func accountDidSucceedAuthentication(account: Account) {
        SVProgressHUD.dismiss()
        AccountManager.Instance.activeAccount = account ;
        NSNotificationCenter.defaultCenter().postNotificationName(Constant.LOGIN_SUCCESSFUL, object: nil)
        AppDelegate.appdelegate().userdidlogin()
    }
    
    func accountDidFailedAuthentication(error: NSString) {
        SVProgressHUD.dismiss()
        let actionSheetController: UIAlertController = UIAlertController(title: "Alert", message:error as String, preferredStyle: .Alert)
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Ok", style: .Cancel) { action -> Void in
            //Do some stuff
        }
        actionSheetController.addAction(cancelAction)
        self.presentViewController(actionSheetController, animated: true, completion: nil)
    }
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
