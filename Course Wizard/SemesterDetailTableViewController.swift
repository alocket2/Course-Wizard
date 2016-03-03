//
//  SemesterDetailTableViewController.swift
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
//

import UIKit
import CoreData

protocol SemesterDelegate: class {
    func SemesterDetailDidCancel(controller:  SemesterDetailTableViewController)
}

class SemesterDetailTableViewController: UITableViewController {
    
    @IBOutlet weak var semesterType: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    
    var chosenSemester: String?
    var startDate: String?
    var endDate: String?
    
    weak var delegate: SemesterDelegate!
    var coreDataStack: CoreDataStack!
    
    var semesters = [Semester]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add Semester"
        
        semesterType.text = "Semester"
        startDateLabel.text = "Start Date"
        endDateLabel.text = "End Date"
    }
    
    override func viewWillAppear(animated: Bool) {
        if semesterType.text == nil {
            semesterType.text = "Semester"
        } else {
            guard chosenSemester != nil else {
                return
            }
            
            semesterType.text = "Semester: \(chosenSemester!)"
        }
        
        if startDateLabel.text == nil {
            startDateLabel.text = "Start Date"
        } else {
            guard startDate != nil else {
                return
            }
            
            startDateLabel.text = "Start Date: \(startDate!)"
            
        }
        
        if endDateLabel.text == nil {
            endDateLabel.text = "End Date"
        } else {
            guard endDate != nil else {
                return
            }
            
            endDateLabel.text = "Start Date: \(endDate!)"
            
        }
        
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        
        delegate?.SemesterDetailDidCancel(self)
        
    }
    
    @IBAction func saveSemester(sender: UIBarButtonItem) {
        // Save to core data
        guard let entity = NSEntityDescription.entityForName("Semester", inManagedObjectContext: coreDataStack.managedObjectContext) else {
            fatalError("Could not find entity descriptions!")
        }
        
        let semesterEntity = Semester(entity: entity, insertIntoManagedObjectContext: coreDataStack.managedObjectContext)
        semesterEntity.type = chosenSemester!
        semesterEntity.startDate = startDate!
        semesterEntity.endDate = endDate!
        
        do {
            try coreDataStack.managedObjectContext.save()
        } catch {
            print("Could not save...")
        }
        
        dismissViewControllerAnimated(true, completion: nil)
        printTestData()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "chooseSemesterSegue" {
            let controller = segue.destinationViewController as! SemesterTypeTableViewController
            controller.delegate = self
        } else if segue.identifier == "chooseStartDateSegue" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! SemesterDatePickerController
            controller.typeOfSegue = "StartDateSegue"
            controller.delegate = self
        } else if segue.identifier == "chooseEndDateSegue" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! SemesterDatePickerController
            controller.typeOfSegue = "EndDateSegue"
            controller.delegate = self
        }
    }
    
    func printTestData() {
        
        let fetchRequest = NSFetchRequest(entityName: "Semester")
        
        do {
            let results = try coreDataStack.managedObjectContext.executeFetchRequest(fetchRequest)
            
            for result in results {
                if let semesterOfType = result.valueForKey("type") as? String, startSemesterDate = result.valueForKey("startDate") as? String, endSemesterDate = result.valueForKey("endDate") as? String {
                    print("Starting semester \(semesterOfType) beginning \(startSemesterDate), ending \(endSemesterDate)")
                }
            }
            
        } catch {
            fatalError("Didnt get fetch")
        }
    }
    
}


extension SemesterDetailTableViewController: SemesterTypeDelegate {

    func semesterType(didFinishSelectingType semesterType: String) {
        chosenSemester = semesterType
    }
    
}


extension SemesterDetailTableViewController: SemesterDatePickerDelegate {
    
    func SemesterDatePickerDidCancel(controller: SemesterDatePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func SemesterDatePicker(didFinishSelectingStartDate date: String) {
        startDate = date
    }
    
    func SemesterDatePicker(didFinishSelectingEndDate date: String) {
        endDate = date
    }
    
}

