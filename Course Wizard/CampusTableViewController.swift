//
//  CampusTableViewController.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 3/3/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit

/*
    
    Lets talk about protocols. We use protocols to pass data back from another controller.
    See structure of a protocol below.
    the class means that only classes can implement the protocol.

*/

protocol CampusDelegate: class {
    func userDidCancelSelectingCampus(controller: CampusTableViewController)
    func campusDelegate(userDidSelectCampus campus: String)
}

class CampusTableViewController: UITableViewController {
    
    //We need a connection to that protocol
    
    weak var delegate: CampusDelegate?

    let campus = ["Boca Raton", "Dania Beach (Sea Tech)", "Davie", "Fort Lauderdale", "Harbor Branch", "Jupiter"]
    let cellIdentifier = "campusCell"
    
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return campus.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        
        cell.textLabel?.text = campus[indexPath.row]
        
        return cell
    }
    
    //Here we use that delegate we made earlier to access the protocol methods.
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        delegate?.campusDelegate(userDidSelectCampus: campus[indexPath.row])
        navigationController?.popViewControllerAnimated(true)
    }
    
    
    @IBAction func cancelCampusSelection(sender: UIBarButtonItem) {
        delegate?.userDidCancelSelectingCampus(self)
    }
    
}