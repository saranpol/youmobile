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

    @IBOutlet var mViewName: UIView!
    @IBOutlet var mViewEmail: UIView!
    @IBOutlet var mViewPhone: UIView!
    
    @IBOutlet var mImageBG: UIImageView!
    @IBOutlet var mButtonSubmit: UIButton!

    
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
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        mViewName.hidden = true
        mViewEmail.hidden = true
        mViewPhone.hidden = true
        
        mImageBG.hidden = true
        mButtonSubmit.hidden = true
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        mImageBG.hidden = false
        mImageBG.alpha = 0.8
        mImageBG.layer.transform = CATransform3DMakeScale(0.8, 0.8, 1.0)
        UIView.animateWithDuration(0.7, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 3.0, options: UIViewAnimationOptions.CurveEaseOut, animations: ({
            self.mImageBG.alpha = 1.0
            self.mImageBG.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0)
        }), completion: nil)
        
        mViewName.hidden = false
        mViewEmail.hidden = false
        mViewPhone.hidden = false
        mViewName.alpha = 0
        mViewEmail.alpha = 0
        mViewPhone.alpha = 0

        
        UIView.animateWithDuration(0.7, delay: 0.4, usingSpringWithDamping: 0.5, initialSpringVelocity: 3.0, options: UIViewAnimationOptions.CurveEaseOut, animations: ({
            self.mViewName.alpha = 1.0
        }), completion: nil)
        UIView.animateWithDuration(0.7, delay: 0.6, usingSpringWithDamping: 0.5, initialSpringVelocity: 3.0, options: UIViewAnimationOptions.CurveEaseOut, animations: ({
            self.mViewEmail.alpha = 1.0
        }), completion: nil)
        UIView.animateWithDuration(0.7, delay: 0.8, usingSpringWithDamping: 0.5, initialSpringVelocity: 3.0, options: UIViewAnimationOptions.CurveEaseOut, animations: ({
            self.mViewPhone.alpha = 1.0
        }), completion: nil)
        
        
        
        mButtonSubmit.hidden = false
        mButtonSubmit.alpha = 0
        mButtonSubmit.layer.transform = CATransform3DMakeScale(0.5, 0.5, 1.0)
        UIView.animateWithDuration(0.8, delay: 1.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 3.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: ({
            self.mButtonSubmit.alpha = 1.0
            self.mButtonSubmit.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0)
        }), completion: nil)
    }
    
    
    
    
    @IBAction func clickSubmit() {
        dismissKeyboard()
        
        if(mTextFieldName.text == ""){
            return
        }
        
        if(mTextFieldEmail.text == "" && mTextFieldPhone.text == ""){
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

        UIView.animateWithDuration(0.7, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 3.0, options: UIViewAnimationOptions.CurveEaseOut, animations: ({
            self.mViewName.alpha = 0
            self.mViewPhone.alpha = 0
            self.mViewEmail.alpha = 0
        }), completion: nil)
        
        
        
        UIView.animateWithDuration(0.8, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 3.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: ({
            self.mButtonSubmit.alpha = 0
            self.mButtonSubmit.layer.transform = CATransform3DMakeScale(0.5, 0.5, 1.0)
        }), completion: {(value: Bool) in
            self.performSegueWithIdentifier("GotoViewDone", sender: nil)
        })
        
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if mIsShowKeyboard {
            return
        }
        
        mIsShowKeyboard = true
        let info = notification.userInfo!
        let frame = (info[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue()
        
        UIView.animateWithDuration(0.5, animations: ({
            let y:CGFloat = 200//frame.size.height
            let f0 = self.view.frame
            let f:CGRect = CGRectMake(f0.origin.x, f0.origin.y-y, f0.size.width, f0.size.height)
            self.view.frame = f
        }), completion: nil)
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        mIsShowKeyboard = false
        
        let info = notification.userInfo!
        let frame = (info[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue()

        UIView.animateWithDuration(0.5, animations: ({
            let y:CGFloat = 200//frame.size.height
            let f0 = self.view.frame
            let f:CGRect = CGRectMake(f0.origin.x, f0.origin.y+y, f0.size.width, f0.size.height)
            self.view.frame = f
        }), completion: nil)
    }

}
