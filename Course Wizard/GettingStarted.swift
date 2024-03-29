//
//  GettingStarted.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 3/31/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit

class GettingStarted: UITableViewController {
    
    var kUserHasOnboardedKey = "user_has_onboarded"
    
    @IBOutlet weak var gpaTextField: UITextField!
    @IBOutlet weak var campus: UILabel!
    @IBOutlet weak var degree: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Get Started"
        view.backgroundColor = UIColor.tableviewCellBackgroundColor()
        UIApplication.sharedApplication().statusBarStyle = .Default
        gpaTextField.attributedPlaceholder = NSAttributedString(string:"Previous GPA:",
                                                               attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    func setupNormalRootViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("Overview")
        self.presentViewController(vc, animated: true, completion: nil)
    }

    @IBAction func saveSettings(sender: UIBarButtonItem) {
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: kUserHasOnboardedKey)
        setupNormalRootViewController()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showCampuses" {
            let controller = segue.destinationViewController as! CampusTableViewController
            controller.delegate = self
        } else if segue.identifier == "showDegrees" {
            let controller = segue.destinationViewController as! DegreeTableViewController
            controller.delegate = self
        }
    }
}

extension GettingStarted: CampusDelegate {
    func didSelectCampus(campus: String) {
        self.campus.text = "Campus: \(campus)"
    }
}

extension GettingStarted: DegreeProtocol {
    func userHasSelectedDegree(degree: String) {
        self.degree.text = degree
    }
}


