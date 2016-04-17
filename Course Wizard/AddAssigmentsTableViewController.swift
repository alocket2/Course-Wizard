//
//  AddAssigmentsTableViewController.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 4/16/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit

protocol AddAssignmentDelegate: class {
    func userDidCancel(controller: AddAssigmentsTableViewController)
}

class AddAssigmentsTableViewController: UITableViewController {
    
    weak var delegate: AddAssignmentDelegate!
    var userSelectedCourse: CWCourse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Add Assignment"
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        delegate?.userDidCancel(self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addCourseSegue" {
            let controller = segue.destinationViewController as! CourseSearchTableViewController
            controller.delegate = self
        }
    }
    
}

extension AddAssigmentsTableViewController: CourseSearchDelegate {
    func CourseSearchDidCancel(controller: CourseSearchTableViewController) {
        navigationController?.popViewControllerAnimated(true)
    }
    func CourseSearchDidFinish(controller: CourseSearchTableViewController, course: CWCourse?) {
        userSelectedCourse = course
    }
}
