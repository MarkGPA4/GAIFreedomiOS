//
//  MenuViewController.swift
//  AKSwiftSlideMenu
//
//  Created by Ashish on 21/09/15.
//  Copyright (c) 2015 Kode. All rights reserved.
//

import UIKit
import Parse

protocol SlideMenuDelegate {
    func slideMenuItemSelectedAtIndex(index : Int32)
}

class MenuViewController: BaseViewController,UITableViewDataSource, UITableViewDelegate {
  
    /**
     *  Array to display menu options
     */
    @IBOutlet var tblMenuOptions : UITableView!
    
    /**
     *  Transparent button to hide menu
     */
    @IBOutlet var btnCloseMenuOverlay : UIButton!
    
    /**
     *  Array containing menu options
     */
    var arrayMenuOptions = [Dictionary<String,String>]()
    
    /**
     *  Menu button which was tapped to display the menu
     */
    var btnMenu : UIButton!
    
    /**
     *  Delegate of the MenuVC
     */
    var delegate : SlideMenuDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    tblMenuOptions.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updateArrayMenuOptions()
       // if (PFUser.currentUser()==nil){}
    
    
    }
    
    func updateArrayMenuOptions(){
        arrayMenuOptions.append(["title":"Home"])
        arrayMenuOptions.append(["title":"Profile"])
        arrayMenuOptions.append(["title":"Setting"])
        arrayMenuOptions.append(["title":"Logout"])
        
        tblMenuOptions.reloadData()
    }
    
    
    @IBAction func onCloseMenuClick(button:UIButton!){
        btnMenu.tag = 0
        
        if (self.delegate != nil) {
            var index = Int32(button.tag)
            if(button == self.btnCloseMenuOverlay){
                index = -1
            }
            delegate?.slideMenuItemSelectedAtIndex(index)
        }
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.view.frame = CGRectMake(-UIScreen.mainScreen().bounds.size.width, 0, UIScreen.mainScreen().bounds.size.width,UIScreen.mainScreen().bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clearColor()
            }, completion: { (finished) -> Void in
                self.view.removeFromSuperview()
                self.removeFromParentViewController()
        })
    }
    
    
 /*   func LogOut(sender : UIButton!){
        
        PFUser.logOut()
        
    }*/
 
    func LogOut(sender : UIButton!){
        
       PFUser.logOut()
        print("LogOut")
      
        self.onSlideMenuButtonPressed(sender)
        
    }
    func ToProfile(sender : UIButton!){
        
        self.performSegueWithIdentifier("MenuToProfile",sender:self)
        self.onSlideMenuButtonPressed(sender)
    }
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cellMenu")!
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.layoutMargins = UIEdgeInsetsZero
        cell.preservesSuperviewLayoutMargins = false
        cell.backgroundColor = UIColor.clearColor()
        
        let buttonOptions: UIButton = cell.contentView.viewWithTag(110) as! UIButton
        
    

        
        buttonOptions.setTitle(arrayMenuOptions[indexPath.row]["title"]!,forState: UIControlState.Normal)
        
        if (buttonOptions.currentTitle == "Logout"){
      
        buttonOptions.addTarget(self, action: "LogOut:", forControlEvents: UIControlEvents.TouchUpInside)
        buttonOptions.addTarget(self, action: "onSlideMenuButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        }

        
        else if (buttonOptions.currentTitle == "Profile"){
        
        buttonOptions.addTarget(self, action: "ToProfile:", forControlEvents: UIControlEvents.TouchUpInside)
            
        }
        return cell
        
    }
    
  
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let btn = UIButton(type: UIButtonType.Custom)
        btn.tag = indexPath.row
        self.onCloseMenuClick(btn)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayMenuOptions.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    override func onSlideMenuButtonPressed(sender : UIButton){
        if (sender.tag == 110)
        {
            // To Hide Menu If it already there
            self.slideMenuItemSelectedAtIndex(-1);
            
            sender.tag = 110;
            
            let viewMenuBack : UIView = view
            UIView.animateWithDuration(0.8, animations: { () -> Void in
                var frameMenu : CGRect = viewMenuBack.frame
                frameMenu.origin.x = -1 * (UIScreen.mainScreen().bounds.size.width+40)
                viewMenuBack.frame = frameMenu
                viewMenuBack.layoutIfNeeded()
                viewMenuBack.backgroundColor = UIColor.clearColor()
                }, completion: { (finished) -> Void in
                    viewMenuBack.removeFromSuperview()
                    if PFUser.currentUser() == nil{
                        self.performSegueWithIdentifier("MenuToLogIn", sender: self)
                    }
                    
                    
            }
            
            
            )
           
            
            return
        }
        /*
        sender.enabled = false
        sender.tag = 110
        
        let menuVC : MenuViewController = self.storyboard!.instantiateViewControllerWithIdentifier("MenuViewController") as! MenuViewController
        menuVC.btnMenu = sender
        menuVC.delegate = self
        self.view.addSubview(menuVC.view)
        self.addChildViewController(menuVC)
        menuVC.view.layoutIfNeeded()
        
        
        menuVC.view.frame=CGRectMake(0 - UIScreen.mainScreen().bounds.size.width, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height);
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            menuVC.view.frame=CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height);
            sender.enabled = true
            }, completion:nil)
        
        */
        
        
        
    }
    
    
    

    
    
    
    
}