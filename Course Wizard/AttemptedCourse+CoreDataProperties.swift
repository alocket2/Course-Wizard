//
//  AttemptedCourse+CoreDataProperties.swift
//  Course Wizard
//
//  Created by Daniel Marquez on 4/14/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension AttemptedCourse {

    @NSManaged var professor: String
    @NSManaged var time: NSDate?
    @NSManaged var location: String?
    @NSManaged var grade: String?
    @NSManaged var days: String?
    @NSManaged var course: NSObject?

}
