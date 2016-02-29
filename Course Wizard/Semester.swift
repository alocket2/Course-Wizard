//
//  Semester.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 2/28/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import Foundation


class Semester {
    
    var semesterType: String
    var campus: String
    var startDate: String
    var endDate: String
    
    init(type: String, location: String, start: String, end: String) {
        semesterType = type
        campus = location
        startDate = start
        endDate = end
    }
    
}