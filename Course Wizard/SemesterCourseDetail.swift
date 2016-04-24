//
//  SemesterCourseDetail.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 4/21/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit
import CoreData

class SemesterCourseDetail: UITableViewController, NSFetchedResultsControllerDelegate {
    
    var semesterType: String?
    var semesterYear: String?
    let coreDataStack = CoreDataStack()
    var courses: NSArray?
    
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
        
        let predicate = NSPredicate(format: "ANY type == %@ AND year == %@", semesterType!, semesterYear!)
        
        fetchedResultsController.fetchRequest.predicate = predicate
        
        do {
            try self.fetchedResultsController.performFetch()
        } catch let error as NSError {
            print("Error performing fetch \(error.localizedDescription)")
        }
        
        tableView.backgroundColor = UIColor.tableviewCellBackgroundColor()
        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
        tableView.tableFooterView = UIView()
        
        navigationItem.title = semesterType! + " " + semesterYear!
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let record = (fetchedResultsController.fetchedObjects![section] as? Semester)
        print(record?.course?.allObjects.count)
        return (record?.course?.allObjects.count)!
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50.0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "courseCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! SemesterCourseDetailCell
        

            let record = fetchedResultsController.fetchedObjects as? [Semester]
            
            for rec in record! {
                if rec.type == semesterType && rec.year == semesterYear {
                let title = rec.course?.allObjects[indexPath.row].name
                cell.configureCell(title!)
            }
        }
       
        cell.backgroundColor = UIColor.tableviewCellBackgroundColor()

        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addCourseFromSemesterSegue" {
            let controller = segue.destinationViewController as! CourseDetailTableViewController
            controller.delegate = self
            controller.semesterType = semesterType
            controller.semesterYear = semesterYear
        }
    }
}

extension SemesterCourseDetail: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    
    func titleForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        return UIFont.headlineFontWith(headline: navigationItem.title!)
    }
    
    func descriptionForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        return UIFont.taglineFontWith(body: "No courses have been added to this semester. Add a course by pressing the \"+\" button above.")
    }
    
    func imageForEmptyDataSet(scrollView: UIScrollView!) -> UIImage! {
        return UIImage(named: "ruler_pencil")
    }
    
    func imageTintColorForEmptyDataSet(scrollView: UIScrollView!) -> UIColor! {
        return UIColor.imageTintColor()
    }
    
    func verticalOffsetForEmptyDataSet(scrollView: UIScrollView!) -> CGFloat {
        return -50.0
    }
    
}

extension SemesterCourseDetail: CourseDetailDelegate {
 
    func CourseDetailDidCancel(controller: CourseDetailTableViewController) {
        navigationController?.popViewControllerAnimated(true)
    }
    
}