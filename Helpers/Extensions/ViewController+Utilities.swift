//
//  ViewController+Utilities.swift
//  ManagersDemo
//
//  Created by iOS Developer on 07/03/18.
//  Copyright © 2018 MobileCoderz. All rights reserved.
//

import UIKit
import Toast_Swift
import MBProgressHUD

extension UIViewController {
    
    func showToast(message:String) {
        self.view.makeToast(message)
    }
    
    func showLoader() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    
    func hideLoader() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func showHud(_ message: String) {
        
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = message
        hud.label.textColor = UIColor.white
        hud.bezelView.color = UIColor.black
        hud.isUserInteractionEnabled = false
    }
    
    func hideHUD() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func showAlert(title: String?, message: String?, actionTitles:[String?], actionStyles:[UIAlertActionStyle], actions:[((UIAlertAction) -> Void)?]) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        for (index, title) in actionTitles.enumerated() {
 
            let action = UIAlertAction(title: title, style:actionStyles[index], handler: actions[index])
            alert.addAction(action)
        }
       self.present(alert, animated: true, completion: nil)
        
        
        // call like this
//        self.popupAlert(title: "Title", message: " Oops, xxxx ", actionTitles: ["Option1","Option2","Option3"], actionsStyles:[UIAlertActionStyle.destructive.rawValue,UIAlertActionStyle.default.rawValue,,UIAlertActionStyle.default.rawValue] 
    }
}



