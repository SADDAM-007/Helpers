//
//  Extensions.swift
//  MERP-NSD
//
//  Created by  on 27/10/17.
//  Copyright © 2017 . All rights reserved.
//

import Foundation
import UIKit
import QuartzCore
import CoreData
import CoreLocation

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        tap.delegate = self as? UIGestureRecognizerDelegate
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


extension UIColor {
    class func fromRGB(_ rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func fromHex(_ rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
        
    }
    
}

extension UIView {
    func addGradientWithColors(color : [CGColor]) {
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: self.frame.origin.x,
                                    y: self.frame.origin.y,
                                    width: self.frame.size.width,
                                    height: self.frame.size.height)
        gradient.colors = color//[color.cgColor, color2.cgColor , color3.cgColor, color4.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0);
        if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone{
            gradient.endPoint = CGPoint(x: 0.25 ,y: 0.0)
        }else{
            gradient.endPoint = CGPoint(x: 0.5 ,y: 0.0)
        }
        
//        gradient.opacity = 0.5;
        self.layer.addSublayer(gradient)//(gradient, at: 0)
        
    }
    
    func colorPattern(imageName:String){
        self.backgroundColor = UIColor.init(patternImage: UIImage.init(named:imageName)!)
    }

}

extension UIView{
    func addShadow(color:UIColor, withCornerRadius:CGFloat){
        self.layer.masksToBounds = false;
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.cornerRadius = withCornerRadius
        self.layer.shadowOffset = CGSize.init(width: 0, height: 0)
//        self.layer.shadowPath = UIBezierPath.init(rect: self.bounds).cgPath
    }
    
    func addBorder(withColor color:UIColor, withBorderWidth wid:CGFloat, andCornerRadius rad:CGFloat, isRounded isRound:Bool!)
    {
        self.layer.borderWidth = wid
        self.layer.borderColor = color.cgColor
        
        if isRound == true{
            self.layer.cornerRadius=rad;
            self.clipsToBounds=true;
        }
    }
    
    func viewHeightByAutoLayout() -> CGFloat{
        self.setNeedsLayout();
        self.layoutIfNeeded();
        
        let size : CGSize = self.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
        
        return size.height+1;
    }

}


extension UIDevice {
    
    class func isIphone () ->Bool {
        if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone {
            return true
        }
        return false
    }
    
    
    class func isDeviceWithHeight568 () -> Bool {
        if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone {
            if UIScreen.main.bounds.size.height == CGFloat(568.0) {
                return true;
            }
        }
        return false;
    }
    
    class func isDeviceWithHeight667 () -> Bool {
        if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone {
            if UIScreen.main.bounds.size.height == CGFloat(667.0) {
                return true;
            }
        }
        return false;
    }
    
    class func isDeviceWithHeight736 () -> Bool {
        if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone {
            if UIScreen.main.bounds.size.height == CGFloat(736.0) {
                return true;
            }
        }
        return false;
    }
    
    class func fontwithDeviceRespect () -> CGFloat {
        if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone {
            return UIScreen.main.bounds.width
        }
        else {
            return 500
        }
    }
}

extension Date {
    func duration(_ date:Date) -> Int{
        return (Calendar.current as NSCalendar).components(.second, from: date, to: self, options: []).second!
    }
    
    //ISO 8061 Format
    func string() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        return dateFormatter.string(from: self) + "Z"
    }
    
    var age: Int {
            return Calendar.current.dateComponents([.year], from: self, to: Date()).year!
        }
}

extension String {
    
    //ISO 8061 Format
    func toNSDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        dateFormatter.dateFormat = "yyyy,MM,dd"
//        let newDate = dateFormatter.date(from: self)
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        return dateFormatter.date(from: self)! }
    
    func toTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let newDate = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "hh:mm a"
        let dateToReturn = dateFormatter.string(from: newDate!)
        return dateToReturn
    }
    
    func toDateComment() -> String {
        if !self.isEmpty{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
//            dateFormatter.locale = Locale.current
            let newDate = dateFormatter.date(from: self)
            dateFormatter.dateFormat = "dd MMM yyyy, hh:mm a"
            let dateToReturn = dateFormatter.string(from: newDate!)
            return dateToReturn
        }
        return self
    }
    
    func toDate() -> String {
        if !self.isEmpty{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let newDate = dateFormatter.date(from: self)
            dateFormatter.dateFormat = "dd MMM yyyy, hh:mm a"
            let dateToReturn = dateFormatter.string(from: newDate!)
            return dateToReturn
        }
        return self
    }
    
    
    func fromTimeStampToDate() -> Date{
        let timeStamp = Double(self)
        return Date(timeIntervalSince1970: timeStamp!/1000.0)
    }
    
    func compareDateAndTime(dateStr:String, timeGap:TimeInterval)->Bool{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMM-yyyy"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
        let selDate = dateFormatter.date(from: dateStr)
        
        if selDate!.compare(dateFormatter.date(from: Date().getDateFormatSales())!) == .orderedSame{
            dateFormatter.dateFormat = "H:mm"
            let selTime = dateFormatter.date(from: self)
            let currTime = dateFormatter.date(from: Date().addingTimeInterval(timeGap).getTime())
            
            if selTime!.compare(currTime!) != .orderedDescending{
                return false
            }
        }
        return true
    }
}

extension String{
    var parseJSONString: AnyObject!{
        let data = self.data(using: String.Encoding.utf8, allowLossyConversion: false)
        if let jsonData = data{
            // Will return an object or nil if JSON decoding fails
            do{
                let message = try JSONSerialization.jsonObject(with: jsonData, options:.mutableContainers)
                if let jsonResult = message as? NSMutableArray{
                    return jsonResult //Will return the json array output
                }else{
                    return nil
                }
            }catch let error as NSError{
                print("An error occurred: \(error)")
                return nil
            }
        }else{
            // Lossless conversion of the string was not possible
            return nil
        }
    }
    
    var html2AttributedString: NSAttributedString? {
   
        do {
            return try NSAttributedString(
                data: self.data(using: String.Encoding.utf16, allowLossyConversion: false)!,
                options: [ NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html],
                documentAttributes:nil)
            //label.attributedText = attrStr
        } catch let error {
            print("error:", error)
            return nil
        }
//
        
        
//        do {
//            return try NSAttributedString(data: Data(utf8), options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: String.Encoding.utf8.rawValue], documentAttributes: nil)
//        } catch {
//            print("error:", error)
//            return nil
//        }
    }
    var html2StringText: String {
        return html2AttributedString?.string ?? ""
    }
    
    var html2String: NSAttributedString {
        return html2AttributedString!
    }
    
    func convertBase64toImage() -> UIImage{
        // !!! Separation part is optional, depends on your Base64String !!!
        let dataDecoded : Data = Data(base64Encoded: self, options: .ignoreUnknownCharacters)!
        let decodedimage = UIImage(data: dataDecoded)
        return decodedimage!
    }
}

extension String{
    func isValidMobileNumber()->Bool{
        
        let PHONE_REGEX = "[6-9]{1}+[0-9]{9}"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: self)
        return result
    }
    func isNumberOnly()->Bool{
        
        let NUM_REGEX = "^[0-9]*$"
        let numTest = NSPredicate(format: "SELF MATCHES %@", NUM_REGEX)
        let result =  numTest.evaluate(with: self)
        return result
    }
    
    func isvalidEmailId() -> Bool{
        let stricterFilter = false
        let stricterFilterString = "^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$"
        let laxString = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"
        let emailRegex = stricterFilter ? stricterFilterString : laxString
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self)
    }
    
    
    
    func isvalidGSTNum()->Bool{
        let gstRegex = "[0-9]{2}[a-zA-Z]{5}[0-9]{4}[a-zA-Z]{1}[1-9A-Za-z]{1}[a-zA-Z]{1}[0-9a-zA-Z]{1}"
        let test = NSPredicate(format: "SELF MATCHES %@", gstRegex)
        return test.evaluate(with: self)
    }
    
    func isvalidGSTCity(cityCode:String) -> Bool{
        let index = self.index(self.startIndex, offsetBy: 2)
        let firstGst = /*self.substring(to: index)*/ String(self[..<index])
        return (!cityCode.isEmpty && firstGst != cityCode) ? false : true
    }
    
    func isvalidPANNum() -> Bool{
        let PAN_REGEX = "[A-Za-z]{5}[0-9]{4}[A-Za-z]{1}"
        let panTest = NSPredicate(format: "SELF MATCHES %@", PAN_REGEX)
        let result =  panTest.evaluate(with: self)
        return result
    }

    func isvalidTANNum() -> Bool{
        let TAN_REGEX = "[A-Za-z]{4}[0-9]{5}[A-Za-z]{1}"
        let tanTest = NSPredicate(format: "SELF MATCHES %@", TAN_REGEX)
        let result =  tanTest.evaluate(with: self)
        return result
    }
    
    func condenseWhitespace() -> String {
        let components = self.components(separatedBy: NSCharacterSet.whitespacesAndNewlines)
        return components.filter { !$0.isEmpty }.joined(separator: " ")
    }
    
    func toDouble() -> Double? {
            let numberFormatter = NumberFormatter()
//            numberFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale!
            return numberFormatter.number(from: self)?.doubleValue
//            return ((numberFormatter.number(from: self)?.doubleValue)!*10000.0).rounded()/10000
        }
}

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy, hh:mm a"
        return dateFormatter.string(from: self)
    }
    
    func getTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: self)
    }
    
    func getDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd YYYY"
        return dateFormatter.string(from: self)
    }
    
    func getDateFormat1() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY,MM,dd"
        return dateFormatter.string(from: self)
    }
    
    func getDateFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-YYYY"
        return dateFormatter.string(from: self)
    }
    
    func getDateFormatSales() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMM-YYYY"
        return dateFormatter.string(from: self)
    }
    
    func getTimeDateFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a, dd MMM YYYY"
        return dateFormatter.string(from: self)
    }
}


private var ArrAssociationKey: UInt8 = 0
extension UITextField{
   
    var inputArray: Array<AnyObject>! {
        get {
            if let array = objc_getAssociatedObject(self, &ArrAssociationKey) as? Array<AnyObject>? {
                return array
            } else {
                return [] as Array<AnyObject>
            }
        }
        set(newValue) {
            objc_setAssociatedObject(self, &ArrAssociationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    
    
    
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set(newValue) {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedStringKey.foregroundColor: newValue!])
        }
    }
    
    
    @IBInspectable var maxLength: Int {
        get {
            if let length = objc_getAssociatedObject(self, &ArrAssociationKey) as? Int {
                return length
            } else {
                return Int.max
            }
        }
        set(newValue) {
            objc_setAssociatedObject(self, &ArrAssociationKey, newValue, .OBJC_ASSOCIATION_RETAIN)
            addTarget(self, action: #selector(checkMaxLength), for: .editingChanged)
        }
    }
    
    @objc func checkMaxLength(textField: UITextField) {
        guard let prospectiveText = self.text,
            prospectiveText.count > maxLength
            else {
                return
        }
        
        let selection = selectedTextRange
        let maxCharIndex = prospectiveText.index(prospectiveText.startIndex, offsetBy: maxLength)
        text = prospectiveText.substring(to: maxCharIndex)
        selectedTextRange = selection
    }
}

extension UIImageView{
    
    private struct ImageLoc{
        static var isImgAdded:Bool = false
        static var imgLocation: CLLocation = CLLocation()
    }
    
    var isImgAdded: Bool {
        get {
           // return (objc_getAssociatedObject(self, &ImageLoc.isImgAdded) as? Bool)!
            if let isImg = objc_getAssociatedObject(self, &ImageLoc.isImgAdded) as? Bool{
                return isImg
            } else {
                return false
            }
        }
        set(newValue) {
            objc_setAssociatedObject(self, &ImageLoc.isImgAdded, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    var imgLocation: CLLocation {
        get {
            if let location = objc_getAssociatedObject(self, &ImageLoc.imgLocation) as? CLLocation{
                return location
            } else {
                return CLLocation()
            }
        }
        set(newValue) {
            objc_setAssociatedObject(self, &ImageLoc.imgLocation, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }

//    func getLocationToUpdate(){
//        print("location")
//        var manager : OneShotLocationManager?
//        manager = OneShotLocationManager()
//        manager?.fetchWithCompletion {location, accuracy ,error in
//            // fetch location or an error
//            if location != nil {
//                print (location?.coordinate.latitude ?? 0.0)
//                print (location?.coordinate.longitude ?? 0.0)
//                //                myLocation = location
//                
////                if  self.latitude == 0.0{
////                    self.getLocationToUpdate()
////                }else{
//                   self.imgLocation = location!
////                }
//                
//                //                self.latitude = location?.coordinate.latitude ?? 0.0
//                //                self.longitude = location?.coordinate.longitude ?? 0.0
//            } else if let err = error {
//                let vc = UIApplication.shared.delegate as! AppDelegate
//                CommonFunctions.showAlert((vc.window?.rootViewController!.presentedViewController)!, title: "Alert!", message: err.localizedDescription)
//                
//                print(err.localizedDescription)
//            }
//            manager = nil
//        }
//    }
}

extension UIImage {
    
    public func imageRotatedByDegrees(degrees: CGFloat, flip: Bool) -> UIImage {
        let _: (CGFloat) -> CGFloat = {
            return $0 * (180.0 / .pi)
        }
        let degreesToRadians: (CGFloat) -> CGFloat = {
            return $0 / 180.0 * .pi
        }
        
        // calculate the size of the rotated view's containing box for our drawing space
        let rotatedViewBox = UIView(frame: CGRect(origin: CGPoint.zero, size: size))
        let t = CGAffineTransform(rotationAngle: degreesToRadians(degrees));
        rotatedViewBox.transform = t
        let rotatedSize = rotatedViewBox.frame.size
        
        // Create the bitmap context
        UIGraphicsBeginImageContext(rotatedSize)
        let bitmap = UIGraphicsGetCurrentContext()
        
        // Move the origin to the middle of the image so we will rotate and scale around the center.
        bitmap!.translateBy(x: rotatedSize.width / 2.0, y: rotatedSize.height / 2.0);
        
        //   // Rotate the image context
        bitmap!.rotate(by: degreesToRadians(degrees));
        
        // Now, draw the rotated/scaled image into the context
        var yFlip: CGFloat
        
        if(flip){
            yFlip = CGFloat(-1.0)
        } else {
            yFlip = CGFloat(1.0)
        }
        
        bitmap!.scaleBy(x: yFlip, y: -1.0)
        
      //  bitmap?.draw(CGImage(), in: CGRect(x: -size.width / 2, y: -size.height / 2, width: size.width, height: size.height))
        

        
     //   CGContextDrawImage(bitmap, CGRectMake(-size.width / 2, -size.height / 2, size.width, size.height), CGImage() as? CGImage)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}

extension NSLayoutConstraint{
    func setMultiplier(multiplier:CGFloat) -> NSLayoutConstraint {
        
        NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint(
            item: firstItem,
            attribute: firstAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant)
        
        newConstraint.priority = priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        return newConstraint
    }
    
    func constraint(withMultiplier multiplier: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self.firstItem, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem!, attribute: self.secondAttribute, multiplier: multiplier, constant: self.constant)
    }
}


extension UIImage{
    
    func compressImage()->Data?{
        var actualHeight : CGFloat = self.size.height
        var actualWidth : CGFloat = self.size.width
        let maxHeight : CGFloat = 600.0
        let maxWidth : CGFloat = 800.0
        var imgRatio : CGFloat = actualWidth/actualHeight
        let maxRatio : CGFloat = maxWidth/maxHeight
        var compressionQuality : CGFloat = 0.65
        
        if (actualHeight > maxHeight || actualWidth > maxWidth){
            if(imgRatio < maxRatio){
                //adjust width according to maxHeight
                imgRatio = maxHeight / actualHeight
                actualWidth = imgRatio * actualWidth
                actualHeight = maxHeight
            }
            else if(imgRatio > maxRatio){
                //adjust height according to maxWidth
                imgRatio = maxWidth / actualWidth
                actualHeight = imgRatio * actualHeight
                actualWidth = maxWidth
            }
            else{
                actualHeight = maxHeight
                actualWidth = maxWidth
                compressionQuality = 1
            }
        }
        
        let rect = CGRect(x: 0.0, y: 0.0, width: actualWidth, height: actualHeight)
        UIGraphicsBeginImageContext(rect.size)
        self.draw(in: rect)
        guard let img = UIGraphicsGetImageFromCurrentImageContext() else {
            return nil
        }
        UIGraphicsEndImageContext()
        // [UIImagePNGRepresentation(image) base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithCarriageReturn]
        guard let imageData = UIImageJPEGRepresentation(img, compressionQuality) else{
            return nil
        }
        return imageData
    }
    
    func compressAndConvertImageToBase64() -> String? {
//        var actualHeight : CGFloat = self.size.height
//        var actualWidth : CGFloat = self.size.width
//        let maxHeight : CGFloat = 600.0
//        let maxWidth : CGFloat = 800.0
//        var imgRatio : CGFloat = actualWidth/actualHeight
//        let maxRatio : CGFloat = maxWidth/maxHeight
//        var compressionQuality : CGFloat = 0.5
//
//        if (actualHeight > maxHeight || actualWidth > maxWidth){
//            if(imgRatio < maxRatio){
//                //adjust width according to maxHeight
//                imgRatio = maxHeight / actualHeight
//                actualWidth = imgRatio * actualWidth
//                actualHeight = maxHeight
//            }
//            else if(imgRatio > maxRatio){
//                //adjust height according to maxWidth
//                imgRatio = maxWidth / actualWidth
//                actualHeight = imgRatio * actualHeight
//                actualWidth = maxWidth
//            }
//            else{
//                actualHeight = maxHeight
//                actualWidth = maxWidth
//                compressionQuality = 1
//            }
//        }
//
//        let rect = CGRect(x: 0.0, y: 0.0, width: actualWidth, height: actualHeight)
//        UIGraphicsBeginImageContext(rect.size)
//        self.draw(in: rect)
//        guard let img = UIGraphicsGetImageFromCurrentImageContext() else {
//            return nil
//        }
//        UIGraphicsEndImageContext()
//        // [UIImagePNGRepresentation(image) base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithCarriageReturn]
//        guard let imageData = UIImageJPEGRepresentation(img, compressionQuality) else{
//            return nil
//        }
        
        guard let base64Str = compressImage()?.base64EncodedString(options: .endLineWithCarriageReturn) else{
            return nil
        }
        
        return base64Str
    }
}

extension UIImage {
    
    func resize(withWidth newWidth: CGFloat) -> UIImage? {
        
        let scale = newWidth / self.size.width
        let newHeight = self.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        self.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

extension UIApplication {
    
    class func appVersion() -> String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    }
    
    class func appBuild() -> String {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as! String
    }
    
    class func versionBuild() -> String {
        let version = appVersion(), build = appBuild()
        
        return version == build ? "v\(version)" : "v\(version)(\(build))"
    }
}

extension Array {
    mutating func move(at oldIndex: Int, to newIndex: Int) {
        self.insert(self.remove(at: oldIndex), at: newIndex)
    }
}

extension UILabel {
    func someTextColorChange (fullText : String , changeText : String ) {
        let strNumber: NSString = fullText as NSString
        let range = (strNumber).range(of: changeText)
        let attribute = NSMutableAttributedString.init(string: fullText)
        attribute.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor().getColorFromRGB(red: 0, green: 81, blue: 176, alpha: 1.0) , range: range)
        self.attributedText = attribute
    }
}

extension UITableView {

    public func reloadData(_ completion: @escaping ()->()) {
        UIView.animate(withDuration: 0, animations: {
            self.reloadData()
        }, completion:{ _ in
            completion()
        })
    }

    func scroll(to: scrollsTo, animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300)) {
            let numberOfSections = self.numberOfSections
            let numberOfRows = self.numberOfRows(inSection: numberOfSections-1)
            switch to{
            case .top:
                if numberOfRows > 0 {
                    let indexPath = IndexPath(row: 0, section: 0)
                    self.scrollToRow(at: indexPath, at: .top, animated: animated)
                }
                break
            case .bottom:
                if numberOfRows > 0 {
                    let indexPath = IndexPath(row: numberOfRows-1, section: (numberOfSections-1))
                    self.scrollToRow(at: indexPath, at: .bottom, animated: animated)
                }
                break
            }
        }
    }

    enum scrollsTo {
        case top,bottom
    }
}

extension UIAlertController{
    class func customActionsheet(title : String, message : String) -> UIAlertController{
        let sheetController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        return sheetController
    }
}






