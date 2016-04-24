//
//  AddAssignmentDate.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 4/20/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit

protocol AddAssignmentDateDelegate: class {
    func userDidCancel(controller: AddAssignmentDate)
    func userDidSelect(date date: String)
}

class AddAssignmentDate: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    weak var delegate: AddAssignmentDateDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Due Date"
        
        datePicker.datePickerMode = .DateAndTime
    }
    
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        delegate?.userDidCancel(self)
    }
    
    @IBAction func save(sender: UIBarButtonItem) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy 'at' h:mm a"
        dateFormatter.AMSymbol = "AM"
        dateFormatter.PMSymbol = "PM"
        let stringDate = dateFormatter.stringFromDate(datePicker.date)
        delegate?.userDidSelect(date: stringDate)
        navigationController?.popViewControllerAnimated(true)
    }
    

}
