//
//  MBProgressManager.swift
//  ManagersDemo
//
//  Created by iOS Developer on 28/02/18.
//  Copyright © 2018 MobileCoderz. All rights reserved.
//

import UIKit
import MBProgressHUD

class MBProgressGloble: NSObject {

    
    class func showProgressHUDOnWindow(){
        
        let window  = UIApplication.shared.windows.last
        MBProgressHUD.showAdded(to: (window!.rootViewController?.view)!, animated: true)
 
    }
    
    class func hideProgressHUDfromWindow(){
        let window  = UIApplication.shared.windows.last
        MBProgressHUD.hide(for: (window!.rootViewController?.view)!, animated: true)
    }
    
    
    
}
