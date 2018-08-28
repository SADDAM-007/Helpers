//
//  Button+Util.swift
//  SwiftDemo
//
//  Created by Vipin Yadav on 19/07/18.
//  Copyright © 2018 Coineption. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    // email validation

    func isValidEmail() -> Bool {
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'\"*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: self)
        
        return result
    }

    // phone validation
    
    func isValidPhone() -> Bool {
        let PHONE_REGEX = "^[0-9]{2,14}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: self)
        return result
    }
    
    // userName validation
    
    func isValidUserName() -> Bool {
        let PHONE_REGEX = "^[a-zA-Z0-9. @!#$%&'\"*+/=?_`~-]+$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: self)
        return result
    }
    
    // name  validation
    
    func isValidName() -> Bool {
        let PHONE_REGEX = "^[a-zA-Z. '-]{3,40}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: self)
        return result
    }

    func removeWhiteSpace(strName : String) -> String {
        let trimmedString = strName.trimmingCharacters(in: .whitespaces)
        return trimmedString
    }
    
    func deleteHTMLTag(tag:String) -> String {
        return self.replacingOccurrences(of: "(?i)</?\(tag)\\b[^<]*>", with: "", options: .regularExpression, range: nil)
    }
    
    func deleteHTMLTags(tags:[String]) -> String {
        var mutableString = self
        for tag in tags {
            mutableString = mutableString.deleteHTMLTag(tag: tag)
        }
        return mutableString
    }
}
