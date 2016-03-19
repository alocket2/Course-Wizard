//
//  ColorGenerator.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 3/17/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit

class ColorGenerator: GeneratorType {
    
    typealias Element = UIColor
    
    func next() -> ColorGenerator.Element? {
        hue += increment
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
    }
    
    var hue: CGFloat
    let saturation: CGFloat
    let brightness: CGFloat
    let alpha: CGFloat
    let increment: CGFloat
    
    init(hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat, increment: CGFloat) {
        self.hue = hue
        self.saturation = saturation
        self.brightness = brightness
        self.alpha = alpha
        self.increment = increment
    }
    
}
