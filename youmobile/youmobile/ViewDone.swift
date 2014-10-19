//
//  ViewDone.swift
//  youmobile
//
//  Created by saranpol on 10/19/2557 BE.
//  Copyright (c) 2557 hlpth. All rights reserved.
//

import UIKit

class ViewDone: UIViewController {

    @IBOutlet var mImageYou: UIImageView!
    @IBOutlet var mImageBg: UIImageView!
    @IBOutlet var mImageThx: UIImageView!
    @IBOutlet var mButtonBack: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        mImageThx.hidden = true
        mButtonBack.hidden = true
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        mImageThx.hidden = false
        mImageThx.alpha = 0
        
        
        UIView.animateWithDuration(0.7, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 3.0, options: UIViewAnimationOptions.CurveEaseOut, animations: ({
            self.mImageThx.alpha = 1.0
        }), completion: nil)
        
        
        mButtonBack.hidden = false
        mButtonBack.alpha = 0
        mButtonBack.layer.transform = CATransform3DMakeScale(0.5, 0.5, 1.0)
        UIView.animateWithDuration(0.8, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 3.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: ({
            self.mButtonBack.alpha = 1.0
            self.mButtonBack.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0)
        }), completion: nil)
    }
    
    
    func backToHome() {
        self.presentingViewController?.presentingViewController?.dismissViewControllerAnimated(false, completion: nil)
    }
    

    @IBAction func clickBack() {
        
        UIView.animateWithDuration(0.8, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 3.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: ({
            self.mButtonBack.alpha = 0
            self.mButtonBack.layer.transform = CATransform3DMakeScale(0.5, 0.5, 1.0)

            self.mImageBg.alpha = 0
            self.mImageBg.layer.transform = CATransform3DMakeScale(0.5, 0.5, 1.0)

            self.mImageThx.alpha = 0
            self.mImageThx.layer.transform = CATransform3DMakeScale(0.5, 0.5, 1.0)
            
        }), completion: nil)
        
        
        UIView.animateWithDuration(0.8, delay: 0.3, usingSpringWithDamping: 0.7, initialSpringVelocity: 3.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: ({
            self.mImageYou.frame = CGRectMake(35, 159, 698, 597)
        }), completion: {(value: Bool) in
            
            UIView.animateWithDuration(0.8, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 3.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: ({
                self.mImageYou.alpha = 0
                self.mImageYou.layer.transform = CATransform3DMakeScale(0, 0, 1.0)
                
            }), completion: {(value: Bool) in
                self.mImageYou.hidden = true
                self.backToHome()
                })
            
        })
        
        
    }

}
