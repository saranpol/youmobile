//
//  API.swift
//  youmobile
//
//  Created by saranpol on 10/19/2557 BE.
//  Copyright (c) 2557 hlpth. All rights reserved.
//

import UIKit

class API {

    class func saveData(data: AnyObject, key: String) {
        let u = NSUserDefaults.standardUserDefaults()
        u.setValue(NSKeyedArchiver.archivedDataWithRootObject(data), forKey: key)
        u.synchronize()
    }
    
    class func loadData(key: String) -> AnyObject? {
        let u = NSUserDefaults.standardUserDefaults()
        let data: AnyObject! = u.valueForKey(key)
        if data != nil {
            return NSKeyedUnarchiver.unarchiveObjectWithData(data as NSData)
        }
        return nil
    }
    
}
