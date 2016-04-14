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

class CourseDetailTableViewController: UITableViewController{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var daysLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timePicker: UIDatePicker!
    
    var delegate: CourseDetailDelegate!
    var coreDataStack = CoreDataStack()
    var course: CWCourse?
    var days = [Bool](count: 7, repeatedValue: false)
    var timeVal = NSDate()
    let timeFormatter = NSDateFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add a Course"
        
        timeFormatter.timeStyle = .ShortStyle
        timePicker.datePickerMode = .Time
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "courseSearchSegue" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! CourseSearchTableViewController
            controller.delegate = self
        }
        else if segue.identifier == "chooseDaysSegue" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! CourseDaysTableViewController
            controller.days = self.days
            controller.delegate = self
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let row = indexPath.row
        let section = indexPath.section
        switch section {
        case 0:
            timePicker.hidden = true
            break
        case 1:
            switch row {
            case 0:
                timePicker.hidden = true
            case 1:
                timePicker.hidden = true
            case 2:
                if timePicker.hidden == true {
                    timePicker.hidden = false
                } else {
                    timePicker.hidden = true
                }
            case 3:
                timePicker.hidden = true
            default:
                break
            }
        default:
            break
        }
    }
  
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        timeVal = timePicker.date
        timeLabel.text! = timeFormatter.stringFromDate(timePicker.date)
        tableView.reloadData()
    }

    func checkDaysChosen(daysChosen: [Bool]) {
        var didChooseDay = false
        var daysLabel = ""
        var days = [String]()
        for index in 0...6 {
            if daysChosen[index] == true {
                didChooseDay = true
                switch index {
                case 0: days.append("Monday")
                case 1: days.append("Tuesday")
                case 2: days.append("Wednesday")
                case 3: days.append("Thursday")
                case 4: days.append("Friday")
                case 5: days.append("Saturday")
                case 6: days.append("Sunday")
                default: break
                }
            }
        }
        if didChooseDay == true {
            for day in days {
                daysLabel += day + "  "
            }
            self.daysLabel.text! = daysLabel
        } else {
            self.daysLabel.text! = "Days"
        }
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        delegate?.CourseDetailDidCancel(self)
    }
}

extension CourseDetailTableViewController: CourseDaysDelegate {
    func CourseDaysDidCancel(controller: CourseDaysTableViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func CourseDaysDidFinish(days: [Bool]) {
        self.days = days
        checkDaysChosen(days)
        tableView.reloadData()
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