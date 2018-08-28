//
//  Notification+NotificationHandler.swift
//  ManagersDemo
//
//  Created by iOS Developer on 07/03/18.
//  Copyright © 2018 MobileCoderz. All rights reserved.
//

import UIKit
import UserNotifications

extension AppDelegate : UNUserNotificationCenterDelegate {
    
    func registerForRemoteNotification() {
        
        if #available(iOS 10.0, *) {
            let center  = UNUserNotificationCenter.current()
            center.delegate = self
            center.requestAuthorization(options: [.sound, .alert, .badge]) { (granted, error) in
                if granted{
                     print("Permission granted")
                    
                } else {
                    print("User Notification permission denied: \(String(describing: error?.localizedDescription))")
                }
            }
        }
        else {
            UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: [.sound, .alert, .badge], categories: nil))
            UIApplication.shared.registerForRemoteNotifications()
        }
    }
    
    
    
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {

        let deviceTokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
        print("APNs device token: \(deviceTokenString)")
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register for remote notifications: \(error.localizedDescription)")
    }
    
    
    
    //for displaying notification when app is in foreground
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        print("User Info = ",notification.request.content.userInfo)
        
        let info = notification.request.content.userInfo as NSDictionary
        let apsJson = info["aps"] as! NSDictionary
        
         NotificationHandlerManager.notificationUserInfoData(info: apsJson)
        
    }
    
    // For handling tap and user actions
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        print("User Info = ",response.notification.request.content.userInfo)
        
        let info = response.notification.request.content.userInfo as NSDictionary
        let apsJson = info["aps"] as! NSDictionary
        
        NotificationHandlerManager.notificationUserInfoData(info: apsJson)
        
        
    }
    

    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        
        if application.applicationState == .active {
            //write your code here when app is in foreground
            
            
        } else {
            //write your code here for other state
             let info = userInfo as NSDictionary
             let apsJson = info["aps"] as! NSDictionary
             NotificationHandlerManager.notificationUserInfoData(info: apsJson)
            
        }
    }

    
    
    @available(iOS 10.0, *)
    func getNotificationSettings() {
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            print("Notification settings: \(settings)")
            guard settings.authorizationStatus == .authorized else { return }
            UIApplication.shared.registerForRemoteNotifications()
        }
    }
    
    
    func showPermissionAlert() {
        let alert = UIAlertController(title: "Error", message: "Please enable access to Notifications in the Settings app.", preferredStyle: .alert)
        
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { (alertAction) in
            self.gotoAppSettings()
            alert.dismiss(animated: false, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addAction(settingsAction)
        alert.addAction(cancelAction)
        
        window?.rootViewController?.present(alert, animated: true, completion: nil)
        
    }
    
    private func gotoAppSettings() {
        
        guard let settingsUrl = URL(string: UIApplicationOpenSettingsURLString) else {
            return
        }
        
        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.openURL(settingsUrl)
        }
    }
    
}
