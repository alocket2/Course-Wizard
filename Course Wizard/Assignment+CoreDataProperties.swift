//
//  Assignment+CoreDataProperties.swift
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

extension Assignment {

    @NSManaged var dueDate: String?
    @NSManaged var grade: String?
    @NSManaged var name: String?
    @NSManaged var type: String?
    @NSManaged var priority: String?
    @NSManaged var course: Course?

}
