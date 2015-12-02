//
//  ViewController.swift
//  FreedomHouse
//
//  Created by Mark Li  on 11/10/15.
//  Copyright © 2015 Mark Li . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //properties
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func login(sender: AnyObject) {
        self.username.resignFirstResponder()
        self.password.resignFirstResponder()
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        username.delegate = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: self.view.window);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func keyboardWillShow(sender: NSNotification) {
        let userInfo: [NSObject : AnyObject] = sender.userInfo!
        let keyboardSize: CGSize = userInfo[UIKeyboardFrameBeginUserInfoKey]!.CGRectValue.size
        let offset: CGSize = userInfo[UIKeyboardFrameBeginUserInfoKey]!.CGRectValue.size
        
        if keyboardSize.height == offset.height {
            UIView.animateWithDuration(0.1, animations:{() -> Void in self.view.frame.origin.y -= keyboardSize.height 
            
            })
        } else {
            UIView.animateWithDuration(0.1, animations: { () -> Void in self.view.frame.origin.y += keyboardSize.height-offset.height
            })
        }
    }
        
    
    
    func KeyboardWillHide(sender: NSNotification) {
        let userInfo: [NSObject : AnyObject] = sender.userInfo!
        let keyboardSize: CGSize = userInfo[UIKeyboardFrameBeginUserInfoKey]!.CGRectValue.size
        self.view.frame.origin.y += keyboardSize.height
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func DismissKeyBoard(){
        view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
    }
    
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {  //delegate method
    return false
    }
    
    
    
    
    
    
}

