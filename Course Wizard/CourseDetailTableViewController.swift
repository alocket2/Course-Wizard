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

class CourseDetailTableViewController: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var daysLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dayPicker: UIPickerView!
    
    var delegate: CourseDetailDelegate!
    var coreDataStack = CoreDataStack()
    var course: CWCourse?
    var dayData: [[String]] = [[String]]()
    var m = ""
    var t = ""
    var w = ""
    var th = ""
    var f = ""
    var sa = ""
    var su = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add a Course"
        dayData = [["", "M"],["","T"],["","W"],["","Th"],["","F"],["","Sa"],["","Su"]]
        dayPicker.dataSource = self
        dayPicker.delegate = self
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "courseSearchSegue" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! CourseSearchTableViewController
            controller.delegate = self
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let row = indexPath.row
        let section = indexPath.section
        switch section {
        case 0:
            dayPicker.hidden = true
            break
        case 1:
            switch row {
            case 0:
                dayPicker.hidden = true
            case 1:
                if dayPicker.hidden == true {
                    dayPicker.hidden = false
                } else {
                    dayPicker.hidden = true
                }
            case 2:
                dayPicker.hidden = true
            case 3:
                dayPicker.hidden = true
            default:
                break
            }
        default:
            break
        }
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return dayData.count
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dayData[component][row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            m = dayData[component][row]
            checkDaysChosen()
        case 1:
            t = dayData[component][row]
            checkDaysChosen()
        case 2:
            w = dayData[component][row]
            checkDaysChosen()
        case 3:
            th = dayData[component][row]
            checkDaysChosen()
        case 4:
            f = dayData[component][row]
            checkDaysChosen()
        case 5:
            sa = dayData[component][row]
            checkDaysChosen()
        case 6:
            su = dayData[component][row]
            checkDaysChosen()
        default:
            break
        }
    }
    
    func checkDaysChosen() {
        var daysLabel = ""
        var days = [String]()
        if m != "" {days.append("Monday")}
        if t != "" {days.append("Tuesday")}
        if w != "" {days.append("Wednesday")}
        if th != "" {days.append("Thursday")}
        if f != "" {days.append("Friday")}
        if sa != "" {days.append("Saturday")}
        if su != "" {days.append("Sunday")}
        for day in days {
            daysLabel += day + " "
        }
        if daysLabel != "" {
            self.daysLabel.text! = daysLabel
        } else {
            self.daysLabel.text! = "Days"
        }
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        delegate?.CourseDetailDidCancel(self)
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