//
//  CourseViewControllerCell.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 4/24/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit

class CourseViewControllerCell: UITableViewCell {
    
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var code: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var days: UILabel!
    @IBOutlet weak var time: UILabel!
    
    
    func configureCell(courseTitle: String, courseCode: String, courseLocation: String, courseDays: String, courseTime: String) {
        self.title.text = courseTitle
        self.code.text = courseCode
        self.location.text = courseLocation
        self.time.text = courseTime
        self.days.text = courseDays
    }
    
}
