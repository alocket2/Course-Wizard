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

    func configureCellWith(semester: String) {
        semesterNameLabel.text = semester
    }
    
}
