//
//  DegreeTableViewController.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 3/21/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit
import CoreData

protocol DegreeProtocol: class {
    func userHasSelectedDegree(degree: String)
}

class DegreeTableViewController: UITableViewController {
    
    weak var delegate: DegreeProtocol?
    
    let coreDataStack = CoreDataStack()
    
    override func viewDidLoad() {
        self.navigationItem.title = "Degrees"
    }
    
    
    lazy var cwDegrees: [CWDegrees] = {
        return CWDegrees.cwDegrees()
    }()
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return cwDegrees.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let cwDegree = cwDegrees[section]
        return cwDegree.type
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cwDegree = cwDegrees[section]
        return cwDegree.degrees.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "degreeCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! DegreeTableViewCell
        
        let cwDegree = cwDegrees[indexPath.section]
        let degree = cwDegree.degrees[indexPath.row]
        
        cell.configureCellWith(degree)
        
        return cell
    }
    
    func saveDataToCoreData(degreeType: String, degreeName: String) {
            // Check to see if there is currently a campus
            guard let entity = NSEntityDescription.entityForName("Degree", inManagedObjectContext: coreDataStack.managedObjectContext) else {
                fatalError("Could not find entity descriptions!")
            }
            
            let degreeEntity = Degree(entity: entity, insertIntoManagedObjectContext: coreDataStack.managedObjectContext)
            degreeEntity.name = degreeName
            degreeEntity.type = degreeType
            
            do {
                try coreDataStack.managedObjectContext.save()
            } catch {
                print("Could not save degree...")
            }
        }

}


extension DegreeTableViewController {
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cwDegree = cwDegrees[indexPath.section]
        let degree = cwDegree.degrees[indexPath.row]
        let type = cwDegrees[indexPath.section].type
        
        saveDataToCoreData(type, degreeName: degree.degree)
        
        delegate?.userHasSelectedDegree(degree.degree)
        navigationController?.popViewControllerAnimated(true)
    }
}


