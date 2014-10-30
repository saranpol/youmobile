//
//  ViewData.swift
//  youmobile
//
//  Created by saranpol on 10/19/2557 BE.
//  Copyright (c) 2557 hlpth. All rights reserved.
//

import UIKit

class ViewData: UIViewController {
    
    @IBOutlet var mWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let key = "SaveData"
        
        let u = NSUserDefaults.standardUserDefaults()
        var d: AnyObject? = API.loadData(key)
        
        var data: [AnyObject]!
        if(d == nil){
            return
        }else{
            data = d as [AnyObject]
        }
        
        var html = "<html><body><table border=1>"
        
        html += "<tr>"
        html += "<td>NAME</td>"
        html += "<td>EMAIL</td>"
        html += "<td>PHONE NUMBER</td>"
        html += "<td>TYPE</td>"
        html += "<td>COMPANY</td>"
        html += "</tr>"
        
        for p in data {
            html += "<tr>"
            html += "<td>" + (p["name"] as String) + "</td>"
            html += "<td>" + (p["email"] as String) + "</td>"
            html += "<td>" + (p["phone"] as String) + "</td>"
            html += "<td>" + (p["type"] as String) + "</td>"
            html += "<td>" + (p["company"] as String) + "</td>"
            html += "</tr>"
        }
        

        
        html += "</table></body></html>"
        
        mWebView.loadHTMLString(html, baseURL: nil)
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func clickBack() {
        navigationController?.popToRootViewControllerAnimated(true)
    }

}
