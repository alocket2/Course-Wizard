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
        let attrs = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)]
        return NSAttributedString(string: headline, attributes: attrs)
    }
    
    class func taglineFontWith(body body: String) -> NSAttributedString {
        let attrs = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleBody)]
        return NSAttributedString(string: body, attributes: attrs)
    }
    
}