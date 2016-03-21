//
//  CTabBarController.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 3/16/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit

class CWTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        for item in self.tabBar.items! as [UITabBarItem] {
            if let image = item.image {
                item.image = image.imageWithColor(UIColor.tabBarItemInactiveColor()).imageWithRenderingMode(.AlwaysOriginal)
            }
        }
    }
    
}
