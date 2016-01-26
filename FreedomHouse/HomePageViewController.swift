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
    

    override func viewDidLoad() {
        
     //   if PFUser.currentUser() == nil{
        
        self.addSlideMenuButton()
        
        if PFUser.currentUser() == nil{
        self.performSegueWithIdentifier("ToLogIn", sender: self)
        }
    
            
     //   }
            
            
    //    else{
         //   self.presentViewController(LogInViewController(),animated: true, completion:nil)
            //  self.loadImages()
      //  }

        
        
        super.viewDidLoad()
        
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