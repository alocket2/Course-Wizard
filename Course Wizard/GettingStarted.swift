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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Setup"
        view.backgroundColor = UIColor.walkthroughBackgroundColor()
        UIApplication.sharedApplication().statusBarStyle = .Default
        tableView.separatorColor = UIColor.clearColor()
        gpaTextField.attributedPlaceholder = NSAttributedString(string:"Previous GPA:",
                                                               attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
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
}

