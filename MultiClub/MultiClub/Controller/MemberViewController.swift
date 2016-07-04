//
//  MemberViewController.swift
//  MultiClub
//
//  Created by Admin on 13/04/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit
import CZPicker
import SVProgressHUD
class MemberViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,CZPickerViewDelegate,CZPickerViewDataSource,CommentViewDelegate {
    @IBOutlet var tableView:UITableView?
    @IBOutlet var txtArrived:UITextField!
    @IBOutlet var txtLeft:UITextField!
    @IBOutlet var txtRegistered:UITextField!
    var memberarray = NSMutableArray();
    var clubmemberarray = NSMutableArray();
    var event_id:Int?;
    var club_id:Int?;
    var currentPosition:Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationItem();
        self.loadClubMemberList()
                // Do any additional setup after loading the view.
    }

    func loadClubMemberList(){
        
        ClubManager.Instance.loadMemberList(event_id!) { (success) -> () in
            if(success == true){
                self.memberarray = NSMutableArray();
                self.memberarray = Member.getAll();
                
            }else{
                self.memberarray = NSMutableArray();
                let actionSheetController: UIAlertController = UIAlertController(title: "Alert", message: "Event Members not found.Please add Members to the Event.", preferredStyle: .Alert)
                
                //Create and add the Cancel action
                let cancelAction: UIAlertAction = UIAlertAction(title: "Ok", style: .Cancel) { action -> Void in
                    
                }
                actionSheetController.addAction(cancelAction)
                //Create and an option action
                
                //Add a text field
                
                //Present the AlertController
                self.presentViewController(actionSheetController, animated: true, completion: nil)
            }
            ClubManager.Instance.loadMemberByClubandEventID(self.event_id!, club_id: self.club_id!, block: { (success) -> () in
                if (success){
                    self.clubmemberarray = ClubMember.getAll()
                    
                }
                ClubManager.Instance.getEventStatistics(self.event_id!, block: { (success) -> () in
                    if(success){
                        let eventstatictics:EventStatistics = EventStatistics.getEventStatistics();
                        self.txtArrived.text = String(format: "%d",(eventstatictics.totalArrivedMember?.intValue)!)
                        self.txtLeft.text = String(format: "%d",(eventstatictics.totalLeftMember?.intValue)!)
                        self.txtRegistered.text = String(format: "%d",(eventstatictics.totalRegisteredMember?.intValue)!)
                    }
                })
            })
           
            
            self.tableView?.reloadData()
        }

    }
    func setNavigationItem(){
        let barbuttonItem1 = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "showWithFooter:")
        let flexiblespace = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: self, action:"");
        let barbuttonItem2 = UIBarButtonItem(barButtonSystemItem: .Bookmarks, target: self, action: "addNonMember:")
        self.navigationItem.rightBarButtonItems = [barbuttonItem1,barbuttonItem2];
        
    }
    
    func addNonMember(sender: AnyObject) {
        self.performSegueWithIdentifier("nonmember", sender: nil);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memberarray.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:MemberCell = tableView.dequeueReusableCellWithIdentifier("MemberIdentifier", forIndexPath: indexPath) as! MemberCell
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        let member = self.memberarray.objectAtIndex(indexPath.row) as! Member
        if(member.agreedToPhotoAndVideo?.boolValue == true){
            cell.btnAgreedToPhotoAndVideos?.hidden = true;
        }else{
            cell.btnAgreedToPhotoAndVideos?.hidden = false;
        }
        if(member.is_arrive?.boolValue == true){
            cell.btnArrivr?.backgroundColor = UIColor.greenColor()
            cell.btnLeft?.enabled = true
            cell.btnArrivr?.enabled = false
        }else{
            cell.btnArrivr?.backgroundColor = UIColor.darkGrayColor()
        }
        if(member.is_leave?.boolValue == true){
            cell.btnLeft?.backgroundColor = UIColor.greenColor()
            cell.btnArrivr?.enabled = false
            
        }else{
             //cell.btnArrivr?.enabled = true
             cell.btnLeft?.backgroundColor = UIColor.darkGrayColor();
        }
        if(member.is_arrive == false && member.is_leave?.boolValue == false){
            cell.btnLeft?.enabled = false
        }
        print(member.name);
        cell.lblMembername!.text = member.name;
        
        cell.btnArrivr?.addTarget(self, action: "btnarrivedClicked:", forControlEvents:UIControlEvents.TouchUpInside)
        cell.btnLeft?.addTarget(self, action: "btnLeftClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        cell.btnComment?.addTarget(self, action:Selector("btncommentClicked:"), forControlEvents: UIControlEvents.TouchUpInside)
        cell.btnAddMember?.addTarget(self, action: "addMember:", forControlEvents:UIControlEvents.TouchUpInside)
        cell.btnMedicalHistory?.addTarget(self, action: "btnMedicalHistoryClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func btnMedicalHistoryClicked(sender:UIButton){
        let buttonPosition = sender.convertPoint(CGPointZero, toView: self.tableView);
        let indexPath = self.tableView?.indexPathForRowAtPoint(buttonPosition);
        let member = self.memberarray.objectAtIndex(indexPath!.row) as! Member
        print(member.medicalHistory);
        if((member.medicalHistory?.isEmpty) != nil){
            let view  = MedicalHistory.initView(member.medicalHistory!);
            KGModal.sharedInstance().showWithContentView(view)
        }
    }
    
    
    func btnarrivedClicked(sender:UIButton){
        let account = AccountManager.Instance.activeAccount;
        let buttonPosition = sender.convertPoint(CGPointZero, toView: self.tableView);
        let indexPath = self.tableView?.indexPathForRowAtPoint(buttonPosition);
        let member = self.memberarray.objectAtIndex(indexPath!.row) as! Member
        SVProgressHUD.showInfoWithStatus("Please wait...")
     ClubManager.Instance.saveEventRegister((member.entity_id?.integerValue)!, event_id: self.event_id!, member_id:Int(member.value!)!, customer_id: (account?.Id)!, typestr: "IsArive", value:!( member.is_arrive?.boolValue)!) { (success) -> () in
        SVProgressHUD.dismiss()
        if (success){
            self.loadClubMemberList()
        }
        }
    }
    
    func btnLeftClicked(sender:UIButton){
         SVProgressHUD.showInfoWithStatus("Please wait...")
        let account = AccountManager.Instance.activeAccount;
        let buttonPosition = sender.convertPoint(CGPointZero, toView: self.tableView);
        let indexPath = self.tableView?.indexPathForRowAtPoint(buttonPosition);
        let member = self.memberarray.objectAtIndex(indexPath!.row) as! Member
        ClubManager.Instance.saveEventRegister((member.entity_id?.integerValue)!, event_id: self.event_id!, member_id: Int(member.value!)!, customer_id: (account?.Id)!, typestr: "IsLeave", value:!(member.is_leave?.boolValue)!) { (success) -> () in
            SVProgressHUD.dismiss()
            if (success){
                self.loadClubMemberList()
            }
        }
    }
    
    func btncommentClicked(sender:UIButton){
        KGModal.sharedInstance().responsiveToKeyboard = true;
        let buttonPosition = sender.convertPoint(CGPointZero, toView: self.tableView);
        let indexPath = self.tableView?.indexPathForRowAtPoint(buttonPosition);
        currentPosition = indexPath?.row
        let member = self.memberarray.objectAtIndex(currentPosition!) as! Member
        let view = CommentView.initView(member,del: self);
        KGModal.sharedInstance().showWithContentView(view)
        
    }
    
    func submitCommentClicked(comment: String) {
        let account = AccountManager.Instance.activeAccount;
        let member = self.memberarray.objectAtIndex(currentPosition!) as! Member
        ClubManager.Instance.saveEventRegister((member.entity_id?.integerValue)!, event_id: self.event_id!, member_id: Int(member.value!)!, customer_id: (account?.Id)!, typestr: "comment", comment:comment) { (success) -> () in
            SVProgressHUD.dismiss()
            if (success){
                self.loadClubMemberList()
            }
            KGModal.sharedInstance().hideAnimated(true);
        }
    }
    
    
    
    
    func showWithFooter(sender: AnyObject) {
        let picker = CZPickerView(headerTitle: "Club Member List", cancelButtonTitle: "Cancel", confirmButtonTitle: "Confirm")
        picker.delegate = self
        picker.dataSource = self
        picker.needFooterView = true
        picker.allowMultipleSelection = true;
        picker.show()
    }
    
 
    func numberOfRowsInPickerView(pickerView: CZPickerView!) -> Int {
        return clubmemberarray.count
    }
    
    func czpickerView(pickerView: CZPickerView!, titleForRow row: Int) -> String! {
        let member = clubmemberarray[row] as! ClubMember
        print(member.fullname)
        return member.fullname
    }
    

        func czpickerView(pickerView: CZPickerView!, didConfirmWithItemsAtRows rows: [AnyObject]!){
            let arr = rows as NSArray
            if(arr.count > 0){
                let memberStrList = getMemberStringFromArray(rows)
                ClubManager.Instance.saveMember(self.event_id!, member_id: memberStrList) { (success) -> () in
                    if(success){
                        self.loadClubMemberList()
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            let actionSheetController: UIAlertController = UIAlertController(title: "Alert", message: "Member Added", preferredStyle: .Alert)
                            
                            //Create and add the Cancel action
                            let cancelAction: UIAlertAction = UIAlertAction(title: "Ok", style: .Cancel) { action -> Void in
                                //Do some stuff
                            }
                            actionSheetController.addAction(cancelAction)
                            //Create and an option action
                            
                            //Add a text field
                            
                            //Present the AlertController
                            self.presentViewController(actionSheetController, animated: true, completion: nil)
                        })
                    }
                
            }
            
        }

    }
        func getMemberStringFromArray(rows:[AnyObject]!)->String{
            var text:String = ""
            for index in rows{
                let member = clubmemberarray[index as! Int] as! ClubMember
                if text.isEmpty {
                    text = String(format: "%@",member.entity_id!)
                } else {
                    text += String(format: ",%@",member.entity_id!)
                }
                
                
            }
            return text;
        }
    
  
    
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


