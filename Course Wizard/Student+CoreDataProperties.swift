//
//  Student+CoreDataProperties.swift
//  
//
//  Created by Anthony Lockett on 4/22/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Student {

    @NSManaged var campus: String?
    @NSManaged var degree: String?
    @NSManaged var gpa: String?

}
