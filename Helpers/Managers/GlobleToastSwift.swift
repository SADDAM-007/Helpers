//
//  ToastSwiftGloble.swift
//  ManagersDemo
//
//  Created by iOS Developer on 07/03/18.
//  Copyright © 2018 MobileCoderz. All rights reserved.
//

import UIKit
import Toast_Swift

class ToastSwiftGloble: NSObject {

    
    class func showToast(message:String) {
        let window  = UIApplication.shared.windows.last
        (window!.rootViewController?.view)!.makeToast(message)
    }
}
