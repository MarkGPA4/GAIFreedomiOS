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



class SignUpViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate{

    
    @IBOutlet weak var Firstname: UITextField!
    @IBOutlet weak var Lastname: UITextField!
    @IBOutlet weak var Age: UITextField!
    
    @IBOutlet weak var Gender: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var School: UITextField!
    @IBOutlet weak var SchoolYear: UITextField!
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var ErrorMessage: UILabel!
    
    
    
    
    @IBAction func SignUp(sender: AnyObject) {
        SignUp()
    }
    
    @IBAction func Back(sender: AnyObject) {
       self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    var data = ["Male","Female"]
    var picker = UIPickerView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate=self
        picker.dataSource=self
        Gender.inputView=picker
        }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
    
    func numberOfComponentsInPickerView(pickerView:UIPickerView) -> Int{return 1}
    
    func pickerView(pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int {
    return data.count
    }
    func pickerView(_: UIPickerView, didSelectRow row: Int, inComponent component:Int){
        Gender.text=data[row]
    }
    func pickerView(_: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
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
    

    func SignUp() {
        
        var user = PFUser()
        user.username=Username.text!
        user.password=Password.text!
        user.email=Email.text!
        
        user.signUpInBackgroundWithBlock {(success:Bool,error:NSError?)-> Void in
            
            if error==nil {
                if (user["firstname"]==nil) || (user["lastname"]==nil) || (user["school"]==nil) || (user["school_year"]==nil) || (user["age"]==nil) || (user["gender"] == nil) {self.ErrorMessage.text="fill it up!"}
                    
                else {
                    
                    user["firstname"]=self.Firstname.text!
                    user["lastname"]=self.Lastname.text!
                    user["school"]=self.School.text!
                    user["school_year"]=Int(self.SchoolYear.text!)
                    user["age"]=Int(self.Age.text!)
                    user["gender"]=self.Gender.text!
                
                    self.dismissViewControllerAnimated(true, completion: nil)}
            }
                
            else
            {
                    let errorMessage: String = error!.userInfo["error"] as! String
                    self.displayErrorMessage(errorMessage)
            }
        
        }
    }

}
