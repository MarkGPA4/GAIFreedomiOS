//
//  ViewController.swift
//  FreedomHouse
//
//  Created by Mark Li  on 11/10/15.
//  Copyright © 2015 Mark Li . All rights reserved.
//

import UIKit
import Parse
import Bolts
import ParseFacebookUtilsV4
import FBSDKCoreKit

class LogInViewController: UIViewController, UITextFieldDelegate//,FBSDKLoginButtonDelegate
    
{
    
    @IBOutlet weak var Logo: UIImageView!
    
    @IBOutlet weak var Username: UITextField!
    
    @IBOutlet weak var Password: UITextField!
    
    @IBOutlet weak var ErrorMessage: UILabel!
    
    
    @IBAction func Login(sender: UIButton) {
        
        self.Username.resignFirstResponder()
        self.Password.resignFirstResponder()
        Login()
        
    }
    
    @IBAction func SignUp(sender: UIButton) {
        self.Username.resignFirstResponder()
        self.Password.resignFirstResponder()
        //performSegueWithIdentifier("Pizza", sender: self)
        
      //  navigationController?.pushViewController(SignUpViewController(), animated: true)
        self.performSegueWithIdentifier("ToSignUp", sender: self)
        
        print("To Sign Up")
        
    }
    
    
    @IBAction func PasswordRetrieve(sender: UIButton) {
        self.Username.resignFirstResponder()
        self.Password.resignFirstResponder()
        //performSegueWithIdentifier("Pizza", sender: self)
        navigationController?.pushViewController(PasswordRetrievViewController(), animated: true)
    }
    
    
    @IBOutlet weak var BottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var BottomConstraint2: NSLayoutConstraint!
    
    
    
    @IBAction func loginButton(sender: UIButton){
       
        PFFacebookUtils.logInInBackgroundWithReadPermissions(["email"], block: {(user: PFUser?, error: NSError?) -> Void in
            if let user = user {
                if user.isNew {
                    print("User signed up and logged in through Facebook!")
                self.dismissViewControllerAnimated(false, completion: nil)
    
                    
                    
                } else {
                    print("User logged in through Facebook!")
                    self.dismissViewControllerAnimated(false, completion: nil)

                }
            } else {
                print("Uh oh. The user cancelled the Facebook login.")
            }
        })
    }
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // animation of the logo
        
        let fullRotation = CGFloat(M_PI*2)
        let duration = 0.4
        let delay = 0.0
        let options = UIViewKeyframeAnimationOptions.CalculationModeLinear
        UIView.animateKeyframesWithDuration(duration, delay: delay, options: options, animations: {
            // each keyframe needs to be added here
            // within each keyframe the relativeStartTime and relativeDuration need to be values between 0.0 and 1.0
            
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 1/3, animations: {
                // start at 0.00s (5s × 0)
                // duration 1.67s (5s × 1/3)
                // end at   1.67s (0.00s + 1.67s)
                self.Logo.transform = CGAffineTransformMakeRotation(1/3 * fullRotation)
            })
            UIView.addKeyframeWithRelativeStartTime(1/3, relativeDuration: 1/3, animations: {
                self.Logo.transform = CGAffineTransformMakeRotation(2/3 * fullRotation)
            })
            UIView.addKeyframeWithRelativeStartTime(2/3, relativeDuration: 1/3, animations: {
                self.Logo.transform = CGAffineTransformMakeRotation(3/3 * fullRotation)
            })
            
            }, completion: {finished in
                // any code entered here will be applied
                // once the animation has completed
                
        })
    

        NSNotificationCenter.defaultCenter().addObserver(self,selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
    
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    
    }


   func adjustingHeight(show:Bool, notification:NSNotification) {
        
    var userInfo = notification.userInfo!
        
    let keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).CGRectValue()
        
    let animationDurarion = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSTimeInterval
        
    let changeInHeight = (CGRectGetHeight(keyboardFrame) + 20) * (show ? 1 : -1)
        UIView.animateWithDuration(animationDurarion, animations: { () -> Void in
        self.BottomConstraint.constant = (changeInHeight)-20
        self.BottomConstraint2.constant = (changeInHeight)-20
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
    
    
    func textFieldShouldBeginEditing(textField: UITextField, notification: NSNotification) -> Bool {
        return true
    }
    
    
    func textFieldDidBeginEditing(textField: UITextField) {
       
    }
    
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {  //delegate method
        
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        return false
    }
    
    
 
            
            
    func returnUserData()
    {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            if ((error) != nil)
            {
                // Process error
                print("Error: \(error)")
            }
            else
            {
                print("fetched user: \(result)")
                let userName : NSString = result.valueForKey("name") as! NSString
                print("User Name is: \(userName)")
                let userEmail : NSString = result.valueForKey("email") as! NSString
                print("User Email is: \(userEmail)")
            }
        })
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

    //Textfield log in
    
    func Login(){
        var user = PFUser()
        user.username=Username.text!
        user.password=Password.text!
        
        PFUser.logInWithUsernameInBackground(Username.text!, password: Password.text!, block: {(User:PFUser?,Error:NSError?) -> Void in
            if Error == nil{
              //  dispatch_async(dispatch_get_main_queue()){
        //    let Storyboard=UIStoryboard(name:"Main",bundle:nil)
       //     let MainVC : UIViewController = Storyboard.//instantiateViewControllerWithIdentifier("MainVC")
        //    self.presentViewController(MainVC, animated:true,completion: nil)
                
             //   }
                
                      self.dismissViewControllerAnimated(false, completion: nil)
            }
            else{
                
            NSLog("Wrong!!")
                
            self.displayErrorMessage("Wrong username or password!")
            }
            
        })
        
  
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
 
    
}



