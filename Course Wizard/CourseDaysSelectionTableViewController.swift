//
//  CourseDaysSelectionViewController.swift
//  Course Wizard
//
//  Created by Daniel Marquez on 4/15/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit
import CoreData

protocol CourseDaysSelectionDelegate: class {
    func CourseDaysSelectionDidCancel(controller: CourseDaysSelectionTableViewController)
    func CourseDaysSelectionDidFinish(daysChosen: [Bool])
}

class CourseDaysSelectionTableViewController: UITableViewController {
    
    var delegate: CourseDaysSelectionDelegate!
    var daysChosen = [Bool](count:6, repeatedValue:false)
    @IBOutlet weak var monCell: UITableViewCell!
    @IBOutlet weak var tueCell: UITableViewCell!
    @IBOutlet weak var wedCell: UITableViewCell!
    @IBOutlet weak var thuCell: UITableViewCell!
    @IBOutlet weak var friCell: UITableViewCell!
    @IBOutlet weak var satCell: UITableViewCell!
    @IBOutlet weak var sunCell: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for index in 0...6 {
            if daysChosen[index] == true {
                switch index {
                case 0: monCell.accessoryType = UITableViewCellAccessoryType.Checkmark
                case 1: tueCell.accessoryType = UITableViewCellAccessoryType.Checkmark
                case 2: wedCell.accessoryType = UITableViewCellAccessoryType.Checkmark
                case 3: thuCell.accessoryType = UITableViewCellAccessoryType.Checkmark
                case 4: friCell.accessoryType = UITableViewCellAccessoryType.Checkmark
                case 5: satCell.accessoryType = UITableViewCellAccessoryType.Checkmark
                case 6: sunCell.accessoryType = UITableViewCellAccessoryType.Checkmark
                default: break
                }
            }
        }
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.selectionStyle = UITableViewCellSelectionStyle.None
        return indexPath
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        if cell?.accessoryType != UITableViewCellAccessoryType.Checkmark{
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
            daysChosen[indexPath.row] = true
        } else {
            cell?.accessoryType = UITableViewCellAccessoryType.None
            daysChosen[indexPath.row] = false
        }
    }
    @IBAction func cancel(sender: AnyObject) {
        delegate?.CourseDaysSelectionDidCancel(self)
    }
    
    @IBAction func done(sender: AnyObject) {
        delegate?.CourseDaysSelectionDidFinish(daysChosen)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
