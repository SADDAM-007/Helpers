//
//  Color+makeColor.swift
//  SwiftDemo
//
//  Created by iOS Developer on 29/11/17.
//  Copyright © 2017 MobileCoderz. All rights reserved.
//

import UIKit
import Foundation

extension UIColor {
    
  
    //   let Fern = UIColor(netHex: 0x6ABB72)
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
    
    
    
    func getColorFromRGB(red: Int, green: Int, blue: Int,alpha:Float) -> UIColor {
        return UIColor(red: CGFloat(Float(red) / 255.0),
                       green: CGFloat(Float(green) / 255.0),
                       blue: CGFloat(Float(blue) / 255.0),
                       alpha: CGFloat(alpha))
    }
    
    func hexToColor(hexString: String, alpha:CGFloat? = 1.0) -> UIColor {
        // Convert hex string to an integer
        let hexint = Int(self.intFromHexString(hexStr: hexString))
        let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexint & 0xff) >> 0) / 255.0
        let alpha = alpha!
        // Create color object, specifying alpha as well
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        return color
    }
    
    func intFromHexString(hexStr: String) -> UInt32 {
        var hexInt: UInt32 = 0
        // Create scanner
        let scanner: Scanner = Scanner(string: hexStr)
        // Tell scanner to skip the # character
        scanner.charactersToBeSkipped = NSCharacterSet(charactersIn: "#") as CharacterSet
        // Scan hex value
        scanner.scanHexInt32(&hexInt)
        return hexInt
    }
    
    
    

 
    

  //  let terraCotta = UIColor.FlatColor.Red.TerraCotta
   
    
    struct FlatColor {
        
        struct FlatUIPalette {
            
                static let Turquoise = UIColor().hexToColor(hexString: "#1abc9c")
                static let Emerald = UIColor().hexToColor(hexString: "#2ecc71")
                static let GreenSea = UIColor().hexToColor(hexString: "#16a085")
                static let Nephritis = UIColor().hexToColor(hexString: "#27ae60")
        
                static let PeterRiver = UIColor().hexToColor(hexString: "#3498db")
                static let BelizeHole = UIColor().hexToColor(hexString: "#2980b9")
            
                static let Amethyst = UIColor().hexToColor(hexString: "#9b59b6")
                static let Wisteria = UIColor().hexToColor(hexString: "#8e44ad")
            
                static let WetAsphalt = UIColor().hexToColor(hexString: "#34495e")
                static let MidNightBlue = UIColor().hexToColor(hexString: "#2c3e50")
            
                static let SunFlower = UIColor().hexToColor(hexString: "#f1c40f")
                static let Orange = UIColor().hexToColor(hexString: "#f39c12")
            
                static let Carrot = UIColor().hexToColor(hexString: "#e67e22")
                static let Pumpkin = UIColor().hexToColor(hexString: "#d35400")
                static let Alizarin = UIColor().hexToColor(hexString: "#e74c3c")
                static let Pomegranate = UIColor().hexToColor(hexString: "#c0392b")
            
                static let Clouds = UIColor().hexToColor(hexString: "#ecf0f1")
                static let Silver = UIColor().hexToColor(hexString: "#bdc3c7")
                static let Concrete = UIColor().hexToColor(hexString: "#95a5a6")
                static let Asbestos = UIColor().hexToColor(hexString: "#7f8c8d")

        }
        
        
        struct IndianFlatUIPalette {
            
            static let OrchidOrange = UIColor().hexToColor(hexString: "#FEA47F")
            static let RichGardenia = UIColor().hexToColor(hexString: "#F97F51")
            static let SpiroDiscoBall = UIColor().hexToColor(hexString: "#25CCF7")
            static let ClearChill = UIColor().hexToColor(hexString: "#1B9CFC")
            
            static let HoneyGlow = UIColor().hexToColor(hexString: "#EAB543")
            static let SarawakWhitePepper = UIColor().hexToColor(hexString: "#F8EFBA")
            
            static let SweetGarden = UIColor().hexToColor(hexString: "#55E6C1")
            static let Keppel = UIColor().hexToColor(hexString: "#58B19F")
            
            static let FallingStar = UIColor().hexToColor(hexString: "#CAD3C8")
            static let ShipsOfficer = UIColor().hexToColor(hexString: "#2C3A47")
            
            static let FieryFuchsia = UIColor().hexToColor(hexString: "#B33771")
            static let MagentaPurple = UIColor().hexToColor(hexString: "#6D214F")
            
            static let BlueBell = UIColor().hexToColor(hexString: "#3B3B98")
            static let EndingNavyBlue = UIColor().hexToColor(hexString: "#182C61")
            static let GeogiaPeach = UIColor().hexToColor(hexString: "#FD7272")
            static let SasQuatchSocks = UIColor().hexToColor(hexString: "#FC427B")
            
            static let OasisStream = UIColor().hexToColor(hexString: "#9AECDB")
            static let PineGlade = UIColor().hexToColor(hexString: "#BDC581")
            static let BrightUbe = UIColor().hexToColor(hexString: "#D6A2E8")
            static let HighLighterLavender = UIColor().hexToColor(hexString: "#82589F")
            
        }
    }
}
