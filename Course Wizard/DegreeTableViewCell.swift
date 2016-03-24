//
//  DegreeTableViewCell.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 3/21/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit

class DegreeTableViewCell: UITableViewCell {

    @IBOutlet weak var degreeLabel: UILabel!
    
    func configureCellWith(degree: CWDegree) {
        degreeLabel.text = degree.degree
    }
}
