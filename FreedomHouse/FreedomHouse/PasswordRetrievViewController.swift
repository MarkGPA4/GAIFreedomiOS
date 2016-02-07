//
//  PasswordRetrievViewController.swift
//  FreedomHouse
//
//  Created by Mark Li  on 1/11/16.
//  Copyright © 2016 Mark Li . All rights reserved.
//

import UIKit

class PasswordRetrievViewController: UIViewController {

    @IBOutlet weak var Email: UITextField!
    
   /* @IBAction func BackButton(sender: AnyObject) {
           self.dismissViewControllerAnimated(true, completion: nil)    
        
    } */

    @IBOutlet weak var ButtomConstraint: NSLayoutConstraint!
    @IBAction func PasswordRetrieve(sender: AnyObject) {
        let email=Email.text
        
        PFUser.requestPasswordResetForEmailInBackground(email!){(success:Bool,error:NSError?) -> Void in
            if(success)
            {
                let successMessage: String="Email message was sent to you at \(email)"
                
            self.displayErrorMessage(successMessage)
            return
            
            }
            if error != nil
            {
                let errorMessage: String = error!.userInfo["error"] as! String
            self.displayErrorMessage(errorMessage)
            }
            
        }
        
    }
    
    func displayErrorMessage(theMessage:String){
        //Display Alert message
        var myAlert=UIAlertController(title:"Alert",message:theMessage,preferredStyle: UIAlertControllerStyle.Alert);
        let okAction=UIAlertAction(title: "Ok", style:UIAlertActionStyle.Default)
            {
                action in myAlert.dismissViewControllerAnimated(true,completion: nil);
        }
        myAlert.addAction(okAction)
        self.presentViewController(myAlert,animated:true,completion:nil);
        
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self,selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func adjustingHeight(show:Bool, notification:NSNotification) {
        
        var userInfo = notification.userInfo!
        
        let keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).CGRectValue()
        
        let animationDurarion = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSTimeInterval
        
        let changeInHeight = (CGRectGetHeight(keyboardFrame) + 40) * (show ? 1 : -1)
        UIView.animateWithDuration(animationDurarion, animations: { () -> Void in
            self.ButtomConstraint.constant = (changeInHeight)-20
            
        })
        
        
    }
    
    func keyboardWillShow(notification:NSNotification) {
        adjustingHeight(true, notification: notification)
    }
    
    func keyboardWillHide(notification:NSNotification) {
        adjustingHeight(false, notification: notification)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        view.endEditing(true)
       
    }

}
