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
    
    var semesters: [Semester] = []
    
    weak var delegate: SemesterDelegate?
    let semesterCellIdentifier = "chooseSemesterIdentifier"
    

    @IBOutlet weak var semesterTextField: UITextField!
    
    
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        
        delegate?.SemesterDetailDidCancel(self)
        
    }
    
    @IBAction func saveSemester(sender: UIBarButtonItem) {
        
        let fall = Semester(name: semesterTextField.text!)
        semesters.append(fall)
        
        for sem in semesters {
            print(sem.semesterName)
        }
        
    }
   
    
}
