//
//  CommonFunctions.swift
//  MERP-NSD
//
//  Created by  on 01/11/17.
//  Copyright © 2017 . All rights reserved.
//

import UIKit
import CoreLocation

class CommonFunctions: NSObject {



//--------------- TO FIND HEIGHT OF LAYOUT DYNAMICALLY
    static func viewHeightByAutoLayout(_ paramView:UIView) -> CGFloat{
        paramView.setNeedsLayout();
        paramView.layoutIfNeeded();
        
        let size : CGSize = paramView.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
        
        return size.height+1;
    }
    
//------------------ Assign xib to UiVIEWswift

    static func loadFromNibNamed(_ nibNamed: String, bundle : Bundle? = nil) -> UIView? {
            return UINib(
                nibName: nibNamed,
                bundle: bundle
                ).instantiate(withOwner: nil, options: nil)[0] as? UIView
        }
    

    
    static func showAlert(_ vc: UIViewController, title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
 
   
    


  //------------------ to get the current location ---------------
//    func getLocationToUpdate() ->CLLocation?{
//        print("location")
//        var manager : OneShotLocationManager?
//        manager = OneShotLocationManager()
//        var myLocation:CLLocation?
//        manager?.fetchWithCompletion {location, accuracy ,error in
//            // fetch location or an error
//            if location != nil {
//                print (location?.coordinate.latitude ?? 0.0)
//                print (location?.coordinate.longitude ?? 0.0)
//                myLocation = location
////                self.latitude = location?.coordinate.latitude ?? 0.0
////                self.longitude = location?.coordinate.longitude ?? 0.0
//            } else if let err = error {
//                let vc = UIApplication.shared.delegate as! AppDelegate
//                CommonFunctions.showAlert((vc.window?.rootViewController!.presentedViewController)!, title: "Alert!", message: err.localizedDescription)
//
//                print(err.localizedDescription)
//            }
//            manager = nil
//        }
//        return myLocation
//    }
    
    
    //MARK: change Status Bar color
    func setStatusBarColor(color:UIColor){
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        if statusBar.responds(to: #selector(setter: UIView.backgroundColor)) {
            statusBar.backgroundColor = color
        }
        
    }
    
    
    //MARK: time exceeded to 10 minutes10
    
//    func isTimeExceededTenMinutes()->Bool{
//
//        let dif:Double = Date().timeIntervalSince1970 - AppSharedData.appSharedInstance.tenMintimeInterval
//        let minsLeft = dif / 60
//        return minsLeft>=10 ? true : false
//
//    }
    
    
    
    func resize(_ image: UIImage) -> UIImage {
        var actualHeight = Float(image.size.height)
        var actualWidth = Float(image.size.width)
        let maxHeight: Float = 850.0
        let maxWidth: Float = 850.0
        var imgRatio: Float = actualWidth / actualHeight
        let maxRatio: Float = maxWidth / maxHeight
        let compressionQuality: Float = 0.65//65 percent compression

        if actualHeight > maxHeight || actualWidth > maxWidth {
            if imgRatio < maxRatio {
                //adjust width according to maxHeight
                imgRatio = maxHeight / actualHeight
                actualWidth = imgRatio * actualWidth
                actualHeight = maxHeight
            }
            else if imgRatio > maxRatio {
                //adjust height according to maxWidth
                imgRatio = maxWidth / actualWidth
                actualHeight = imgRatio * actualHeight
                actualWidth = maxWidth
            }
            else {
                actualHeight = maxHeight
                actualWidth = maxWidth
            }
        }
        let rect = CGRect(x: 0.0, y: 0.0, width: CGFloat(actualWidth), height: CGFloat(actualHeight))
        UIGraphicsBeginImageContext(rect.size)
        image.draw(in: rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        let imageData = UIImageJPEGRepresentation(img!, CGFloat(compressionQuality))
        UIGraphicsEndImageContext()
        return UIImage(data: imageData!) ?? UIImage()
    }
    
    //MARK: to compare date and time
//    func compareDateAndTime(dateStr:String, timeGap:TimeInterval)->Bool{
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd-MMM-yyyy"
//        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
//        let selDate = dateFormatter.date(from: dateStr)
//        
//        if selDate!.compare(dateFormatter.date(from: Date().getDateFormatSales())!) == .orderedSame{
//            dateFormatter.dateFormat = "H:mm"
//            let selTime = dateFormatter.date(from: self)
//            let currTime = dateFormatter.date(from: Date().addingTimeInterval(timeGap).getTime())
//            
//            if selTime!.compare(currTime!) != .orderedDescending{
//                return false
//            }
//        }
//        return true
//    }
}
