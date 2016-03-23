//
//  SemestersTableViewController.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 3/2/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit
import CoreData

class SemestersTableViewController: UITableViewController {

    var coreDataStack = CoreDataStack()
    var semesters = [Semester]()
    

    let cellIdentifier = "semesterCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Semesters"
        
        reloadData()
        tableView.reloadData()
        
        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
        tableView.tableFooterView = UIView()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        reloadData()
        tableView.reloadData()
        
    }
    
    func reloadData(predicate: NSPredicate? = nil) {
        
        let fetchRequest = NSFetchRequest(entityName: "Semester")
        fetchRequest.predicate = predicate
        
        do {
            if let results = try coreDataStack.managedObjectContext.executeFetchRequest(fetchRequest) as? [Semester] {
                semesters = results
            }
        } catch {
            return
        }
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return semesters.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let yearIndex = semesters[indexPath.row].startDate.endIndex.advancedBy(-4)
        let year = semesters[indexPath.row].startDate.substringFromIndex(yearIndex)
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! SemesterTableViewCell
        
        cell.configureCellWith(semesters[indexPath.row].type, andYear: year)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 55.0
    }
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            //Delete the semester from core data here.
        }
        
    }

}

extension SemestersTableViewController: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    
    func titleForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        return UIFont.headlineFontWith(headline: "Semesters")
    }
    
    func descriptionForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        return UIFont.taglineFontWith(body: "No semesters have been added, please add some!")
    }
    
    func imageForEmptyDataSet(scrollView: UIScrollView!) -> UIImage! {
        return UIImage(named: "ruler_pencil")
    }
    
    func imageTintColorForEmptyDataSet(scrollView: UIScrollView!) -> UIColor! {
        return UIColor.imageTintColor()
    }
    
}

    





