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

class CoursesViewController: UIViewController, NSFetchedResultsControllerDelegate {
    
    @IBOutlet weak var coursesTableView: UITableView!
    
    //Access to the core data stack
    var coreDataStack = CoreDataStack()
    var currentSemester: [Semester] = []
    var courseTitle: String?
    var courseDays: String?
    
    lazy var fetchedResultsController: NSFetchedResultsController = {
        let fetchRequest = NSFetchRequest(entityName: "Semester")
        let sortDescriptor = NSSortDescriptor(key: "type", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        let fetchResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.coreDataStack.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        fetchResultsController.delegate = self
        
        return fetchResultsController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        moc.parentContext = self.coreDataStack.managedObjectContext
//        
       let coursePredicate = NSPredicate(format: "currentSemester == %@", true)
       fetchedResultsController.fetchRequest.predicate = coursePredicate
        
        do {
            try self.fetchedResultsController.performFetch()
        } catch let error as NSError {
            print("Error performing fetch \(error.localizedDescription)")
        }
        
        coursesTableView.emptyDataSetSource = self
        coursesTableView.emptyDataSetDelegate = self
        coursesTableView.tableFooterView = UIView()
    
        coursesTableView.dataSource = self
        coursesTableView.delegate = self
        
        if fetchedResultsController.fetchedObjects?.count > 0 {
            currentSemester = (fetchedResultsController.fetchedObjects as? [Semester])!
            coursesTableView.reloadData()
            coursesTableView.backgroundColor = UIColor.tableviewCellBackgroundColor()
        }
        
        if currentSemester.count == 0 {
            coursesTableView.reloadData()
            
        }
    
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
//        let predicate = NSPredicate(format: "ANY currentSemester == %@", true)
//        
//        fetchedResultsController.fetchRequest.predicate = predicate
        
        do {
            currentSemester.removeAll()
            try self.fetchedResultsController.performFetch()
            let semester = fetchedResultsController.fetchedObjects as? [Semester]
            for sem in semester! {
                print(sem.course!.count)
            }
        } catch let error as NSError {
            print("Error performing fetch \(error.localizedDescription)")
        }
        
        if fetchedResultsController.fetchedObjects?.count > 0 {
            currentSemester = (fetchedResultsController.fetchedObjects as? [Semester])!
            coursesTableView.backgroundColor = UIColor.tableviewCellBackgroundColor()
        }
        
        if currentSemester.count == 0 {
            coursesTableView.reloadData()
        }
        
        coursesTableView.reloadData()
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        coursesTableView.reloadData()
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
        
        let addCourseAction =     UIAlertAction(title: "Add Course", style: .Default) { (UIAlertAction) -> Void in
            self.performSegueWithIdentifier("addCourseSegue", sender: self)
        }

        let cancelAction =        UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        //Here we add all the actions to the controller.
        addInfoController.addAction(addSemesterAction)
        addInfoController.addAction(addCourseAction)
        addInfoController.addAction(cancelAction)
        
        //Here we present the Alert Action
        self.presentViewController(addInfoController, animated: true, completion: nil)
        
        addInfoController.view.tintColor = UIColor.actionBackgroundColor()

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
        } else if segue.identifier == "addCourseSegue" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! CourseDetailTableViewController
            controller.coreDataStack = coreDataStack
            controller.delegate = self
            
            if currentSemester.count == 0 {
                let alertController = UIAlertController(title: nil, message: "Please add a current semester before adding a course", preferredStyle: .Alert)
                let alertAction = UIAlertAction(title: "Okay", style: .Default, handler: nil)
                alertController.addAction(alertAction)
                self.presentViewController(alertController, animated: true, completion: nil)
            } else {
                controller.semester = currentSemester[0]
            }
        } else if segue.identifier == "courseAssignmentsSegue" {
            let currentIndexPath = coursesTableView.indexPathForSelectedRow
            let record = currentSemester
            let controller = segue.destinationViewController as! CourseAssignmentsTableView
            for rec in record {
                controller.courseTitle = rec.course?.allObjects[currentIndexPath!.row].name
                controller.course = rec.course?.allObjects[currentIndexPath!.row] as? Course
            }
            controller.coreDataStack = coreDataStack
        }
    }
    
}

extension CoursesViewController: CourseDetailDelegate {
    func CourseDetailDidCancel(controller: CourseDetailTableViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}

extension CoursesViewController: SemesterDelegate {
    
    func SemesterDetailDidCancel(controller: SemesterDetailTableViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}

extension CoursesViewController: DZNEmptyDataSetDelegate, DZNEmptyDataSetSource {
    
    func titleForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        return UIFont.headlineFontWith(headline: "Courses")
    }
    
    func descriptionForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        return UIFont.taglineFontWith(body: "Add a semester, course or assignment by pressing the \"+\" button above")
    }
    
    func imageForEmptyDataSet(scrollView: UIScrollView!) -> UIImage! {
        return UIImage(named: "course")
    }
    
    func imageTintColorForEmptyDataSet(scrollView: UIScrollView!) -> UIColor! {
        return UIColor.imageTintColor()
    }
    
}

extension CoursesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let record = currentSemester
        print(record.count)
        
        for rec in record {
            print(rec.course?.count)
            return (rec.course?.count)!
        }
        
        return 0
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75.0
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let record = currentSemester
    
        
        for rec in record {
            if rec.course?.count > 0 {
                return rec.type! + " " + rec.year!
            }
        }
        
        return nil
    }
    
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.contentView.backgroundColor = UIColor.whiteColor()
        header.textLabel?.textColor = UIColor.darkGrayColor()
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "courseCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! CourseViewControllerCell
        
        let record = currentSemester
        
        for rec in record {
                let course = rec.course?.allObjects[indexPath.row] as? Course
                let title = course?.name
                let code = course?.crn
                let location = course?.location
                var days = course?.days as? [String]
                let time = (course?.startTime)! + " " +  "-" + " " + (course?.endTime)!
            
                getCourseDays(&days!)
            
                cell.configureCell(title!, courseCode: code!, courseLocation: location!, courseDays: courseDays!, courseTime: time)
            
            }
        
        cell.backgroundColor = UIColor.tableviewCellBackgroundColor()
        cell.textLabel?.textColor = UIColor.darkGrayColor()
        
        return cell
    }
    
    func getCourseDays(inout days: [String]) {
        
        var courseDay: String = ""
        
        for day in days {
            var str: String = ""
            str += day + " "
            courseDay += str
        }
        
        courseDays = courseDay
    }
    
}

extension CoursesViewController: AddAssignmentDelegate {
    func userDidCancel(controller: AddAssigmentsTableViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}



