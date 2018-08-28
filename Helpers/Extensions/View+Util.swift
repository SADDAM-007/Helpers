//
//  Button+Util.swift
//  SwiftDemo
//
//  Created by iOS Developer on 03/12/17.
//  Copyright © 2017 MobileCoderz. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func setViewCornerRadius(radius:CGFloat) -> () {
        self.layer.cornerRadius = radius
        //self.clipsToBounds = true
    }
    
    func setViewCornerRadiusAndBorderWidthColor(radius:CGFloat, andBorderWidth width:CGFloat, andBorderColor color:CGColor) -> () {
        
        self.layer.cornerRadius = radius
        self.layer.borderColor = color
        self.layer.borderWidth = width
        self.clipsToBounds = true
    }
    
    func setInnerBorderInViewBorderWidth(width:CGFloat,andColor color:CGColor,cornerRadius radius:CGFloat,distanceFromX fromX:Int, fromY:Int) -> () {
        
        let rect = CGRect(x:fromX ,y:fromY, width:Int(self.frame.size.width) - 2*fromX,height:Int(self.frame.size.height) - 2*fromY)
        
        let borderView = UIView(frame:rect)
        borderView.backgroundColor = UIColor.clear
        borderView.layer.borderWidth = width
        borderView.layer.cornerRadius = radius
        borderView.layer.borderColor = color
        borderView.isUserInteractionEnabled = false
        self.addSubview(borderView)
    }
    
    func setDropShadowOnViewWithColor(color:CGColor, andOpacity opacity:Float,andradius radius:CGFloat, andOffset offset:CGSize) -> () {
        self.layer.shadowColor = color
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
    }
    
    // Produce horizontal shake animation
    func shakeHorizontally(withCount count: Float = 4, duration: TimeInterval = 0.3, translation: Float = -10) {
        
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.repeatCount = count
        animation.duration = (duration)/TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.byValue = translation
        layer.add(animation, forKey: "shake")
        
    }
    
    /// Produce vertical shake animation
    func shakeVertically(withCount count: Float = 4, duration: TimeInterval = 0.3, translation: Float = -10) {
        
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "transform.translation.y")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.repeatCount = count
        animation.duration = (duration)/TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.byValue = translation
        layer.add(animation, forKey: "shake")
        
    }
    
    /// Produce fade in animation
    func fadeIn(_ duration: TimeInterval = 1.0, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0
        }, completion: completion)
    }
    
    /// Produce fadeout animation
    func fadeOut(_ duration: TimeInterval = 1.0, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.alpha = 0.0
        }, completion: completion)
    }
    
    func rotate360Degrees(_ duration: CFTimeInterval = 3.0, completionDelegate: CAAnimationDelegate? = nil) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(Double.pi * 4.0)
        rotateAnimation.duration = duration
        
        if let delegate: CAAnimationDelegate = completionDelegate {
            rotateAnimation.delegate = delegate
        }
        self.layer.add(rotateAnimation, forKey: nil)
    }
}
