//
//  Button+Util.swift
//  SwiftDemo
//
//  Created by iOS Developer on 03/12/17.
//  Copyright © 2017 MobileCoderz. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    
    
    func setButtonCornerRadius(radius:CGFloat) -> () {
        
        self.layer.cornerRadius = radius
        
    }
    
  
    func setButtonCornerRadiusAndBorderWidthColor(radius:CGFloat, andBorderWidth width:CGFloat, andBorderColor color:CGColor) -> () {
        
        self.layer.cornerRadius = radius
        self.layer.borderColor = color 
        self.layer.borderWidth = width
        self.clipsToBounds = true
        
    }
    
    
    
    func setInnerBorderInButtonBorderWidth(width:CGFloat,andColor color:CGColor,cornerRadius radius:CGFloat,distanceFromX fromX:Int, fromY:Int) -> () {
        
        let rect = CGRect(x:fromX ,y:fromY, width:Int(self.frame.size.width) - 2*fromX,height:Int(self.frame.size.height) - 2*fromY)
        
        let borderView = UIView(frame:rect)
        borderView.backgroundColor = UIColor.clear
        borderView.layer.borderWidth = width
        borderView.layer.cornerRadius = radius
        borderView.layer.borderColor = color
        borderView.isUserInteractionEnabled = false
        self.addSubview(borderView)
        
 
    }
    
    
    func setDropShadowOnButtonWithColor(color:CGColor, andOpacity opacity:Float,andradius radius:CGFloat, andOffset offset:CGSize) -> () {
        
        self.layer.shadowColor = color
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        
        
    }
    
    
    
}
