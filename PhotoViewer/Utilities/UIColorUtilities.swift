//
//  UIColorUtilities.swift
//  PhotoViewer
//
//  Created by Tanabe, Alex on 11/16/16.
//  Copyright © 2016 Alex Tanabe. All rights reserved.
//

import UIKit

extension UIColor {
    static func colorFromRGB(_ rgbValue: UInt32, alpha: CGFloat = 1.0) -> UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:alpha)
    }
    
    static var cpBeige : UIColor {
        return colorFromRGB(0xf7f3e8)
    }
    
    static var cpOrange : UIColor {
        return colorFromRGB(0xff9933)
    }
}
