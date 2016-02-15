//
//  SignUpViewController.swift
//  FreedomHouse
//
//  Created by Mark Li  on 12/29/15.
//  Copyright © 2015 Mark Li . All rights reserved.
//

import UIKit
import Parse
import Bolts



class SignUpViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate{

    
    @IBOutlet weak var Firstname:UITextField!
    @IBOutlet weak var Lastname: UITextField!
    @IBOutlet weak var Age: UITextField!
    
    @IBOutlet weak var Gender: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var School: UITextField!
    @IBOutlet weak var SchoolYear: UITextField!
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Password: UITextField! = nil
    
    
    @IBOutlet weak var TopConstraint1: NSLayoutConstraint!
    @IBOutlet weak var TopConstraint2: NSLayoutConstraint!
    
    // Password Strenght Checker//////////////////////
    
    @IBOutlet weak var PasswordStrength: UILabel! = nil
    
    @IBOutlet weak var ValidationLabel: UILabel! = nil
    
    private var validator: NJOPasswordValidator! = nil
    
    @IBAction func passwordChanged(sender: UITextField)
    {
        checkPassword()
        
    }
    
    //////////////////////////////////////////////////
    
    
    @IBAction func SignUp(sender: AnyObject) {
        SignUp()

    }
    
  
    
    
    
    var data = ["Male","Female"]
    var picker = UIPickerView()
    var data2 = ["7","8","9","10","11","12","13","14","15","16","17","18","19","20","21"]
    var picker2 = UIPickerView()
    var data3 = ["Freshman","Sophomore","Junior","Senior","I am in College"]
    var picker3 = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //input picker view for fields "Gender","Age","School Year"
        picker = UIPickerView()
        picker2 = UIPickerView()
        picker3 = UIPickerView()
        
        picker.delegate=self
        //picker.dataSource=self
        Gender.inputView=picker
        
        picker2.delegate=self
        //picker2.dataSource=self
        Age.inputView=picker2
        
        picker3.delegate=self
        //picker3.dataSource=self
        SchoolYear.inputView=picker3
        

        
        picker.tag = 0
        picker2.tag = 2
        picker3.tag = 3
    
        //For moving up things with keyboard
        NSNotificationCenter.defaultCenter().addObserver(self,selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        
        //Password strength checker
        
        validator = NJOPasswordValidator.standardValidator()
      
        PasswordMeter.setProgress(0.0, animated: false)
        
    }
    
    //"School","Username","Password" fields
    
    func adjustingHeight(show:Bool, notification:NSNotification) {
        
        var userInfo = notification.userInfo!
        
        let animationDurarion = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSTimeInterval
        
        UIView.animateWithDuration(animationDurarion, animations: { () -> Void in
            self.TopConstraint1.constant = -60
            self.TopConstraint2.constant = -60
        })
    }
    
    func RecoverHeight(show:Bool, notification:NSNotification) {
        
        var userInfo = notification.userInfo!
        
        let animationDurarion = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSTimeInterval
        
        UIView.animateWithDuration(animationDurarion, animations: { () -> Void in
            self.TopConstraint1.constant = 70
            self.TopConstraint2.constant = 70
        })
    }
    
    func keyboardWillShow(notification:NSNotification) {
        if (self.Username.isFirstResponder() == true)||(self.Password.isFirstResponder() == true)||(self.SchoolYear.isFirstResponder() == true) {
        adjustingHeight(true, notification: notification)
        }
    }
    
    func keyboardWillHide(notification:NSNotification) {
        
        RecoverHeight(true, notification: notification)
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
    
    func numberOfComponentsInPickerView(pickerView:UIPickerView) -> Int{return 1}
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 0 {
            return data.count
        } else if pickerView.tag == 2 {
            return data2.count
        } else if pickerView.tag == 3 {
            return  data3.count
        }
        return 1
    
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component:Int){
        if pickerView.tag == 0 {
            Gender.text = data[row]
        } else if pickerView.tag == 2 {
            Age.text = data2[row]
        } else if pickerView.tag == 3 {
            SchoolYear.text = data3[row]
        }
        
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 0 {
            return data[row]
        } else if pickerView.tag == 2 {
            return data2[row]
        } else if pickerView.tag == 3 {
            return data3[row]
        }
        return ""
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
    

    func SignUp() {
        
        let user = PFUser()
        user.username=Username.text!
        user.password=Password.text!
        user.email=Email.text!
        
        user.signUpInBackgroundWithBlock {(success:Bool,error:NSError?)-> Void in
            
            if error==nil {
                if (self.Firstname.text==nil)
                    || (self.Lastname.text==nil) || (self.School.text==nil) || (self.SchoolYear.text==nil) || (self.Age.text==nil) || (self.Gender.text==nil)
                     {
                    //let errorMessage: String = error!.userInfo["error"] as! String
                    
                    self.displayErrorMessage("Please provide missing info")
                        
                }
                    
                else {
                    
                    user["firstname"]=self.Firstname.text!
                    user["lastname"]=self.Lastname.text!
                    user["school"]=self.School.text!
                    user["school_year"]=self.SchoolYear.text!
                    user["age"]=Int(self.Age.text!)
                    user["gender"]=self.Gender.text!
                
                self.navigationController?.pushViewController(UploadImageViewController(), animated: true)
                
            }
                
                
            }
                
            else
            {
                    let errorMessage: String = error!.userInfo["error"] as! String
                    self.displayErrorMessage(errorMessage)
            }
        }
    }

    //password meter
    @IBOutlet weak var PasswordMeter: UIProgressView!
    
    
    
    private func checkPassword()
    {
        PasswordStrength.text = Navajo.localizedStringForPasswordStrength(Navajo.strengthOfPassword(Password.text!))
        
        var failingRules = validator.validatePassword(Password.text!)
        
        if failingRules == nil
        {
            ValidationLabel.textColor = UIColor.greenColor()
            ValidationLabel.text = "Valid"
        }
        else
        {
            var errorMessage = ""
            
            for var i = 0; i < failingRules!.count; i++
            {
                if i > 1
                {
                    errorMessage += ("\n" + failingRules![i].localizedErrorDescription())
                }
                else
                {
                    errorMessage += failingRules![i].localizedErrorDescription()
                }
            }
            
            ValidationLabel.textColor = UIColor.redColor()
            ValidationLabel.text = errorMessage
        }
        
        if PasswordStrength.text == "Very Weak" {
            self.PasswordMeter.setProgress(0.05, animated: true)
        }
        
        
        else if PasswordStrength.text == "Weak" {
        self.PasswordMeter.setProgress(0.4, animated: true)
        }
        
        else if PasswordStrength.text == "Reasonable" {
            
            self.PasswordMeter.setProgress(0.6, animated: true)
        }
            
            
        else if PasswordStrength.text == "Strong" {
        self.PasswordMeter.setProgress(0.8, animated: true)
        }
            
        else if PasswordStrength.text == "Very Strong"{
        self.PasswordMeter.setProgress(1.0, animated: true)
        }
        
       
            
        else {
        self.PasswordMeter.setProgress(0.0, animated: true)
            
        }
        
        
        
        
        
        
    }

    
    

    
    
    
}
