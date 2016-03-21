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
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return FauDegrees.degreeTypes.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return FauDegrees.degreeTypes.types[section]
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FauDegrees.getFAUDegree().count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "degreeCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        
        cell.textLabel?.text = "Demo"
        
        return cell
    }

}


