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
    
    
    lazy var fauDegrees: [FauDegrees] = {
        return FauDegrees.fauDegrees()
    }()
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return fauDegrees.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let fauDegree = fauDegrees[section]
        return fauDegree.type
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let fauDegree = fauDegrees[section]
        return fauDegree.degrees.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "degreeCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! DegreeTableViewCell
        
        let fauDegree = fauDegrees[indexPath.section]
        let degree = fauDegree.degrees[indexPath.row]
        
        cell.configureCellWith(degree)
        
        return cell
    }

}


