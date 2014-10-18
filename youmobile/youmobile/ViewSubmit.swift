//
//  ViewSubmit.swift
//  youmobile
//
//  Created by saranpol on 10/19/2557 BE.
//  Copyright (c) 2557 hlpth. All rights reserved.
//

import UIKit

class ViewSubmit: UIViewController {

    @IBOutlet var mTextFieldName: UITextField!
    @IBOutlet var mTextFieldEmail: UITextField!
    @IBOutlet var mTextFieldPhone: UITextField!

    var mIsShowKeyboard = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

//        mTextField.font = UIFont(name: "Nexa Light", size: mTextField.font.pointSize)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    
    @IBAction func dismissKeyboard() {
        mTextFieldName.resignFirstResponder()
        mTextFieldEmail.resignFirstResponder()
        mTextFieldPhone.resignFirstResponder()
    }
    
    
    @IBAction func clickSubmit() {
//        let u = NSUserDefaults.standardUserDefaults()
//        u.setValue(NSKeyedArchiver.archivedDataWithRootObject(["asdf":"asdf"]), forKey: "x")
//        u.synchronize()
//        var x: AnyObject! = u.valueForKey("x")
//        println(NSKeyedUnarchiver.unarchiveObjectWithData(x as NSData))
        
        if(mTextFieldName.text == "" || mTextFieldEmail.text == "" || mTextFieldPhone.text == ""){
            return
        }
        let key = "SaveData"
        
        let u = NSUserDefaults.standardUserDefaults()
        var d: AnyObject? = API.loadData(key)
        
        var data: [AnyObject]!
        if(d == nil){
            data = [AnyObject]()
        }else{
            data = d as [AnyObject]
        }

        data.append(["name":mTextFieldName.text,
                    "email":mTextFieldEmail.text,
                    "phone":mTextFieldPhone.text])
        
        
        API.saveData(data, key: key)
        
        //println(API.loadData(key))
        
        
        performSegueWithIdentifier("GotoViewDone", sender: nil)
        
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if mIsShowKeyboard {
            return
        }
        
        mIsShowKeyboard = true
        let info = notification.userInfo!
        let frame = (info[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue()
        
        let y:CGFloat = 200//frame.size.height
        let f0 = self.view.frame
        let f:CGRect = CGRectMake(f0.origin.x, f0.origin.y-y, f0.size.width, f0.size.height)
        self.view.frame = f
    }
    
    func keyboardWillHide(notification: NSNotification) {
        mIsShowKeyboard = false
        
        let info = notification.userInfo!
        let frame = (info[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue()
        
        let y:CGFloat = 200//frame.size.height
        let f0 = self.view.frame
        let f:CGRect = CGRectMake(f0.origin.x, f0.origin.y+y, f0.size.width, f0.size.height)
        self.view.frame = f
    }

}
