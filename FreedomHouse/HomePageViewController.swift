//
//  HomePageViewController.swift
//  FreedomHouse
//
//  Created by Mark Li  on 1/8/16.
//  Copyright © 2016 Mark Li . All rights reserved.
//
import Parse

import UIKit
import Firebase

class HomePageViewController: BaseViewController {



    @IBAction func write(sender: AnyObject) {
        
        var myRootRef = Firebase(url:"https://freedom-house.firebaseio.com")
       
        myRootRef.setValue("Do you have data? You'll love Firebase.")
    }
    
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
    
    
  
    
  /*  func loadImages() {
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
      
     
    
        }
            
        })
       
        
    }*/
    
    
    
    
    
    
}