//
//  AttemptedCourse+CoreDataProperties.swift
//  Course Wizard
//
//  Created by Daniel Marquez on 4/19/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension AttemptedCourse {

    @NSManaged var professor: String?
    @NSManaged var startTime: NSDate?
    @NSManaged var endTime: NSDate?
    @NSManaged var course: NSObject?
    @NSManaged var location: NSObject?
    @NSManaged var days: NSObject?
    @NSManaged var grade: NSNumber?

}
