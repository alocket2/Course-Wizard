//
//  SemesterTypeTableViewController.swift
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

import UIKit

protocol SemesterTypeDelegate: class {
    func semesterType(didFinishSelectingType semesterType: String)
}

class SemesterTypeTableViewController: UITableViewController {
    
    weak var delegate: SemesterTypeDelegate?
    
    
    let semesterTypes = ["Spring", "Summer", "Fall"]
    let cellIdentifier = "semesterTypeCell"
    
    override func viewDidLoad() {
        title = "Semester"
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return semesterTypes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        cell.textLabel?.text = semesterTypes[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        delegate?.semesterType(didFinishSelectingType: semesterTypes[indexPath.row])
        navigationController?.popViewControllerAnimated(true)
    }
    
    
    
}
