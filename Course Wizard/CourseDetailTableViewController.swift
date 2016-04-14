//
//  CourseDetailTableViewController.swift
//  Course Wizard
//
//  Created by Daniel Marquez on 4/14/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit
import CoreData

protocol CourseDetailDelegate: class {
    func CourseDetailDidCancel(controller: CourseDetailTableViewController)
}

class CourseDetailTableViewController: UITableViewController {
    
    var delegate: CourseDetailDelegate!
    var coreDataStack = CoreDataStack()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         title = "Add a Course"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "courseSearchSegue" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! CourseSearchTableViewController
            controller.delegate = self 
        }
    }
}

extension CourseDetailTableViewController: CourseSearchDelegate {
    func CourseSearchDidFinish(course: CWCourse?) {
        
    }
    
    func CourseSearchDidCancel(controller: CourseSearchTableViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}