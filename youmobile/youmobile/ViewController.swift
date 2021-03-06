//
//  ViewController.swift
//  youmobile
//
//  Created by saranpol on 10/19/2557 BE.
//  Copyright (c) 2557 hlpth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mImageYou: UIImageView!
    @IBOutlet var mButtonRegister: UIButton!
    @IBOutlet var mButtonRegisterPress: UIButton!

    var mIsPress: Bool = false
    var mRectYou: CGRect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        mRectYou = mImageYou.frame
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func viewWillAppear(animated: Bool) {
        mImageYou.hidden = true
        mButtonRegister.hidden = true
        mButtonRegisterPress.hidden = true
        mImageYou.alpha = 0
        mButtonRegister.alpha = 0
        mButtonRegisterPress.alpha = 0
        
        mImageYou.frame = mRectYou
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        mImageYou.hidden = false
        mImageYou.alpha = 0
        mImageYou.layer.transform = CATransform3DMakeScale(0.5, 0.5, 1.0)
        UIView.animateWithDuration(0.8, delay: 0.4, usingSpringWithDamping: 0.4, initialSpringVelocity: 3.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: ({
            self.mImageYou.alpha = 1.0
            self.mImageYou.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0)
        }), completion: nil)

        

        mButtonRegisterPress.hidden = false
        mButtonRegisterPress.alpha = 0
        mButtonRegisterPress.layer.transform = CATransform3DMakeScale(0.5, 0.5, 1.0)

        UIView.animateWithDuration(0.8, delay: 0.6, usingSpringWithDamping: 0.4, initialSpringVelocity: 3.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: ({
            self.mButtonRegisterPress.alpha = 1.0
            self.mButtonRegisterPress.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0)
        }), completion: nil)

        

        mButtonRegister.hidden = false
        mButtonRegister.alpha = 0
        mButtonRegister.layer.transform = CATransform3DMakeScale(0.5, 0.5, 1.0)

        UIView.animateWithDuration(0.8, delay: 0.9, usingSpringWithDamping: 0.4, initialSpringVelocity: 3.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: ({
            self.mButtonRegister.alpha = 1.0
            self.mButtonRegister.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0)
        }), completion: nil)

    }
    
    func gotoViewSubmit() {
        //        UIView.animateWithDuration(1.0, animations: ({
        //            self.mImageYou.layer.transform = CATransform3DMakeTranslation(0, 0, 0)
        //        }), completion: nil)
        
        
        UIView.animateWithDuration(0.8, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 3.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: ({
            self.mImageYou.frame = CGRectMake(-15, -8, 576, 509)
        }), completion: nil)
        
        
        
        UIView.animateWithDuration(0.8, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 3.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: ({
            self.mButtonRegisterPress.alpha = 0.0
            self.mButtonRegisterPress.layer.transform = CATransform3DMakeScale(0.5, 0.5, 1.0)
        }), completion: {(value: Bool) in
            //self.performSegueWithIdentifier("GotoViewSubmit", sender: nil)
        })
        
        UIView.animateWithDuration(0.8, delay: 0.5, usingSpringWithDamping: 0.4, initialSpringVelocity: 3.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: ({
            self.mButtonRegister.alpha = 0.0
            self.mButtonRegister.layer.transform = CATransform3DMakeScale(0.5, 0.5, 1.0)
        }), completion: {(value: Bool) in
            self.performSegueWithIdentifier("GotoViewSubmit", sender: nil)
        })
    }
    
    
    @IBAction func clickRegister() {
        mIsPress = false
        gotoViewSubmit();
    }
    
    
    @IBAction func clickRegisterPress() {
        mIsPress = true
        gotoViewSubmit();
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "GotoViewSubmit"){
            let v:ViewSubmit = segue.destinationViewController as ViewSubmit
            v.mIsPress = mIsPress
        }
    }
    
}

