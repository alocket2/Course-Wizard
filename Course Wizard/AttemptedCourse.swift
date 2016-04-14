//
//  AttemptedCourse.swift
//  Course Wizard
//
//  Created by Daniel Marquez on 4/14/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import Foundation
import CoreData


class AttemptedCourse: NSManagedObject {
    
    convenience init(course: CWCourse, location: String, days: String, time: NSDate, professor: String) {
        self.init()
        self.course = (course as NSObject)
        self.location = location
        self.days = days
        self.time = time
        self.professor = professor
    }
}
