//
//  Degree+CoreDataProperties.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 3/29/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Degree {

    @NSManaged var name: String?
    @NSManaged var type: String?

}
