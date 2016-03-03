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
    var sections = [String]()
    var numberOfRowsPerSection = [Int]()
    
    let cellIdentifier = "semesterCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Semesters"
    }
    
    override func viewWillAppear(animated: Bool) {
        
        reloadData()
        checkForNewAndCreateSections()
        setupNumberOfRowsPerSection()
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
    
    func checkForNewAndCreateSections() {
        
        for semester in semesters {
            let semYearIndex = semester.startDate.endIndex.advancedBy(-4)
            let semYear = semester.startDate.substringFromIndex(semYearIndex)
            if let _ = sections.indexOf(semYear){
                continue
            } else {
                sections.append(semYear)
            }
        }
    }
    
    func setupNumberOfRowsPerSection() {
        
        var rows: Int = 0
        var currentSection: String?
        
        for section in sections {
            
            if currentSection != section && currentSection != nil {
                numberOfRowsPerSection.append(rows)
                rows = 0
            }
            
            currentSection = section
            
            for semester in semesters {
                let semYearIndex = semester.startDate.endIndex.advancedBy(-4)
                let semYear = semester.startDate.substringFromIndex(semYearIndex)
                
                if semYear == section {
                    rows += 1
                    
                }
            }
        }
        
        numberOfRowsPerSection.append(rows)
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rows: Int = 0
        
        if section < numberOfRowsPerSection.count {
            rows = numberOfRowsPerSection[section]
        }
        
        return rows
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        
        cell.textLabel?.text = semesters[indexPath.row].type
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            //Delete the semester from core data here.
        }
        
    }
    
}
