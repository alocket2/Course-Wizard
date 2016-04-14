//
//  CourseDaysTableViewController.swift
//  Course Wizard
//
//  Created by Daniel Marquez on 4/14/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit

protocol CourseDaysDelegate: class {
    func CourseDaysDidCancel(controller: CourseDaysTableViewController)
    func CourseDaysDidFinish(days: [Bool])
}

class CourseDaysTableViewController: UITableViewController {
    var days = [Bool](count: 7, repeatedValue: false)
    var delegate: CourseDaysDelegate!
    
    @IBOutlet weak var mondayCell: UITableViewCell!
    @IBOutlet weak var tuesdayCell: UITableViewCell!
    @IBOutlet weak var wednesdayCell: UITableViewCell!
    @IBOutlet weak var thursdayCell: UITableViewCell!
    @IBOutlet weak var fridayCell: UITableViewCell!
    @IBOutlet weak var satrudayCell: UITableViewCell!
    @IBOutlet weak var sundayCell: UITableViewCell!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Course Days"
        
        for index in 0...6 {
            if days[index] == true{
                switch index {
                case 0: mondayCell.accessoryType = UITableViewCellAccessoryType.Checkmark
                case 1: tuesdayCell.accessoryType = UITableViewCellAccessoryType.Checkmark
                case 2: wednesdayCell.accessoryType = UITableViewCellAccessoryType.Checkmark
                case 3: thursdayCell.accessoryType = UITableViewCellAccessoryType.Checkmark
                case 4: fridayCell.accessoryType = UITableViewCellAccessoryType.Checkmark
                case 5: satrudayCell.accessoryType = UITableViewCellAccessoryType.Checkmark
                case 6: sundayCell.accessoryType = UITableViewCellAccessoryType.Checkmark
                default: break
                }
            } else {
                switch index {
                case 0: mondayCell.accessoryType = UITableViewCellAccessoryType.None
                case 1: tuesdayCell.accessoryType = UITableViewCellAccessoryType.None
                case 2: wednesdayCell.accessoryType = UITableViewCellAccessoryType.None
                case 3: thursdayCell.accessoryType = UITableViewCellAccessoryType.None
                case 4: fridayCell.accessoryType = UITableViewCellAccessoryType.None
                case 5: satrudayCell.accessoryType = UITableViewCellAccessoryType.None
                case 6: sundayCell.accessoryType = UITableViewCellAccessoryType.None
                default: break
                }

            }
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        if cell?.accessoryType != UITableViewCellAccessoryType.Checkmark {
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
            addDay(indexPath.row)
        } else {
            removeDay(indexPath.row)
            cell?.accessoryType = UITableViewCellAccessoryType.None
        }
    }
    
    func addDay(day: Int) {
        switch day {
        case 0:
            days[0] = true
        case 1:
            days[1] = true
        case 2:
            days[2] = true
        case 3:
            days[3] = true
        case 4:
            days[4] = true
        case 5:
            days[5] = true
        case 6:
            days[6] = true
        default:
            break
        }
    }
    
    func removeDay(day: Int) {
        switch day {
        case 0:
            days[0] = false
        case 1:
            days[1] = false
        case 2:
            days[2] = false
        case 3:
            days[3] = false
        case 4:
            days[4] = false
        case 5:
            days[5] = false
        case 6:
            days[6] = false
        default:
            break
        }
    }
    
    @IBAction func done(sender: AnyObject) {
        delegate?.CourseDaysDidFinish(days)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancel(sender: AnyObject) {
        delegate?.CourseDaysDidCancel(self)
    }
}
