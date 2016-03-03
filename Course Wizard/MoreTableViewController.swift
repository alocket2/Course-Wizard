//
//  MoreTableViewController.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 3/2/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit

class MoreTableViewController: UITableViewController {
    
    var coreDataStack: CoreDataStack!
    
    override func viewDidLoad() {
        title = "More"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showSemestersSegue" {
            let controller = segue.destinationViewController as! SemestersTableViewController
            controller.coreDataStack = coreDataStack
        }
    }

}
