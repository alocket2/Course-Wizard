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

    
    var coreDataStack: CoreDataStack!
    var semesters = [Semester]()
    
    let cellIdentifier = "semesterCell"
    let yearOfSemester: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Semesters"
    }
    
    override func viewWillAppear(animated: Bool) {
        reloadData()
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
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return semesters.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        
        let semYearIndex = semesters[indexPath.row].startDate.endIndex.advancedBy(-4)
        let semYear = semesters[indexPath.row].startDate.substringFromIndex(semYearIndex)
        
        cell.textLabel?.text = semesters[indexPath.row].type + " " + semYear
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            //Delete the semester from core data here.
        }
        
    }
    
}
