//
//  CourseAssignmentsTableViewCell.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 4/25/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit

class CourseAssignmentsTableViewCell: UITableViewCell {

    @IBOutlet weak var assignmentName: UILabel!
    @IBOutlet weak var assignmentType: UILabel!
    @IBOutlet weak var assignmentDueDate: UILabel!
    
    func configureCell(name: String?, type: String?, dueDate: String?) {
        self.assignmentName.text = name
        self.assignmentType.text = type
        self.assignmentDueDate.text = dueDate
    }
    
}
