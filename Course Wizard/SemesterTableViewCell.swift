//
//  SemesterTableViewCell.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 3/21/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit

class SemesterTableViewCell: UITableViewCell {

    @IBOutlet weak var semesterNameLabel: UILabel!
    @IBOutlet weak var semesterYearLabel: UILabel!

    func configureCellWith(semester: String, andYear year: String) {
        semesterNameLabel.text = semester
        semesterYearLabel.text = year
    }
    
}
