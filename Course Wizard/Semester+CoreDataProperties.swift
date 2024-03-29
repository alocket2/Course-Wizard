//
//  Semester+CoreDataProperties.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 4/24/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Semester {

    @NSManaged var endDate: String?
    @NSManaged var startDate: String?
    @NSManaged var type: String?
    @NSManaged var year: String?
    @NSManaged var currentSemester: NSNumber?
    @NSManaged var course: NSSet?

}
