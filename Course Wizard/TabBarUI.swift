//
//  TabBarUI.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 3/16/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit

class TabBarUI: UITabBarController {
    
    override func viewDidLoad() {
        for item in self.tabBar.items! as [UITabBarItem] {
            if let image = item.image {
                item.image = image.imageWithColor(UIColor(red: 174.0/255.0, green: 191.0/255.0, blue: 244.0/255.0, alpha: 1.0)).imageWithRenderingMode(.AlwaysOriginal)
            }
        }
    }
    
}
