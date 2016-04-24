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
    
    @IBOutlet weak var assignmentTypeLabel: UILabel!
    @IBOutlet weak var priorityLabel: UILabel!
    @IBOutlet weak var priorityImage: UIImageView!
    @IBOutlet weak var dueDateLabel: UILabel!
    
    weak var delegate: AddAssignmentDelegate!
    
    var userSelectedCourse: CWCourse?
    var userSelectedAssignmentType: String?
    var userSelectedPriority: String?
    var userSelectedDueDate: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Add Assignment"
        priorityImage.hidden = true
        
        if userSelectedAssignmentType == nil || userSelectedPriority == nil {
            assignmentTypeLabel.text = "Assignment Type"
            priorityLabel.text = "Priority"
        } else {
            assignmentTypeLabel.text = "Type: \(userSelectedAssignmentType!)"
            priorityLabel.text = "Priority: \(userSelectedPriority!)"
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if userSelectedAssignmentType == nil {
            assignmentTypeLabel.text = "Assignment Type"
        } else {
            assignmentTypeLabel.text = "Type: \(userSelectedAssignmentType!)"
        }
        
        if userSelectedPriority == nil {
            priorityLabel.text = "Priority"
        } else {
            priorityLabel.text = "Priority: \(userSelectedPriority!)"
            priorityImage.hidden = false
            priorityImage.image = priorityImage.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            if userSelectedPriority! == "Low" {
                priorityImage.tintColor = UIColor.lowPriorityIconColor()
            } else if userSelectedPriority! == "Medium" {
                priorityImage.tintColor = UIColor.mediumPriorityIconColor()
            } else if userSelectedPriority! == "High" {
                priorityImage.tintColor = UIColor.highPriorityIconColor()
            }
        }
        
        if userSelectedDueDate == nil {
            dueDateLabel.text = "Due Date"
        } else {
            dueDateLabel.text = "Due: \(userSelectedDueDate!)"
        }
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        delegate?.userDidCancel(self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addCourseSegue" {
            let controller = segue.destinationViewController as! CourseSearchTableViewController
            controller.delegate = self
        } else if segue.identifier == "assignmentTypeSegue" {
            let controller = segue.destinationViewController as! AssignmentTypeTableViewController
            controller.delegate = self
        } else if segue.identifier == "prioritySegue" {
            let controller = segue.destinationViewController as! AssignmentPriorityTableViewController
            controller.delegate = self
        } else if segue.identifier == "addAssignemtDateSegue" {
            let controller = segue.destinationViewController as! AddAssignmentDate
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

extension AddAssigmentsTableViewController: AssignmentTypeDelegate {
    func userDidSelectAssignment(type: String) {
        userSelectedAssignmentType = type
    }
}

extension AddAssigmentsTableViewController: AssignmentPriorityDelegate {
    func userDidSelect(priority priority: String) {
        userSelectedPriority = priority
    }
}

extension AddAssigmentsTableViewController: AddAssignmentDateDelegate {
    func userDidCancel(controller: AddAssignmentDate) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    func userDidSelect(date date: String) {
        userSelectedDueDate = date
    }
}

