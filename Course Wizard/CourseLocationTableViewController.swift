//
//  CourseLocationTableViewController.swift
//  Course Wizard
//
//  Created by Daniel Marquez on 4/16/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit

protocol courseLocationSearchDelegate: class {
    func CourseLocationSearchDidCancel(controller: CourseLocationTableViewController)
    func CourseLocationSearchDidChoose(controller: CourseLocationTableViewController, location: CWBuilding)
}

class CourseLocationTableViewController: UITableViewController {
    var cwBuildings: [CWBuildings] = {return CWBuildings.cwBuildings()}()
    weak var delegate: courseLocationSearchDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
