//
//  CoursesViewController.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 2/28/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit

class CoursesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Courses"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addInfo(sender: AnyObject) {
        
        let addInfoController =   UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        let addSemesterAction =   UIAlertAction(title: "Add Semester", style: .Default) { (UIAlertAction) -> Void in
            self.performSegueWithIdentifier("addSemesterSegue", sender: self)
        }
        let addCourseAction =     UIAlertAction(title: "Add Course", style: .Default, handler: nil)
        let addAssignmentAction = UIAlertAction(title: "Add Assignment", style: .Default, handler: nil)
        let cancelAction =        UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        addInfoController.addAction(addSemesterAction)
        addInfoController.addAction(addCourseAction)
        addInfoController.addAction(addAssignmentAction)
        addInfoController.addAction(cancelAction)
        self.presentViewController(addInfoController, animated: true, completion: nil)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addSemesterSegue" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! SemesterDetailTableViewController
            controller.delegate = self
        }
    }

}

extension CoursesViewController: SemesterDelegate {
    
    func SemesterDetailDidCancel(controller: SemesterDetailTableViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}