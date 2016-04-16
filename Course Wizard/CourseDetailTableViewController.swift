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
    
    var delegate: CourseDetailDelegate!
    var coreDataStack = CoreDataStack()
    var course: CWCourse?
    var startTime: NSDate?
    var startTimeChosen = false
    var endTime: NSDate?
    var endTimeChosen = false
    var daysChosen = [Bool](count:7, repeatedValue: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add a Course"
        timePicker.addTarget(self, action: #selector(CourseDetailTableViewController.datePickerDidChange(_:)), forControlEvents: UIControlEvents.ValueChanged)
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
    }
    
    func datePickerDidChange(timePicker: UIDatePicker) {
        let timeValue = timePicker.date
        let timeFormatter = NSDateFormatter()
        timeFormatter.timeStyle = .ShortStyle
        let time = timeFormatter.stringFromDate(timePicker.date)
        
        if startTimeChosen == true {
            startTime = timeValue
            startLabel.text! = time
        } else {
            endTime = timeValue
            endLabel.text! = time
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let row = indexPath.row
        let section = indexPath.section
        switch section {
        case 0:
            timePicker.hidden = true
            startTimeChosen = false
            endTimeChosen = false
            break
        case 1:
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
            case 3:
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
            case 4:
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

    
//
//    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
//        return dayData.count
//    }
//    
//    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return 2
//    }
//    
//    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return dayData[component][row]
//    }
//    
//    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        switch component {
//        case 0:
//            m = dayData[component][row]
//            checkDaysChosen()
//        case 1:
//            t = dayData[component][row]
//            checkDaysChosen()
//        case 2:
//            w = dayData[component][row]
//            checkDaysChosen()
//        case 3:
//            th = dayData[component][row]
//            checkDaysChosen()
//        case 4:
//            f = dayData[component][row]
//            checkDaysChosen()
//        case 5:
//            sa = dayData[component][row]
//            checkDaysChosen()
//        case 6:
//            su = dayData[component][row]
//            checkDaysChosen()
//        default:
//            break
//        }
//    }
    
    func checkDaysChosen() {
        var daysLabel = ""
        var days = [String]()
        var didChoose = false
        for index in 0...6 {
            if daysChosen[index] == true {
                didChoose = true
                switch index {
                case 0: days.append("Mon")
                case 1: days.append("Tue")
                case 2: days.append("Wed")
                case 3: days.append("Thu")
                case 4: days.append("Fri")
                case 5: days.append("Sat")
                case 6: days.append("Sun")
                default: break
                }
            }
        }
        for day in days {
            daysLabel += day + "  "
        }
        if didChoose == true {
            self.daysLabel.text! = daysLabel
        } else {
            self.daysLabel.text! = "Days"
        }
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        delegate?.CourseDetailDidCancel(self)
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
        tableView.reloadData()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func CourseSearchDidCancel(controller: CourseSearchTableViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}