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
    @IBOutlet weak var campusLabel: UILabel!
    
    var chosenSemester: String?
    var startDate: String?
    var endDate: String?
    var campus: String?
    
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
        
        let yearIndex = startDateLabel.text?.endIndex.advancedBy(-4)
        let year = startDateLabel.text?.substringFromIndex(yearIndex!)
        
        let semesterExists = checkIfSemesterExistsForYear(year!)
        
        // Save to core data
        guard let entity = NSEntityDescription.entityForName("Semester", inManagedObjectContext: coreDataStack.managedObjectContext) else {
            fatalError("Could not find entity descriptions!")
        }
        
        if !semesterExists {
        
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
            
        } else {
            let alert = UIAlertController(title: "Error", message: "Sorry, that semester already exists for the specified year. Either add a different semester or delete the original", preferredStyle: UIAlertControllerStyle.Alert)
            let alertAction = UIAlertAction(title: "Okay", style: .Default, handler: { (UIAlertAction) -> Void in
                self.dismissViewControllerAnimated(true, completion: nil)
            })
            alert.addAction(alertAction)
            self.presentViewController(alert, animated: true, completion: nil)
        }
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
        } else if segue.identifier == "selectCampusSegue" {
            let controller = segue.destinationViewController as! CampusTableViewController
            controller.delegate = self
        }
    }
    
    func checkIfSemesterExistsForYear(year: String) -> Bool {
        
        let checkFetchRequest = NSFetchRequest(entityName: "Semester")
        
        do {
            
            let results = try coreDataStack.managedObjectContext.executeFetchRequest(checkFetchRequest) as! [Semester]
            
            for result in results {
                if let typeOfSemester = result.valueForKey("type") as? String, yearOfSemester = result.valueForKey("startDate") as? String {
                    let yearIndex = yearOfSemester.endIndex.advancedBy(-4)
                    let yearOfSemester = yearOfSemester.substringFromIndex(yearIndex)
                    if typeOfSemester == chosenSemester && yearOfSemester == year  {
                        return true
                    } 
                }
            }
            
        } catch {
            fatalError("Could not execute request")
        }
        return false
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

extension SemesterDetailTableViewController: CampusDelegate {
    
    func didSelectCampus(campus: String) {
        self.campus = campus
    }
    
}

