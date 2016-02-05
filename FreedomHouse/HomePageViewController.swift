//
//  HomePageViewController.swift
//  FreedomHouse
//
//  Created by Mark Li  on 1/8/16.
//  Copyright © 2016 Mark Li . All rights reserved.
//
import Parse
import UIKit


class HomePageViewController: BaseViewController {

    
    @IBOutlet weak var ProfileImage: UIImageView!
    var pageMenu : CAPSPageMenu?

    override func viewDidLoad() {
        super.viewDidLoad()

     //   if PFUser.currentUser() == nil{
        
        self.addSlideMenuButton()
        
        if PFUser.currentUser() == nil{
            self.performSegueWithIdentifier("ToLogIn", sender: self)
        }
    
        
        // Array to keep track of controllers in page menu
        var controllerArray : [UIViewController] = []
        
        // Create variables for all view controllers you want to put in the
        // page menu, initialize them, and add each to the controller array.
        // (Can be any UIViewController subclass)
        // Make sure the title property of all view controllers is set
        // Example:
        
        var controller = UIViewController(nibName: "CollegeInfoViewController", bundle: nil)
        controller.title = "SAMPLE TITLE"
        controllerArray.append(controller)
        
        var controller2 = UIViewController(nibName: "WaitingPageViewController", bundle: nil)
        controller2.title = "College Info"
        controllerArray.append(controller2)
        
        
        // Customize page menu to your liking (optional) or use default settings by sending nil for 'options' in the init
        // Example:
        let parameters: [CAPSPageMenuOption] = [
            .SelectionIndicatorHeight(2.0),
            .MenuItemFont(UIFont(name: "HiraKakuProN-W6", size: 13.0)!),
            .MenuHeight(34.0),
            .MenuItemWidth(80.0),
            .MenuMargin(0.0),
            //            "useMenuLikeSegmentedControl": true,
            .MenuItemSeparatorRoundEdges(true),
            //            "enableHorizontalBounce": true,
            //            "scrollAnimationDurationOnMenuItemTap": 300,
            .CenterMenuItems(true)]
        
        // Initialize page menu with controller array, frame, and optional parameters
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height), pageMenuOptions: parameters)
        
        // Lastly add page menu as subview of base view controller view
        // or use pageMenu controller in you view hierachy as desired
        self.view.addSubview(pageMenu!.view)
        self.addChildViewController(pageMenu!)
        pageMenu?.didMoveToParentViewController(self)
        
     //   }
            
            
    //    else{
         //   self.presentViewController(LogInViewController(),animated: true, completion:nil)
            //  self.loadImages()
      //  }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    
    
    //////////problematic
    
    
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
        self.ProfileImage.image = image
    
        }
            
        })
       
        
    }
    
    
    
    
    
    
}