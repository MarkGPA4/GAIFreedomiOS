//
//  UploadImageViewController.swift
//  FreedomHouse
//
//  Created by Mark Li  on 1/11/16.
//  Copyright © 2016 Mark Li . All rights reserved.
//

import UIKit
import Parse

class UploadImageViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate

{

    @IBOutlet weak var ProfileImage: UIImageView!
    


   
    @IBAction func AddImage(sender: AnyObject) {
        var imagePicker=UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType=UIImagePickerControllerSourceType.PhotoLibrary
        imagePicker.allowsEditing=false
        self.presentViewController(imagePicker,animated:true,completion:nil)
        
    }
    
    
    @IBAction func Upload(sender: AnyObject) {
        
        
       if ProfileImage.image==nil
        {
        self.displayErrorMessage("Image not uploaded")
        }
        else{
        
        
        
            let photo = PFObject(className: "Photos")
        
            photo["uploader"]=PFUser.currentUser()
        
            photo.saveInBackgroundWithBlock({(success:Bool,error:NSError?)-> Void in
                
            if error == nil {
            //success saving, Now save Image.
            self.saveSelectedImage(self.ProfileImage.image!)
                
            var imageData = UIImagePNGRepresentation(self.ProfileImage.image!)
                print("ImageConverted")
            
            
                
            let parseImageFile=PFFile(name:"uploaded_image.png",data: imageData!)
                
                photo["imageFile"]=parseImageFile
            
                
                photo.saveInBackgroundWithBlock({(success: Bool, error:NSError?)->Void in
                    if error==nil{
                        print("Photo Saved")
                    }else{
                    
                    let errorMessage:String = error!.userInfo["error"] as! String
                    self.displayErrorMessage(errorMessage)
                    }
                    
            })
            
            }
                
            else {
                
                let errorMessage: String = error!.userInfo["error"] as! String
                self.displayErrorMessage(errorMessage)
                
            }
      })
        
        self.dismissViewControllerAnimated(false, completion: nil)
        
        }
        
    }
    
    
    static let profileImage = "PROFILE_IMAGE"
    
    func saveSelectedImage(image : UIImage){
    
    let profile = NSUserDefaults.standardUserDefaults()
    let imageData = UIImageJPEGRepresentation(image, 100)
    profile.setObject(imageData, forKey: UploadImageViewController.profileImage)
    print("saved image!!!!!!!!!!!")
    
    }
    
    
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
     //    NSUserDefaults.standardUserDefaults().setObject(ProfileImage, forKey: "imageDataForProfile") // to save
    }
    
    
    
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!,editingInfo:[NSObject: AnyObject]!) {
        ProfileImage.image = image
   
        self.dismissViewControllerAnimated(true, completion: nil)
        }
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    
    func displayErrorMessage(theMessage:String){
        //Display Alert message
        let myAlert=UIAlertController(title:"Alert",message:theMessage,preferredStyle: UIAlertControllerStyle.Alert);
        let okAction=UIAlertAction(title: "Ok", style:UIAlertActionStyle.Default)
            {
                action in myAlert.dismissViewControllerAnimated(true,completion: nil);
        }
        
        myAlert.addAction(okAction)
    self.presentViewController(myAlert,animated:true,completion:nil);
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
