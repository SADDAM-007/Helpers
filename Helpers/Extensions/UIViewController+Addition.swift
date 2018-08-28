//
//  UIViewController+Addition.swift
//  MyDrinks
//
//  Created by Santosh Rawani on 23/03/18.
//  Copyright © 2018 Santosh Rawani. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    class var storyboardID : String {
        return "\(self)"
    }
    
    static func instantiate(fromAppStoryboard appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
//    func barButton(image:UIImage,style:UIBarButtonItemStyle,action:Selector) -> UIBarButtonItem {
//        let button = UIBarButtonItem(image: image, style: style, target: self, action: action)
//        return button
//    }
//    func barButtonWithReveal(image:UIImage,style:UIBarButtonItemStyle,action:Selector) -> UIBarButtonItem {
//        let button = UIBarButtonItem(image: image, style: style, target: revealViewController(), action: action)
//        return button
//    }
}
