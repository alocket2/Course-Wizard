//
//  CampusTableViewController.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 3/18/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit

protocol CampusDelegate: class {
    func didSelectCampus(campus: String)
}

class CampusTableViewController: UITableViewController {
    
    let campuses = ["Boca Raton", "Dania Beach (Sea Tech)", "Davie", "Fort Lauderdale", "Harbor Branch", "Jupiter"]
    let cellIdentifier = "campusCell"
    
    weak var delegate: CampusDelegate?
    
    override func viewDidLoad() {
        title = "Campuses"
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return campuses.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        
        cell.textLabel?.text = campuses[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        delegate?.didSelectCampus(campuses[indexPath.row])
        navigationController?.popViewControllerAnimated(true)
    }
    

}
