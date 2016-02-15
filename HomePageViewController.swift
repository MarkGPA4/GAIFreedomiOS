//
//  HomePageViewController.swift
//  FreedomHouse
//
//  Created by Mark Li  on 1/8/16.
//  Copyright © 2016 Mark Li . All rights reserved.
//
import Parse
import UIKit


class HomePageViewController: BaseViewController,CAPSPageMenuDelegate{

    
  //  @IBOutlet weak var ProfileImage: UIImageView!
    
    var pageMenu : CAPSPageMenu?

    override func viewDidLoad() {
        super.viewDidLoad()

  
        
        self.addSlideMenuButton()
        
        if PFUser.currentUser() == nil{
            self.performSegueWithIdentifier("ToLogIn", sender: self)
        }
        
    }
    
    
    override func viewDidAppear(animated: Bool) {
        
        
        var controllerArray : [UIViewController] = []
        
      
       
        
        let controller: CollegeInfoViewController=CollegeInfoViewController(nibName: "CollegeInfoViewController", bundle: nil)
        controller.title = "Colleges"
        controllerArray.append(controller)
        
        let controller2: EventsViewController=EventsViewController(nibName: "EventsViewController", bundle: nil)
        controller2.title = "Events"
        controllerArray.append(controller2)
        
        let controller3: GradesViewController=GradesViewController(nibName: "GradesViewController", bundle: nil)
        controller3.title = "Grades"
        controllerArray.append(controller3)
        
        
        
        
     
      //  self.navigationController?.navigationBar.barStyle = UIBarStyle.Black

        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        self.navigationController?.navigationBar.barTintColor = UIColor.darkGrayColor()
         self.navigationController?.navigationBar.topItem?.title = "Application"
        
        
        let parameters: [CAPSPageMenuOption] = [
            .ScrollMenuBackgroundColor(UIColor.darkGrayColor()),
            .ViewBackgroundColor(UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 1.0)),
            .SelectionIndicatorColor(UIColor(red: 141.0/255.0, green: 10.0/255.0, blue: 22.0/255.0, alpha: 1.0)),
            .BottomMenuHairlineColor(UIColor(red: 141.0/255.0, green: 10.0/255.0, blue: 22.0/255.0, alpha: 1.0)),
            .MenuItemFont(UIFont(name: "HelveticaNeue", size: 13.0)!),
            .MenuHeight(40.0),
            .MenuItemWidth(90.0),
            .CenterMenuItems(true)]
        
        // Initialize page menu with controller array, frame, and optional parameters
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 30.0, self.view.frame.width, self.view.frame.height), pageMenuOptions: parameters)
        
        // Lastly add page menu as subview of base view controller view
        // or use pageMenu controller in you view hierachy as desired
        self.view.addSubview(pageMenu!.view)
        self.addChildViewController(pageMenu!)
        pageMenu?.didMoveToParentViewController(self)
        pageMenu!.viewBackgroundColor = UIColor(red: 100.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 1.0)
        
        
        // Set frame for page menu
        // Example:
        pageMenu!.view.frame = CGRectMake(0.0, 60.0, self.view.frame.width, self.view.frame.height)
        
        // Customize page menu to your liking (optional) or use default settings
        // Example:
        pageMenu!.scrollMenuBackgroundColor = UIColor(red: 30.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)
        pageMenu!.viewBackgroundColor = UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 1.0)
        pageMenu!.selectionIndicatorColor = UIColor.orangeColor()
        pageMenu!.bottomMenuHairlineColor = UIColor(red: 70.0/255.0, green: 70.0/255.0, blue: 80.0/255.0, alpha: 1.0)
        pageMenu!.menuItemFont = UIFont(name: "HelveticaNeue", size: 13.0)!
        pageMenu!.menuHeight = 40.0
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    
    
    //////////problematic
    
    
   /* func loadImages() {
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
    }   */
    
    
    
    
    /*func getImageData(object: PFObject) {
        let Photo = object["imageFile"] as! PFFile
        Photo.getDataInBackgroundWithBlock({
        (imageData: NSData?, error: NSError?) -> Void in
        if (error == nil) {
        let image = UIImage(data:imageData!)
        self.ProfileImage.image = image
    
        }
            
        })
       
        
    }*/
    
    
    
    
    
    
}