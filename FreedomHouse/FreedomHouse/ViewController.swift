//
//  ViewController.swift
//  FreedomHouse
//
//  Created by Mark Li  on 11/10/15.
//  Copyright © 2015 Mark Li . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        
        
        
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
        
    
    
    func overrideWillHide(sender: NSNotification) {
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
    
    
    
    
    
    
}

