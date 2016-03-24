//
//  DegreeTableViewController.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 3/21/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit

class DegreeTableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        self.navigationItem.title = "Degrees"
    }
    
    
    lazy var cwDegrees: [CWDegrees] = {
        return CWDegrees.cwDegrees()
    }()
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return cwDegrees.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let cwDegree = cwDegrees[section]
        return cwDegree.type
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cwDegree = cwDegrees[section]
        return cwDegree.degrees.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "degreeCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! DegreeTableViewCell
        
        let cwDegree = cwDegrees[indexPath.section]
        let degree = cwDegree.degrees[indexPath.row]
        
        cell.configureCellWith(degree)
        
        return cell
    }

}


