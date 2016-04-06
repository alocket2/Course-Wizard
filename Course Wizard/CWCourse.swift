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
    var coreqs: [String]
    var preregs: [String]
    var description: String
    var gordonRule: Bool
    var completed: Bool = false
    
    init(courseName: String, courseCode: String, courseCredits: Int, courseCoreqs: [String], coursePreRegs: [String], courseDescription: String, isGordonRule: Bool) {
        self.name = courseName
        self.code = courseCode
        self.credits = courseCredits
        self.coreqs = courseCoreqs
        self.preregs = coursePreRegs
        self.description = courseDescription
        self.gordonRule = isGordonRule
    }
    
    
}