//
//  NotificationBannerManager.swift
//  ManagersDemo
//
//  Created by iOS Developer on 14/03/18.
//  Copyright © 2018 MobileCoderz. All rights reserved.
//

import UIKit
import NotificationBannerSwift

class NotificationBannerManager: NSObject {
    
     //++++++++++++++++++++++++++++
    
     // Notification banner with image in left side
     // if you want image in right side use rightView different method
    
     //++++++++++++++++++++++++++++

    public class func showBannerWithImage(title: String, subtitle: String,bannerStyle :BannerStyle, queuePosition :QueuePosition, bannerPosition:BannerPosition,image:String, bannerDelay:TimeInterval, onTap tapBlock: @escaping (() -> ())){
        
        let leftView = UIImageView(image:UIImage (named: image))
        let banner = NotificationBanner(title: title, subtitle: subtitle, leftView: leftView, style: bannerStyle)
        banner.duration = bannerDelay;
        banner.onTap = {
            
             //tap on banner
            banner.dismiss()
            tapBlock()
        }
        banner.onSwipeUp = {
            
            //swipe banner
            banner.dismiss()
            
        }
        banner.show(queuePosition:queuePosition, bannerPosition: bannerPosition)
        
    }
    
    
     //++++++++++++++++++++++++++++
    
     // Notification banner without image
    
     //++++++++++++++++++++++++++++
    
    public class func showBannerWithOutImage(title: String, subtitle: String,bannerStyle :BannerStyle, queuePosition :QueuePosition, bannerPosition:BannerPosition,bannerDelay:TimeInterval, onTap tapBlock: @escaping (() -> ())){
        
        let banner = NotificationBanner(title: title, subtitle: subtitle, style: bannerStyle)
        banner.duration = bannerDelay;
        banner.onTap = {
            
            //tap on banner
            banner.dismiss()
             tapBlock()
        }
        banner.onSwipeUp = {
            
            //swipe banner
            banner.dismiss()
        }
        banner.show(queuePosition:queuePosition, bannerPosition: bannerPosition)
    }
    
    
    
    
    
    
    
    //++++++++++++++++++++++++++++
    
    // Status Bar Notification Banner
    
    //++++++++++++++++++++++++++++
    
    public class func showBannerInStatusBar(title: String, bannerStyle :BannerStyle, queuePosition :QueuePosition, bannerPosition:BannerPosition,bannerDelay:TimeInterval){
        
        let banner = StatusBarNotificationBanner(title: title, style: bannerStyle)
         banner.duration = bannerDelay;
         banner.show(queuePosition:queuePosition, bannerPosition: bannerPosition)
        
    }
    
    
    //++++++++++++++++++++++++++++
    
    //  Notification Banner Below Navigation bar or on tab bar
    
    //++++++++++++++++++++++++++++
    
//    public class func showBannerOverTabBarOrUnderNavBar(title: String, bannerStyle :BannerStyle, queuePosition :QueuePosition, bannerPosition:BannerPosition,bannerDelay:TimeInterval,on viewController: UIViewController){
//
//        let banner = StatusBarNotificationBanner(title: title, style: bannerStyle)
//        banner.duration = bannerDelay;
//        banner.show(queuePosition:queuePosition, bannerPosition: bannerPosition,  on: viewController)
//
//    }
    
    
}
