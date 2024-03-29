//
//  Course+CoreDataProperties.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 4/25/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Course {

    @NSManaged var crn: String?
    @NSManaged var days: NSObject?
    @NSManaged var endTime: String?
    @NSManaged var location: String?
    @NSManaged var name: String?
    @NSManaged var professor: String?
    @NSManaged var startTime: String?
    @NSManaged var semester: Semester?
    @NSManaged var assignment: NSSet?

}
