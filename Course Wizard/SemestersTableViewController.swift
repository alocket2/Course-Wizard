//
//  SemestersTableViewController.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 3/2/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit
import CoreData

class SemestersTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    var coreDataStack = CoreDataStack()
    var semesters = [Semester]()
    
    lazy var fetchedResultsController: NSFetchedResultsController = {
        let fetchRequest = NSFetchRequest(entityName: "Semester")
        let sortDescriptor = NSSortDescriptor(key: "year", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        let fetchResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.coreDataStack.managedObjectContext, sectionNameKeyPath: "year", cacheName: nil)
        
        fetchResultsController.delegate = self
        
        return fetchResultsController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        do {
            try self.fetchedResultsController.performFetch()
        } catch let error as NSError {
            print("Error performing fetch \(error.localizedDescription)")
        }
        
        title = "Semesters"
        
        
        tableView.reloadData()
        tableView.backgroundColor = UIColor.tableviewCellBackgroundColor()
        
        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
        tableView.tableFooterView = UIView()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        do {
            try self.fetchedResultsController.performFetch()
        } catch let error as NSError {
            print("Error performing fetch \(error.localizedDescription)")
        }
        
        
        tableView.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return (fetchedResultsController.sections?.count)!
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return (fetchedResultsController.sections![section].numberOfObjects)
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return fetchedResultsController.sections![section].name
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.contentView.backgroundColor = UIColor.whiteColor()
        header.textLabel?.textColor = UIColor.darkGrayColor()
        
    }
 
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "semesterCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        cell?.backgroundColor = UIColor.tableviewCellBackgroundColor()
        cell?.textLabel?.textColor = UIColor.darkGrayColor()
        
        let record = fetchedResultsController.objectAtIndexPath(indexPath)
        
        if let name = record.valueForKey("type") as? String {
            cell?.textLabel?.text = name
        }
        
        return cell!
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
         if segue.identifier == "addSemester" {
            let controller = segue.destinationViewController as! SemesterDetailTableViewController
            controller.delegate = self
         } else if segue.identifier == "semesterDetailSegue" {
            let selectedIndex = self.tableView.indexPathForCell(sender as! UITableViewCell)
            var selectedType: String = ""
            var selectedYear: String = ""
            let record = fetchedResultsController.objectAtIndexPath(selectedIndex!)
            
            if let recordType = record.valueForKey("type") as? String, recordYear = record.valueForKey("year") as? String {
                selectedType = recordType
                selectedYear = recordYear
            }
            let controller = segue.destinationViewController as! SemesterCourseDetail
            controller.semesterType = selectedType
            controller.semesterYear = selectedYear
        }
    }
    
    
}

extension SemestersTableViewController: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    
    func titleForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        return UIFont.headlineFontWith(headline: "Semesters")
    }
    
    func descriptionForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        return UIFont.taglineFontWith(body: "No semesters have been added, add some by pressing the \"+\" button above.")
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


extension SemestersTableViewController: SemesterDelegate {
    func SemesterDetailDidCancel(controller: SemesterDetailTableViewController) {
        navigationController?.popViewControllerAnimated(true)
    }
}
    





