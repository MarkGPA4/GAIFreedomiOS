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

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    /**
     *  Array to display menu options
     */
    @IBOutlet var tblMenuOptions : UITableView!
    
   
    
    @IBOutlet weak var profileimage: UIImageView!
   
   
    
    @IBOutlet var btnCloseMenuOverlay : UIButton!
  
    
    var arrayMenuOptions = [Dictionary<String,String>]()
    var MenuIcons = [Dictionary<String,String>]()
  
    var btnMenu : UIButton!
    
    
    var delegate : SlideMenuDelegate?
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    tblMenuOptions.tableFooterView = UIView()
     
    }

    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updateArrayMenuOptions()
    }
    
    func updateArrayMenuOptions(){
        arrayMenuOptions.append(["title":"Home"])
        arrayMenuOptions.append(["title":"Profile"])
        arrayMenuOptions.append(["title":"Setting"])
        arrayMenuOptions.append(["title":"Logout"])
        
        MenuIcons.append(["icon":"home"])
        MenuIcons.append(["icon":"user"])
        MenuIcons.append(["icon":"setting"])
        MenuIcons.append(["icon":"home"])
        
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
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cellMenu")!
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.layoutMargins = UIEdgeInsetsZero
        cell.preservesSuperviewLayoutMargins = false
        cell.backgroundColor = UIColor.clearColor()
        
   
        var imgIcon : UIImageView = cell.contentView.viewWithTag(100) as! UIImageView
        let button: UIButton=cell.contentView.viewWithTag(103) as! UIButton
        
        button.setTitle(arrayMenuOptions[indexPath.row]["title"]!, forState: UIControlState.Normal)
        
        
        
        button.addTarget(self, action: "CellButtonToViews:", forControlEvents: UIControlEvents.TouchUpInside)
        
        let image: UIImage = UIImage(named:MenuIcons[indexPath.row]["icon"]!)!
        /*MenuIcons[indexPath.row]*/
        
        imgIcon.image = image
        
        
        return cell
    }
    
    
    func CellButtonToViews(sender:UIButton!){
        if sender.titleLabel!.text=="Home"{
            self.onCloseMenuClick(btnCloseMenuOverlay)
            
        }
        else if sender.titleLabel!.text=="Setting"{
        
        }
        else if sender.titleLabel!.text=="Logout"{
            PFUser.logOut()
            self.presentViewController(LogInViewController(), animated: false, completion: nil)
        }
        
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
    
    func loadImages() {
        let query = PFQuery(className: "Photos")
        query.whereKey("uploader", equalTo: PFUser.currentUser()!)
        
        query.findObjectsInBackgroundWithBlock{(objects:[PFObject]?, error: NSError?) -> Void in
            if(error == nil){
                for object in objects!{
                    self.getImageData(object)
                }
            }
            else{
                print("Error in retrieving \(error)")
            }
            
        }
    }
    
    
    
    func getImageData(object: PFObject) {
        let Photo = object["imageFile"] as! PFFile
        Photo.getDataInBackgroundWithBlock({
            (imageData: NSData?, error: NSError?) -> Void in
            if (error == nil) {
                let image = UIImage(data:imageData!)
                self.profileimage.image = image
                
            }
            
        })
        
    }
}