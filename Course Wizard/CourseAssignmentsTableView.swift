//
//  CourseAssignmentsTableView.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 4/25/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit
import CoreData

class CourseAssignmentsTableView: UIViewController, NSFetchedResultsControllerDelegate {
    
    var courseTitle: String?
    var course: Course?
    var currentCourse: [Course] = []
    var coreDataStack: CoreDataStack!
    
    
    @IBOutlet weak var assignmentsTableVIew: UITableView!
    
    lazy var fetchedResultsController: NSFetchedResultsController = {
        let fetchRequest = NSFetchRequest(entityName: "Course")
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        let fetchResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.coreDataStack.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        fetchResultsController.delegate = self
        
        return fetchResultsController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = courseTitle
        
        let assignmentPredicate = NSPredicate(format: "name == %@", course!.name!)
        fetchedResultsController.fetchRequest.predicate = assignmentPredicate
        
        do {
            try self.fetchedResultsController.performFetch()
        } catch let error as NSError {
            print("Error performing fetch \(error.localizedDescription)")
        }
        
        assignmentsTableVIew.emptyDataSetSource = self
        assignmentsTableVIew.emptyDataSetDelegate = self
        assignmentsTableVIew.tableFooterView = UIView()
        
        
        if fetchedResultsController.fetchedObjects?.count > 0 {
            currentCourse = (fetchedResultsController.fetchedObjects as? [Course])!
            assignmentsTableVIew.reloadData()
            assignmentsTableVIew.backgroundColor = UIColor.tableviewCellBackgroundColor()
        }
        
        if currentCourse.count == 0 {
            assignmentsTableVIew.reloadData()
            
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        do {
            currentCourse.removeAll()
            try self.fetchedResultsController.performFetch()
        } catch let error as NSError {
            print("Error performing fetch \(error.localizedDescription)")
        }
        
        if fetchedResultsController.fetchedObjects?.count > 0 {
            currentCourse = (fetchedResultsController.fetchedObjects as? [Course])!
            assignmentsTableVIew.reloadData()
            assignmentsTableVIew.backgroundColor = UIColor.tableviewCellBackgroundColor()
        }
        
        if currentCourse.count == 0 {
            assignmentsTableVIew.reloadData()
            
        }

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addAssignmentToCourseSegue" {
            let controller = segue.destinationViewController as! AddAssigmentsTableViewController
            controller.userSelectedCourse = course
            controller.coreDataStack = coreDataStack
            controller.delegate = self
        }
    }
}

extension CourseAssignmentsTableView: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    
    func titleForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        return UIFont.headlineFontWith(headline: courseTitle!)
    }
    
    func descriptionForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        return UIFont.taglineFontWith(body: "Add an assignment by pressing the \"+\" button above")
    }
    
    func imageForEmptyDataSet(scrollView: UIScrollView!) -> UIImage! {
        return UIImage(named: "file")
    }
    
    func imageTintColorForEmptyDataSet(scrollView: UIScrollView!) -> UIColor! {
        return UIColor.imageTintColor()
    }
    
}

extension CourseAssignmentsTableView: AddAssignmentDelegate {
    func userDidCancel(controller: AddAssigmentsTableViewController) {
        navigationController?.popViewControllerAnimated(true)
    }
}

extension CourseAssignmentsTableView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if currentCourse.count != 0 {
            for c in currentCourse {
                return (c.assignment?.count)!
            }
        }
        
        return 0
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "assignmentCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! CourseAssignmentsTableViewCell
        
        let record = currentCourse
        
        for rec in record {
            let assignment = rec.assignment?.allObjects[indexPath.row] as? Assignment
            let title = assignment?.name
            let type = assignment?.type
            let date = assignment?.dueDate
            
            cell.configureCell(title, type: type, dueDate: date)
            
        }
        
        cell.backgroundColor = UIColor.tableviewCellBackgroundColor()
        cell.textLabel?.textColor = UIColor.darkGrayColor()
        
        return cell
    }

}
