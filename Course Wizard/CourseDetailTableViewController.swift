//
//  CourseDetailTableViewController.swift
//  Course Wizard
//
//  Created by Daniel Marquez on 4/14/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit
import CoreData

protocol CourseDetailDelegate: class {
    func CourseDetailDidCancel(controller: CourseDetailTableViewController)
}

class CourseDetailTableViewController: UITableViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var daysLabel: UILabel!
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var endLabel: UILabel!
    @IBOutlet weak var professor: UITextField!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var semesterLabel: UILabel!
    
    
    var delegate: CourseDetailDelegate!
    var coreDataStack = CoreDataStack()
    var course: CWCourse?
    var courseCode: String?
    var locationName: String?
    var startTime: NSDate?
    var startTimeChosen = false
    var endTime: NSDate?
    var endTimeChosen = false
    var daysChosen = [Bool](count:7, repeatedValue: false)
    
    var semesterType: String?
    var semesterYear: String?
    var semester: Semester?
    
    var days = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add a Course"
        
        timePicker.addTarget(self, action: #selector(CourseDetailTableViewController.datePickerDidChange(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        if semester == nil && semesterType == nil && semesterYear == nil {
            semesterLabel.text = "Semester"
        } else if semester != nil && semesterType == nil && semesterYear == nil {
            semesterLabel.text = "\(semester!.type!)" + " " + "\(semester!.year!)"
        } else if semester == nil && semesterType != nil && semesterYear != nil {
            semesterLabel.text = semesterType! + " " + semesterYear!
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if locationName == nil {
            locationLabel.text = "Location"
        } else {
            locationLabel.text = "\(locationName!)"
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "courseSearchSegue" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! CourseSearchTableViewController
            controller.delegate = self
        }
        if segue.identifier == "chooseDaysSegue" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! CourseDaysSelectionTableViewController
            controller.daysChosen = daysChosen
            controller.delegate = self
        }
        if segue.identifier == "choseBuildingSegue" {
            let controller = segue.destinationViewController as! CWBuildingsTableView
            controller.delegate = self
        }
    }
    
    func datePickerDidChange(timePicker: UIDatePicker) {
        let timeValue = timePicker.date
        let timeFormatter = NSDateFormatter()
        timeFormatter.timeStyle = .ShortStyle
        let time = timeFormatter.stringFromDate(timePicker.date)
        
        if startTimeChosen == true {
            startTime = (timeValue)
            startLabel.text! = time
        } else {
            endTime = timeValue
            endLabel.text! = time
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let row = indexPath.row
        let section = indexPath.section
        switch section {
        case 0:
            professor.editing
            timePicker.hidden = true
            startTimeChosen = false
            endTimeChosen = false
        case 1:
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
            switch row {
            case 0:
                timePicker.hidden = true
                startTimeChosen = false
                endTimeChosen = false
            case 1:
                timePicker.hidden = true
                startTimeChosen = false
                endTimeChosen = false
            case 2:
                timePicker.hidden = true
                startTimeChosen = false
                endTimeChosen = false
            default:
                break
            }
        case 2:
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
            switch row {
                case 0:
                    timePicker.hidden = false
                if startTimeChosen == false && timePicker.hidden == true  {
                    startTimeChosen = true
                    if startTime != nil {
                        timePicker.setDate(startTime!, animated: false)
                    } else {
                        timePicker.setDate(NSDate(), animated: false)
                    }
                    timePicker.hidden = false
                } else if startTimeChosen == false && timePicker.hidden == false {
                    endTimeChosen = false
                    startTimeChosen = true
                    if startTime != nil {
                        timePicker.setDate(startTime!, animated: false)
                    } else {
                        timePicker.setDate(NSDate(), animated: false)
                    }
                }
                case 1:
                    if endTimeChosen == false && timePicker.hidden == true {
                    endTimeChosen = true
                    if endTime != nil {
                        timePicker.setDate(endTime!, animated: false)
                    } else {
                        timePicker.setDate(NSDate(), animated: false)
                    }
                    timePicker.hidden = false
                } else if endTimeChosen == false && timePicker.hidden == false {
                    startTimeChosen = false
                    endTimeChosen = true
                    if endTime != nil {
                        timePicker.setDate(endTime!, animated: false)
                    } else {
                        timePicker.setDate(NSDate(), animated: false)
                    }
                }
            default:
                break
            }
        default:
            break
        }
    }
    
    func checkDaysChosen() {
        var daysLabel = ""
        var didChoose = false
        for index in 0...6 {
            if daysChosen[index] == true {
                didChoose = true
                switch index {
                case 0: days.append("M")
                case 1: days.append("T")
                case 2: days.append("W")
                case 3: days.append("TR")
                case 4: days.append("F")
                case 5: days.append("S")
                case 6: days.append("SU")
                default: break
                }
            }
        }
        for day in days {
            daysLabel += day + "  "
        }
        if didChoose == true {
            self.daysLabel.text! = "Days: \(daysLabel)"
        } else {
            self.daysLabel.text! = "Days"
        }
    }
    
    func getSemesterFromCoreData() {
        
        let semesterFetchRequest = NSFetchRequest(entityName: "Semester")
        
        do {
            
            let results = try coreDataStack.managedObjectContext.executeFetchRequest(semesterFetchRequest) as! [Semester]
            
            for result in results {
                if result.valueForKey("type") as? String == semesterType && result.valueForKey("year") as? String == semesterYear {
                    semester = result
                } else {
                    continue
                }
            }
            
        } catch let error as NSError {
            print("Could not find the correct semester: \(error)")
        }
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        delegate?.CourseDetailDidCancel(self)
    }
    
    
    @IBAction func save(sender: UIBarButtonItem) {
        
        if semester == nil && semesterType != nil && semesterYear != nil {
            getSemesterFromCoreData()
        }
        
        guard let entity = NSEntityDescription.entityForName("Course", inManagedObjectContext: coreDataStack.managedObjectContext) else {
            fatalError("Could not find entity descriptions!")
        }
        
        let courseEntity = Course(entity: entity, insertIntoManagedObjectContext: coreDataStack.managedObjectContext)
        
        courseEntity.name = nameLabel.text
        courseEntity.crn = courseCode
        courseEntity.location = locationLabel.text
        courseEntity.days = days
        courseEntity.professor = professor.text
        courseEntity.startTime = startLabel.text
        courseEntity.endTime = endLabel.text
        courseEntity.semester = semester
        
        do {
            try coreDataStack.managedObjectContext.save()
            self.dismissViewControllerAnimated(true, completion: nil)
        } catch {
            print("Could not save...")
        }

    }
    
}

extension CourseDetailTableViewController: CourseDaysSelectionDelegate {
    func CourseDaysSelectionDidFinish(daysChosen: [Bool]) {
        self.daysChosen = daysChosen
        checkDaysChosen()
    }
    func CourseDaysSelectionDidCancel(controller: CourseDaysSelectionTableViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}

extension CourseDetailTableViewController: CourseSearchDelegate {
    func CourseSearchDidFinish(controller: CourseSearchTableViewController, course: CWCourse?) {
        self.course = course
        nameLabel.text = course!.getName()
        courseCode = course!.getCode()
        tableView.reloadData()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func CourseSearchDidCancel(controller: CourseSearchTableViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}

extension CourseDetailTableViewController: BuildingProtocol {
    func userDidSelect(building building: String, coordinates: (latitude: Double, longitude: Double)) {
        locationName = building
        navigationController?.popViewControllerAnimated(true)
    }
}
