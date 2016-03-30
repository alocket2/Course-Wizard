//
//  FlightPlanTableViewController.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 3/21/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit
import CoreData

class FlightPlanTableViewController: UITableViewController {

    var coreDataStack = CoreDataStack()
    var courses = [String]()
    var degree = ""
    
    var completedCourses = [Bool]()
    
    
    
    override func viewDidLoad() {
        
        getDegreeFromCoreData()
        
        tableView.reloadData()
        
        self.navigationItem.title = "Flight Plan"
        
        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
        tableView.tableFooterView = UIView()
    }
    
    lazy var cwFlightPlan: [CWFlightPlan] = {
        return CWFlightPlan.getCoursesFor(degree: self.degree)
    }()
    
    func getDegreeFromCoreData() {
        let degreeRequest = NSFetchRequest(entityName: "Degree")
        
        do {
            let results = try coreDataStack.managedObjectContext.executeFetchRequest(degreeRequest)
            
            for result in results {
                if let degreeResult = result.valueForKey("name") as? String {
                    self.degree = degreeResult
                }
            }
            
        } catch let error as NSError {
            print("Error fetching: \(error.localizedDescription)")
        }
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return cwFlightPlan.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let cwStanding = cwFlightPlan[section]
        return cwStanding.standing
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let flightPlan = cwFlightPlan[section]
        
        return flightPlan.courses.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70.0
    }
   
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "flightPlanCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! FlightPlanTableViewCell
        
        let flightPlan = cwFlightPlan[indexPath.section]
        let course = flightPlan.courses[indexPath.row].name
        let code = flightPlan.courses[indexPath.row].code
        let credits = flightPlan.courses[indexPath.row].credits
        let preReqs = flightPlan.courses[indexPath.row].preRegs
        var courseReq = ""
        
        
        
        var count = 0
        
        for req in preReqs {
            courseReq += req
            count += 1
            if count < preReqs.count {
                courseReq += ", "
            }
        }
        
        cell.courseName.text = course
        cell.courseCredits.text = "Credits: \(credits)"
        cell.courseCode.text = code
        cell.coursePreRegs.text = "Pre Reqs: \(courseReq)"
        
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
    
        let completeAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "\u{2713}\n Complete" , handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            // 2
            let flightPlanCourse = self.cwFlightPlan[indexPath.section]
            flightPlanCourse.courses[indexPath.row].completed = true
            
            self.tableView.reloadData()
        })
        
        completeAction.backgroundColor = UIColor.actionBackgroundColor()
        
        return [completeAction]
    }

}

extension FlightPlanTableViewController: DZNEmptyDataSetDelegate, DZNEmptyDataSetSource {
    
    func titleForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        return UIFont.headlineFontWith(headline: "Flight Plan")
    }
    
    func descriptionForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        return UIFont.taglineFontWith(body: "Choose a degree in the settings to view its flight plan")
    }
    
    func imageForEmptyDataSet(scrollView: UIScrollView!) -> UIImage! {
        return UIImage(named: "flight")
    }
    
    func imageTintColorForEmptyDataSet(scrollView: UIScrollView!) -> UIColor! {
        return UIColor.imageTintColor()
    }
    
}

extension FlightPlanTableViewController: DegreeProtocol  {
    func userHasSelectedDegree(degree: String) {
        self.degree = degree
    }
}
