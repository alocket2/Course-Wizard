//
//  SemesterCourseDetailCell.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 4/24/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit

class SemesterCourseDetailCell: UITableViewCell {

    @IBOutlet weak var courseTitle: UILabel!
    
    func configureCell(title: String) {
        self.courseTitle.text = title
        self.courseTitle.textColor = UIColor.darkGrayColor()
    }
    
}
