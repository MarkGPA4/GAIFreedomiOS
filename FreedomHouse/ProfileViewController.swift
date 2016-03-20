//
//  ProfileViewController.swift
//  FreedomHouse
//
//  Created by Mark Li  on 3/19/16.
//  Copyright © 2016 Mark Li . All rights reserved.
//

import UIKit

import Parse

class ProfileViewController: UIViewController {
   

    @IBAction func BackToMenu(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
   // let profileImageView1 = ProfileImageView(frame: CGRectMake(20, 20, 120, 120))
    
    @IBOutlet var profileImage: UIImageView!
    
    
    static let profileImage = "PROFILE_IMAGE"
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.loadImages()
        
        if let imageData = NSUserDefaults.standardUserDefaults().objectForKey(UploadImageViewController.profileImage) as? UIImage {// fetching from local storage
            profileImage.image=imageData
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
  /*  func loadImages() {
        
        let query = PFQuery(className: "Photos")
        query.whereKey("uploader", equalTo: PFUser.currentUser()!)
        
        query.findObjectsInBackgroundWithBlock{(objects:[PFObject]?, error: NSError?) -> Void in
            if(error == nil){
                
                
                for object in objects!{
                    
                    if (objects != nil){self.getImageData(object)}
                    
                }
            }
                
                
            else{
                print("Error in retrieving \(error)")
    }
    
    }
        
        
    }
    
    */
    
    
    /*func getImageData(object: PFObject) {
        let Photo = object["imageFile"] as! PFFile
        Photo.getDataInBackgroundWithBlock({
            (imageData: NSData?, error: NSError?) -> Void in
            if (error == nil) {
                
                let profileImage = UIImage(data:imageData!)
                
                      
                
               
            }
            
        })
        
        
    }
    */

       
    
    
    
    
    
    
}
