//
//  CustomSearchBar.swift
//  Course Wizard
//
//  Created by Daniel Marquez on 4/14/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit

class CustomSearchBar: UISearchBar {
    var searchBarTint: UIColor!
    var activeScopeButtonColor: UIColor!
    var inactiveScopeButtonColor: UIColor!
    
    init(frame: CGRect, bgColor: UIColor, actvScope: UIColor, inactvScope: UIColor) {
        super.init(frame: frame)
        
        self.frame = frame
        searchBarTint = bgColor
        activeScopeButtonColor = actvScope
        inactiveScopeButtonColor = inactvScope
        
        searchBarStyle = UISearchBarStyle.Prominent
        showsScopeBar = true
        translucent = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func indexOfSearchFieldInSubviews() -> Int! {
        var index: Int!
        let searchBarView = subviews[0]
        
        for i in 0 ..< searchBarView.subviews.count {
            if searchBarView.subviews[i].isKindOfClass(UITextField) {
                index = i
                break
            }
        }
        
        return index
    }
}
