//
//  ViewController.swift
//  MultiClub
//
//  Created by Admin on 08/04/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate {
    @IBOutlet var tblView:UITableView!
    @IBOutlet var txtField:UITextField!
    
    var picker:UIPickerView?
    var eventarray = NSMutableArray();
    var pickerArray = NSMutableArray();
    var club:Club?;
    override func viewDidLoad() {
        self.title = "Event List"
        super.viewDidLoad()
        let account = AccountManager.Instance.activeAccount
        if (account == nil){
            AppDelegate.appdelegate().showLogin(true);
        }else{
           self.reloadClubList()
        }
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reloadClubList", name: Constant.LOGIN_SUCCESSFUL, object: nil)
        

    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        
    }
    func textFieldDidBeginEditing(textField: UITextField) {
        if(textField == txtField){
            self.showPicker(textField);
        }
    }
    
    func reloadClubList(){
        ClubManager.Instance.loadClubListWithblock { (success) -> () in
            
            if (success == true){
                self.pickerArray = NSMutableArray();
                let arr = Club.getAll();
                let descriptor: NSSortDescriptor = NSSortDescriptor(key: "name", ascending: true)
                let sortedResults: NSArray = arr.sortedArrayUsingDescriptors([descriptor])
                self.pickerArray = sortedResults.mutableCopy() as! NSMutableArray
                self.loadEventForClub(0);
                self.picker?.reloadAllComponents();
            }
        };
    }
    
    @IBAction func btnLogoutClicked(sender: AnyObject) {
        AppDelegate.appdelegate().logout()
    }
    
    @IBAction func btnFilterClicked(sender: AnyObject){
        let actionSheetController: UIAlertController = UIAlertController(title: "Alert", message: "Filter events by following:", preferredStyle: .ActionSheet)
        
        //Create and add the Cancel action
        let Action1: UIAlertAction = UIAlertAction(title: "All", style: .Default) { action -> Void in
            self.loadFilteredEvents(Constant.FILTER_TYPE_ALL);
        }
        let Action2: UIAlertAction = UIAlertAction(title: "Past Events", style: .Default) { action -> Void in
            self.loadFilteredEvents(Constant.FILTER_TYPE_PAST_EVENTS);

        }
        let Action3: UIAlertAction = UIAlertAction(title: "Current Events", style: .Default) { action -> Void in
            self.loadFilteredEvents(Constant.FILTER_TYPE_CURRENT_EVENTS);
        }
        let Action4: UIAlertAction = UIAlertAction(title: "Future Events", style: .Default) { action -> Void in
           self.loadFilteredEvents(Constant.FILTER_TYPE_FUTURE_EVENTS);
        }
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            //Do some stuff
        }
        actionSheetController.addAction(Action1)
        actionSheetController.addAction(Action2)
        actionSheetController.addAction(Action3)
        actionSheetController.addAction(Action4)
        actionSheetController.addAction(cancelAction)
        
        self.presentViewController(actionSheetController, animated: true, completion: nil)
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerArray.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let club = self.pickerArray.objectAtIndex(row) as! Club
        return club.name;
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    
    func showPicker(textField:UITextField){
        
        picker = UIPickerView(frame: CGRectMake(0, UIScreen.mainScreen().bounds.size.height-400, self.view.frame.width, 200))
        picker!.backgroundColor = .grayColor()
        
        picker!.showsSelectionIndicator = true
        picker!.delegate = self
        picker!.dataSource = self
        
        let toolBar = UIToolbar()
        let label = UILabel(frame: CGRectMake(0, 0, 120, 44))//[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
        label.text = "Select a Club";
        label.textAlignment = NSTextAlignment.Center
        label.backgroundColor = UIColor.clearColor();
        let labelButton = UIBarButtonItem(customView: label)
        
        toolBar.barStyle = UIBarStyle.Default
        toolBar.translucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: "donePicker")
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: "cancel")
        
        toolBar.setItems([cancelButton, spaceButton,labelButton,spaceButton,doneButton], animated: false)
        toolBar.userInteractionEnabled = true
        
        textField.inputView = picker
        textField.inputAccessoryView = toolBar
    }
    func cancel(){
        self.view.endEditing(true)
    }
    
    func donePicker(){
        self.view.endEditing(true);
         let row = (picker?.selectedRowInComponent(0))! as Int;
         self.loadEventForClub(row);
        
    }
    
    func loadEventForClub(index:Int){
        if (AppDelegate.appdelegate().isReachable()){
            club = self.pickerArray.objectAtIndex(index) as? Club
            let str = String(format: "Club: %@", club!.name!)
            txtField.text = str;
            ClubManager.Instance.loadEventRegisterList((club!.entity_id?.integerValue)!) { (success) -> () in
                if (success == true){
                    self.eventarray = NSMutableArray();
                    self.eventarray = Event.getAll();
                    
                }else{
                    self.eventarray = NSMutableArray();
                    if(self.eventarray.count<=0){
                        let alert = UIAlertView(title: "Alert" as String, message:"No record found", delegate: nil, cancelButtonTitle: "Ok")
                        alert.show()
                       
                    }
                }
                self.tblView.reloadData()
            }
            
        }else{
            let actionSheetController: UIAlertController = UIAlertController(title: "Alert", message: "Internet Connection not available", preferredStyle: .Alert)
            
            //Create and add the Cancel action
            let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
                //Do some stuff
            }
            actionSheetController.addAction(cancelAction)
            
            self.presentViewController(actionSheetController, animated: true, completion: nil)
        }

    }
    func loadFilteredEvents(type:String){
        if (AppDelegate.appdelegate().isReachable()){
            ClubManager.Instance.filterEventRegisterList((club?.entity_id?.integerValue)!, filter_type:type, block: { (success) -> () in
                
                if (success == true){
                    self.eventarray = NSMutableArray();
                    self.eventarray = Event.getAll();
                    
                }else{
                    self.eventarray = NSMutableArray();
//                    if(self.eventarray.count<=0){
//                        let alert = UIAlertView(title: "Alert" as String, message:"No record found", delegate: nil, cancelButtonTitle: "Ok")
//                        alert.show()
//                        
//                    }
                }
                self.tblView.reloadData()
            })
            
        }else{
            let actionSheetController: UIAlertController = UIAlertController(title: "Alert", message: "Internet Connection not available", preferredStyle: .Alert)
            
            //Create and add the Cancel action
            let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
                //Do some stuff
            }
            actionSheetController.addAction(cancelAction)
            
            self.presentViewController(actionSheetController, animated: true, completion: nil)
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.eventarray.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:ClubCell = tableView.dequeueReusableCellWithIdentifier("ClubIdentifier", forIndexPath: indexPath) as! ClubCell
        let event = self.eventarray.objectAtIndex(indexPath.row) as! Event
        print(event.eventname);
       
        cell.lblClubName?.text = NSString(format: "Name: %@", event.eventname!) as String;
        cell.lblClubDesc?.text = String(format: "Desc:%@",event.desc ?? "")
       
        cell.lblStartTime?.text = String(format: "Start Time: %@", event.start_time ?? "")
        if let theDate = NSDate(jsonDate: event.start_date!) {
            print(theDate)
            let dateStr = theDate.dateStringWithFormat("dd-MM-yyyy");
             cell.lblStartDate?.text = String(format: "Start Date: %@", dateStr ?? "")
        } else {
            print(event.start_date ?? "")
        }
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.performSegueWithIdentifier("member", sender: indexPath)
       
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "member"){
             let indexPath = sender as! NSIndexPath;
             let event = self.eventarray.objectAtIndex(indexPath.row) as! Event
             let viewController:MemberViewController = segue.destinationViewController as! MemberViewController
             viewController.event_id = event.entity_id?.integerValue;
             viewController.club_id =  club?.entity_id?.integerValue;
        }
    }
}

