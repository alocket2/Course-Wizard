//
//  CoursesViewController.swift
//  Course Wizard
//
//  Created by Anthony Lockett
//             Daisy McCoy
//             Daniel Marquez
//             Khalil Millwood
//             Evan Liebovitz
//             Giselle Mohammed
//             Freguens Mildort on 2/28/16.
//  Copyright © 2016 Anthony Lockett & Team. All rights reserved.

import UIKit
import CoreData

class CoursesViewController: UIViewController {
    
    //Access to the core data stack
    var coreDataStack: CoreDataStack!
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
        tableView.tableFooterView = UIView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Alert controller that shows when a + button is selected
    @IBAction func addInfo(sender: AnyObject) {
        
        //Every alert controller first needs an initializer, thats what we are doing here.
        let addInfoController =   UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        //Every alertController needs an action which is the title for such action.
        let addSemesterAction =   UIAlertAction(title: "Add Semester", style: .Default) { (UIAlertAction) -> Void in
            //This is where we transition to the add semester view,
            self.performSegueWithIdentifier("addSemesterSegue", sender: self)
        }
        
        let addCourseAction =     UIAlertAction(title: "Add Course", style: .Default, handler: nil)
        let addAssignmentAction = UIAlertAction(title: "Add Assignment", style: .Default, handler: nil)
        let cancelAction =        UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        //Here we add all the actions to the controller.
        addInfoController.addAction(addSemesterAction)
        addInfoController.addAction(addCourseAction)
        addInfoController.addAction(addAssignmentAction)
        addInfoController.addAction(cancelAction)
        
        //Here we present the Alert Action
        self.presentViewController(addInfoController, animated: true, completion: nil)
    }

    /*
        The prepare for segue method is where you want to prepare all the information you want to send to the controller you want to transition to.
        segue.identifier - here we are making sure we are transitioning to the right view, since we have seveal segues.
        When we have a navigation controller aded to a view controller we need to refernce that when transitioning. Since its in our view heirarchy. This is why we first say segue.destinationViewController as! UINavigationController.
        We know that we need to transition to some view. That view has a navigation controlle rattached to it, so we need to transition to the first. Then we use that to transition to our final view with navigationController.topViewController as! SemesterDetailTableViewController.
        controller.coreDataStack = coreDataStack, here we are just passing the coreDataStack down the chain to the proper view we want to access it from.
        controller.delegate = self. Here we are taking control of the delegate methods we are implementing from whichever protocol.
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addSemesterSegue" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! SemesterDetailTableViewController
            controller.coreDataStack = coreDataStack
            controller.delegate = self
        }
    }

}

/*
    Extensions: Its always a good idea ot use extensions when adding new functionality like implementing a protocol. This condenses the code and keeps it manageable and easier to maintain.
*/

extension CoursesViewController: SemesterDelegate {
    
    /*
        Implementing a protocol: This can get quiet confusing, when to, where to. I dont know how to explain it without examples, give it a shot. If anything call me and we can go over it.
    */
    
    func SemesterDetailDidCancel(controller: SemesterDetailTableViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}

extension CoursesViewController: DZNEmptyDataSetDelegate, DZNEmptyDataSetSource {
    
    func titleForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let str = "Courses"
        let attrs = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)]
        
        return NSAttributedString(string: str, attributes: attrs)
    }
    
    func descriptionForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let str = "No courses have been added, please add some!"
        let attrs = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleBody)]
        
        return NSAttributedString(string: str, attributes: attrs)
    }
    
    func buttonTitleForEmptyDataSet(scrollView: UIScrollView!, forState state: UIControlState) -> NSAttributedString! {
        let str = "Add Course"
        let attrs = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleCallout)]
        
        return NSAttributedString(string: str, attributes: attrs)
    }
    
    func emptyDataSetDidTapButton(scrollView: UIScrollView!) {
        let ac = UIAlertController(title: "We will add courses!", message: nil, preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title: "Hurray", style: .Default, handler: nil))
        presentViewController(ac, animated: true, completion: nil)
    }
    
}

