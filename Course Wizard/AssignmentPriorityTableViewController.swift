//
//  AssignmentPriorityTableViewController.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 4/18/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit

protocol AssignmentPriorityDelegate: class {
    func userDidSelect(priority priority: String)
}

class AssignmentPriorityTableViewController: UITableViewController {

    let priorities = ["High", "Medium", "Low"]
    let cellIdentifier = "priorityCell"
    
    weak var delegate: AssignmentPriorityDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Priorities"
        tableView.backgroundColor = UIColor.tableviewCellBackgroundColor()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return priorities.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        
        cell?.backgroundColor = UIColor.tableviewCellBackgroundColor()
        cell?.textLabel?.textColor = UIColor.darkGrayColor()
        
        cell?.textLabel?.text = priorities[indexPath.row]
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        delegate?.userDidSelect(priority: priorities[indexPath.row])
        navigationController?.popViewControllerAnimated(true)
    }
}
