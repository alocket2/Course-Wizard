//
//  CWCourse.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 3/29/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import Foundation

class CWCourse: NSObject {
 
    private var name: String
    private var code: String
    private var credits: Int
    private var coreqs: [String]
    private var preregs: [String]
    private var courseDescription: String
    private var gordonRule: Bool
    private var completed: Bool = false
    
    
    init(courseName: String, courseCode: String, courseCredits: Int, courseCoreqs: [String], coursePreRegs: [String], courseDescription: String, isGordonRule: Bool) {
        self.name = courseName
        self.code = courseCode
        self.credits = courseCredits
        self.coreqs = courseCoreqs
        self.preregs = coursePreRegs
        self.courseDescription = courseDescription
        self.gordonRule = isGordonRule
    }
    
    func getName() -> String {
        return name
    }
    
    func getCode() -> String {
        return code
    }
    
    func getCredits() -> Int {
        return credits
    }
    
    func getCoreqs() -> [String] {
        return coreqs
    }
    
    func getPrereqs() -> [String] {
        return preregs
    }
    
    func getDescription() -> String {
        return description
    }
    
    func getGordonRule() -> Bool {
        return gordonRule
    }
    
    func getCompleted() -> Bool {
        return completed
    }
}