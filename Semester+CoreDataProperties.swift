//
//  Semester+CoreDataProperties.swift
//  
//
//  Created by Anthony Lockett on 3/21/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Semester {

    @NSManaged var campus: String?
    @NSManaged var endDate: String?
    @NSManaged var startDate: String?
    @NSManaged var type: String?

}
