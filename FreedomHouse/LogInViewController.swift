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
    
    @IBOutlet weak var Username: UITextField!
    
    @IBOutlet weak var Password: UITextField!
    
    @IBOutlet weak var ErrorMessage: UILabel!
    
    
    @IBAction func Login(sender: UIButton) {
        
        self.Username.resignFirstResponder()
        self.Password.resignFirstResponder()
        Login()
        
    }
    
    @IBAction func SignUp(sender: AnyObject) {
        self.Username.resignFirstResponder()
        self.Password.resignFirstResponder()
        //performSegueWithIdentifier("Pizza", sender: self)
        presentViewController(SignUpViewController(), animated: true, completion: nil)
    }

    
    @IBAction func PasswordRetrieve(sender: AnyObject) {
        self.Username.resignFirstResponder()
        self.Password.resignFirstResponder()
        //performSegueWithIdentifier("Pizza", sender: self)
        presentViewController(PasswordRetrievViewController(), animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var BottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var BottomConstraint2: NSLayoutConstraint!
    
    
    
    @IBAction func loginButton(sender: AnyObject){
       
        PFFacebookUtils.logInInBackgroundWithReadPermissions(["email"], block: {(user: PFUser?, error: NSError?) -> Void in
            if let user = user {
                if user.isNew {
                    print("User signed up and logged in through Facebook!")
                } else {
                    print("User logged in through Facebook!")
                }
            } else {
                print("Uh oh. The user cancelled the Facebook login.")
            }
        })
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
    //    var loginView : FBSDKLoginButton = FBSDKLoginButton()
     //   self.view.addSubview(loginView)
        
     //   need further revision
    //  loginView.frame = CGRectMake(100, 400, loginView.frame.size.width, loginView.frame.size.height)
        
        
    //  loginView.readPermissions = ["public_profile", "email", "user_friends"]
   //   loginView.delegate = self
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
    
    
    // log in with Facebook
    


    
    //PFFacebookUtils.logInInBackgroundWithPublishPermissions(["publish_actions"],block:{
  //          (user: PFUser?, error: NSError?) -> Void in
    //        if user != nil {
                // Your app now has publishing permissions for the user
     //       }
     //   })
    
    //}
            
            
        // print("User Logged In")
//  PFFacebookUtils.logInInBackgroundWithPublishPermissions(["public_profile","email"], block: {(user:PFUser?,error:NSError?) -> Void in
 //               if (error != nil)
   //             {
     //               let myAlert=UIAlertController(title:"Alert",message:error?.localizedDescription, preferredStyle:UIAlertControllerStyle.Alert);
       //             let okAction=UIAlertAction(title:"Ok",style:UIAlertActionStyle.Default, handler:nil)
         //           myAlert.addAction(okAction);
           //         self.presentViewController(myAlert, animated: true, completion: nil);
             //       return
               // }
      //      print(user)
        //    print("Current user token=\(FBSDKAccessToken.currentAccessToken().tokenString)")
          //  print("Current user id \(FBSDKAccessToken.currentAccessToken().userID)")
            
       //     if(FBSDKAccessToken.currentAccessToken() != nil)
         //   {
         //   let HomePage=self.storyboard?.instantiateViewControllerWithIdentifier("HomePage") as! HomePageViewController
        //    let HomePageNav = UINavigationController(rootViewController:HomePage)
            
        //    let appDelegate=UIApplication.sharedApplication().delegate as! AppDelegate
                
        //    appDelegate.window?.rootViewController=HomePage
                
        //    }
            
            
            
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
    
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
    }
    
    
    

    //Textfield log in
    
    func Login(){
        var user = PFUser()
        user.username=Username.text!
        user.password=Password.text!
        
        PFUser.logInWithUsernameInBackground(Username.text!, password: Password.text!, block: {(User:PFUser?,Error:NSError?) -> Void in
            if Error == nil{
                dispatch_async(dispatch_get_main_queue()){
            let Storyboard=UIStoryboard(name:"Main",bundle:nil)
            let MainVC : UIViewController = Storyboard.instantiateViewControllerWithIdentifier("MainVC")
            self.presentViewController(MainVC, animated:true,completion: nil)
                
                }
            }
            else{
                
            NSLog("Wrong!!")
                
            self.ErrorMessage.text="Wrong username or password!"
                
            }
            
        })
    
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
        
}



