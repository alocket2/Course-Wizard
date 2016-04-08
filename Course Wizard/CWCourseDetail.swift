//
//  CWCourseDetail.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 4/4/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit

class CWCourseDetail: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var courseTitle: UILabel!
    @IBOutlet weak var courseCode: UILabel!
    @IBOutlet weak var courseCredits: UILabel!
    @IBOutlet weak var courseCoreqs: UILabel!
    @IBOutlet weak var coursePrereqs: UILabel!
    @IBOutlet weak var courseDesc: UILabel!
    
    //Variables
    var coursetitle: String?
    var code: String?
    var credits: String?
    var desc: String?
    
    var coReqs = [String]()
    var preReqs = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController!.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        navigationController!.navigationBar.shadowImage = UIImage()
        navigationController!.navigationBar.translucent = true
        
        courseTitle.text = coursetitle
        courseCode.text = code
        courseCredits.text = "\(credits!) credits"
        courseDesc.text = desc
        backgroundView.backgroundColor = UIColor.completedCourseIconColor()
    }
    
    override func viewWillDisappear(animated: Bool) {
        navigationController!.navigationBar.setBackgroundImage(nil, forBarMetrics: .Default)
        navigationController?.navigationBar.shadowImage = nil
        navigationController?.navigationBar.translucent = false
    }
    
}
