//
//  MoreTableViewController.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 3/2/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit
import CoreData

class MoreTableViewController: UITableViewController {
    
    var coreDataStack: CoreDataStack!
    
    @IBOutlet weak var currentCampusLabel: UILabel!
    var currentCampus: String?
    
    override func viewDidLoad() {
        title = "More"
        
        if currentCampus == nil {
            currentCampusLabel.text = "Campus"
        } else {
            currentCampusLabel.text = "Campus: \(currentCampus)"
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        if currentCampus == nil {
            currentCampusLabel.text = "Campus"
        } else {
            currentCampusLabel.text = "Campus: \(currentCampus!)"
            saveCampusToCoreData()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showSemestersSegue" {
            let controller = segue.destinationViewController as! SemestersTableViewController
            controller.coreDataStack = coreDataStack
        } else if segue.identifier == "selectCampusSegue" {
            let controller = segue.destinationViewController as! CampusTableViewController
            controller.delegate = self
        }
    }
    
    func saveCampusToCoreData() {
        
        // Check to see if there is currently a campus
        let campusFetchRequest = NSFetchRequest(entityName: "Campus")
        
        do {
            
            let results = try coreDataStack.managedObjectContext.executeFetchRequest(campusFetchRequest) as? [String]
            
            if results!.count == 0 {
                //There is no campus so set one
                guard let entity = NSEntityDescription.entityForName("Campus", inManagedObjectContext: coreDataStack.managedObjectContext) else {
                    fatalError("Could not find entity descriptions!")
                }
                let campusEntity = Campus(entity: entity, insertIntoManagedObjectContext: coreDataStack.managedObjectContext)
                campusEntity.location = currentCampus
                
                do {
                    try coreDataStack.managedObjectContext.save()
                } catch {
                    print("Could not save...")
                }
                
            } else {
                //There is a campus so check if it is the same
                
            }
            
        } catch {
            fatalError("Could not set campus")
        }
        
    }

}

extension MoreTableViewController: CampusDelegate {
    
    func userDidCancelSelectingCampus(controller: CampusTableViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func campusDelegate(userDidSelectCampus campus: String) {
        currentCampus = campus
    }
    
}
