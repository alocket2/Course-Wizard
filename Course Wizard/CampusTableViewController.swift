//
//  CampusTableViewController.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 3/18/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit
import CoreData

protocol CampusDelegate: class {
    func didSelectCampus(campus: String)
}

class CampusTableViewController: UITableViewController {
    
    let campuses = ["Boca Raton", "Dania Beach (Sea Tech)", "Davie", "Fort Lauderdale", "Harbor Branch", "Jupiter"]
    let cellIdentifier = "campusCell"
    
    weak var delegate: CampusDelegate?
    let coreDataStack = CoreDataStack()
    
    override func viewDidLoad() {
        title = "Campuses"
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return campuses.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        
        cell.textLabel?.text = campuses[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        delegate?.didSelectCampus(campuses[indexPath.row])
        saveCampusToCoreData(campuses[indexPath.row])
        navigationController?.popViewControllerAnimated(true)
    }
    
    func saveCampusToCoreData(location: String) {
        // Check to see if there is currently a campus
        guard let entity = NSEntityDescription.entityForName("Campus", inManagedObjectContext: coreDataStack.managedObjectContext) else {
            fatalError("Could not find entity descriptions!")
        }
        
        let campusEntity = Campus(entity: entity, insertIntoManagedObjectContext: coreDataStack.managedObjectContext)
        campusEntity.location = location
        
        do {
            try coreDataStack.managedObjectContext.save()
        } catch {
            print("Could not save location...")
        }
    }
    

}
