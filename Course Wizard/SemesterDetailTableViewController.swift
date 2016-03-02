//
//  SemesterDetailTableViewController.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 2/28/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit

protocol SemesterDelegate: class {
    func SemesterDetailDidCancel(controller:  SemesterDetailTableViewController)
}

class SemesterDetailTableViewController: UITableViewController {
    
    @IBOutlet weak var semesterType: UILabel!
    
    var chosenSemester: String?
    
    weak var delegate: SemesterDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add Semester"
        
        semesterType.text = "Semester"
        
    }
    
    override func viewWillAppear(animated: Bool) {
        if semesterType.text == nil {
            semesterType.text = "Semester"
        } else {
            guard chosenSemester != nil else {
                print("No data")
                return
            }
            
            semesterType.text = "Semester: \(chosenSemester!)"
        }
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        
        delegate?.SemesterDetailDidCancel(self)
        
    }
    
    @IBAction func saveSemester(sender: UIBarButtonItem) {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "chooseSemesterSegue" {
            let controller = segue.destinationViewController as! SemesterTypeTableViewController
            controller.delegate = self
        }
    }
    
}


extension SemesterDetailTableViewController: SemesterTypeDelegate {

    func semesterType(didFinishSelectingType semesterType: String) {
        chosenSemester = semesterType
    }
    
}

