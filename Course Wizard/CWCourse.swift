//
//  CWCourse.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 3/29/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import Foundation

class CWCourse {
 
    var name: String
    var code: String
    var credits: Int
    var preRegs: [String]
    var completed: Bool
    
    init(courseName: String, courseCode: String, courseCredits: Int, coursePreRegs: [String], courseCompletion: Bool) {
        self.name = courseName
        self.code = courseCode
        self.credits = courseCredits
        self.preRegs = coursePreRegs
        self.completed = courseCompletion
    }
    
    
}