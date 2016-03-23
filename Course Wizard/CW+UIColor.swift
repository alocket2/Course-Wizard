//
//  CW+UIColor.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 3/20/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func tabBarTintColor() -> UIColor {
         return UIColor(red: 55.0/255.0, green: 63.0/255.0, blue: 81.0/255.0, alpha: 1.0)
    }
    
    class func tabBarItemActiveColor() -> UIColor {
        return UIColor(red: 255.0/255.0, green: 254.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    }
    
    class func tabBarItemInactiveColor() -> UIColor {
        return UIColor(red: 169.0/255.0, green: 188.0/255.0, blue: 208.0/255.0, alpha: 1.0)
    }
    
    class func navBarItemActiveColor() -> UIColor {
        return UIColor(red: 55.0/255.0, green: 63.0/255.0, blue: 81.0/255.0, alpha: 1.0)
    }
    
    class func imageTintColor() -> UIColor {
        return UIColor(red: 153.0/255.0, green: 153.0/255.0, blue: 153.0/255.0, alpha: 1.0)
    }
    
    class func walkthroughFontColor() -> UIColor {
        return UIColor(red: 55.0/255.0, green: 63.0/255.0, blue: 81.0/255.0, alpha: 1.0)
    }
    
    class func walkthroughBackgroundColor() -> UIColor {
        return UIColor(red: 55.0/255.0, green: 66.0/255.0, blue: 84.0/255.0, alpha: 1.0)
    }
    
    class func inactivePageControlColor() -> UIColor {
        return UIColor(red: 118.0/255.0, green: 138.0/255.0, blue: 157.0/255.0, alpha: 1.0)
    }
    
    class func activePageControlColor() -> UIColor {
        return UIColor(red: 218.0/255.0, green: 230.0/255.0, blue: 242.0/255.0, alpha: 1.0)
    }
    
}