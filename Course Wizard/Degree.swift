//
//  Degree.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 3/21/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import Foundation

class Degree {
    
    var type: String
    var degree: String
    
    var degrees = [Degree]()
        
    init(degreeType: String, degreeName: String) {
        self.type = degreeType
        self.degree = degreeName
    }
    
}

