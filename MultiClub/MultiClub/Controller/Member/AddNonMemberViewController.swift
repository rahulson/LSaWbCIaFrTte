//
//  AddNonMemberViewController.swift
//  MultiClub
//
//  Created by Admin on 27/06/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit
import SVProgressHUD
class AddNonMemberViewController: UIViewController {
    @IBOutlet var txtFirstName:UITextField!;
    @IBOutlet var txtLastName:UITextField!;
    @IBOutlet var txtEmail:UITextField!;
    @IBOutlet var txtPhoneNumber:UITextField!;
    
    class func initViewControler() -> AddNonMemberViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("AddNonMemberViewController") as! AddNonMemberViewController
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add non-member"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnSubmitClicked(sender: UIButton) {
         var message : String = "";
        if(txtFirstName.text?.isEmpty == true){
            message = "Please enter firstname.";
        }else if(txtLastName.text?.isEmpty == true){
            message = "Please enter lastname.";
        }else if(txtEmail.text?.isEmpty == true){
            message = "Please enter email.";
        }else if(txtPhoneNumber.text?.isEmpty == true){
            message = "Please enter phonenumber.";
        }
        
        if(message.characters.count > 0){
            let alert = UIAlertView(title: "Alert" as String, message:message, delegate: nil, cancelButtonTitle: "Ok")
            alert.show()
            return;
        }else{
            SVProgressHUD.showInfoWithStatus("Saving non-member...");
            ClubManager.Instance.saveNonMember(txtFirstName.text!, lastname:txtLastName.text!, phone: txtPhoneNumber.text!, email: txtEmail.text!, block: { (success) -> () in
                SVProgressHUD.dismiss();
                if(success){
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.showAlertMessage("Member added successfully");
                    })

                }
            })
            
        }

    }
    
    func showAlertMessage(message:String){
        let actionSheetController: UIAlertController = UIAlertController(title: "Alert", message:message, preferredStyle: .Alert)
        
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
