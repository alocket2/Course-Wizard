//
//  AssignmentTypeTableViewController.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 4/18/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit

protocol AssignmentTypeDelegate: class {
    func userDidSelectAssignment(type: String)
}

class AssignmentTypeTableViewController: UITableViewController {
    
    let types: [String] = ["Homework", "Project", "Reading", "Participation", "Exam", "Test", "Quiz", "Midterm", "Final", "Attendance", "Essay", "Report", "iClicker", "Lab"]
    
    let cellIdentifier = "typeCell"
    weak var delegate: AssignmentTypeDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Types"
        tableView.backgroundColor = UIColor.tableviewCellBackgroundColor()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return types.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50.0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        
        cell?.textLabel?.text = types[indexPath.row]
        cell?.backgroundColor = UIColor.tableviewCellBackgroundColor()
        cell?.textLabel?.textColor = UIColor.darkGrayColor()
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        delegate.userDidSelectAssignment(types[indexPath.row])
        navigationController?.popViewControllerAnimated(true)
    }
    
}
