//
//  CW+UIFont.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 3/21/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import Foundation

extension UIFont {
    
    class func headlineFontWith(headline headline: String) -> NSAttributedString {
        let attrs = [NSFontAttributeName: UIFont.systemFontOfSize(17.0, weight: UIFontWeightMedium)]
        return NSAttributedString(string: headline, attributes: attrs)
    }
    
    class func taglineFontWith(body body: String) -> NSAttributedString {
        let attrs = [NSFontAttributeName: UIFont.systemFontOfSize(14.0, weight: UIFontWeightLight)]
        return NSAttributedString(string: body, attributes: attrs)
    }
    
}