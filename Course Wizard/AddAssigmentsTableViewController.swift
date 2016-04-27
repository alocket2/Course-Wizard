//
//  AddAssigmentsTableViewController.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 4/16/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit
import CoreData

protocol AddAssignmentDelegate: class {
    func userDidCancel(controller: AddAssigmentsTableViewController)
}

class AddAssigmentsTableViewController: UITableViewController {
    
    @IBOutlet weak var assignmentTypeLabel: UILabel!
    @IBOutlet weak var priorityLabel: UILabel!
    @IBOutlet weak var priorityImage: UIImageView!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var assignmentNameTextField: UITextField!
    
    weak var delegate: AddAssignmentDelegate!
    
    var userSelectedCourse: Course?
    var coreDataStack: CoreDataStack!
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
        
        if userSelectedCourse == nil {
            courseLabel.text = "Course"
        } else {
            courseLabel.text = "Course: \(userSelectedCourse!.name!)"
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
        if segue.identifier == "assignmentTypeSegue" {
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
    
    @IBAction func save(sender: UIBarButtonItem) {
        
        guard let entity = NSEntityDescription.entityForName("Assignment", inManagedObjectContext: coreDataStack.managedObjectContext) else {
            fatalError("Could not find entity descriptions!")
        }
        
        let assignmentEntity = Assignment(entity: entity, insertIntoManagedObjectContext: coreDataStack.managedObjectContext)
        
        assignmentEntity.name = assignmentNameTextField.text
        assignmentEntity.type = assignmentTypeLabel.text
        assignmentEntity.priority = priorityLabel.text
        assignmentEntity.dueDate = dueDateLabel.text
        assignmentEntity.course = userSelectedCourse
        
        do {
            try coreDataStack.managedObjectContext.save()
            self.navigationController?.popViewControllerAnimated(true)
        } catch {
            print("Could not save...")
        }
        
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

