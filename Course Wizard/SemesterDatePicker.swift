//
//  SemesterDatePickerController.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 2/28/16.
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

protocol SemesterDatePickerDelegate: class {
    func SemesterDatePickerDidCancel(controller: SemesterDatePickerController)
    func SemesterDatePicker(didFinishSelectingStartDate date: String)
    func SemesterDatePicker(didFinishSelectingEndDate date: String)
}

class SemesterDatePickerController: UIViewController {
    
    weak var delegate: SemesterDatePickerDelegate?

    @IBOutlet weak var datePicker: UIDatePicker!
    var typeOfSegue: String = ""
    
    override func viewDidLoad() {
        
        if typeOfSegue == "StartDateSegue" {
            title = "Start Date"
        } else {
            title = "End Date"
        }
        
        datePicker.datePickerMode = .Date
    }

    @IBAction func cancelDateSelection(sender: UIBarButtonItem) {
        delegate?.SemesterDatePickerDidCancel(self)
    }
    
    @IBAction func saveDateSelection(sender: UIBarButtonItem) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .LongStyle
        let date = dateFormatter.stringFromDate(datePicker.date)
        
        if self.typeOfSegue == "StartDateSegue" {
            delegate?.SemesterDatePicker(didFinishSelectingStartDate: date)
        } else {
            delegate?.SemesterDatePicker(didFinishSelectingEndDate: date)
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
