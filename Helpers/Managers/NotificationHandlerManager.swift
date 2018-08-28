//
//  NotificationHandlerManager.swift
//  ManagersDemo
//
//  Created by iOS Developer on 08/03/18.
//  Copyright © 2018 MobileCoderz. All rights reserved.
//

import UIKit

class NotificationHandlerManager: NSObject {

    
    class func notificationUserInfoData(info : NSDictionary){
        let apsJson = info["aps"] as? NSDictionary
        if let notiType  = apsJson?["notification_type"] as? Int{
           
            NotificationHandlerManager.navigateOnController(notificationType: notiType)
        }        
    }
    
    
    class func navigateOnController(notificationType:Int){
        
        let type: Int = notificationType
        switch type {
        case 1:
            break
        case 2:
            break
        default:
            print("")
            break
        }
        
    }
 
}
