//
//  FlightPlanTableViewController.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 3/21/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit
import CoreData

class FlightPlanTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    var coreDataStack = CoreDataStack()
    var completedCourses = [String]()
    
    var degree = ""
    
    override func viewDidLoad() {
        
        
    
        getDegreeFromCoreData()
        
        getCompletedCoursesFromCoreData()
        
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
    
    func getCompletedCoursesFromCoreData() {
        let courseRequest = NSFetchRequest(entityName: "CompletedCourses")
        
        do {
            
            let results = try coreDataStack.managedObjectContext.executeFetchRequest(courseRequest)
            
            for result in results {
                if let courseResults = result.valueForKey("courses") as? [String] {
                    completedCourses = courseResults
                }
            }
            
        } catch let error as NSError {
            print("Could not fetch courses: \(error.localizedDescription)")
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return cwFlightPlan.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let cwStanding = cwFlightPlan[section]
        return cwStanding.standing
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.contentView.backgroundColor = UIColor.whiteColor()
        header.textLabel?.textColor = UIColor.darkGrayColor()
        
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
        
        cell.backgroundColor = UIColor.incompletedCourseCellBackgroundColor()
        
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
        
        if !completedCourses.isEmpty {
            for completedClass in completedCourses {
                if course == completedClass {
                    cell.backgroundColor = UIColor.compeltedCourseCellBackgroundColor()
                    cell.courseName.textColor = UIColor.completedCourseDetailTextColor()
                    cell.courseCode.textColor = UIColor.completedCourseDetailTextColor()
                    cell.courseCredits.textColor = UIColor.completedCourseDetailTextColor()
                    cell.coursePreRegs.textColor = UIColor.completedCourseDetailTextColor()
                    cell.completionImage.hidden = false
                    break
                } else {
                    cell.backgroundColor = UIColor.incompletedCourseCellBackgroundColor()
                    cell.courseName.textColor = UIColor.darkGrayColor()
                    cell.courseCode.textColor = UIColor.darkGrayColor()
                    cell.courseCredits.textColor = UIColor.darkGrayColor()
                    cell.coursePreRegs.textColor = UIColor.darkGrayColor()
                    cell.completionImage.hidden = true
                }
            }
       }
        
        cell.courseName.text = course
        cell.courseCredits.text = "Credits: \(credits)"
        cell.courseCode.text = code
        cell.coursePreRegs.text = "Pre Reqs: \(courseReq)"
        cell.completionImage.image = UIImage(named: "check")?.imageWithColor(UIColor.completedCourseIconColor())
        
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
    
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! FlightPlanTableViewCell
        let cellCourse = cell.courseName.text
        
        let completeAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "\u{2713}\n Complete" , handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            // 2
            let flightPlanCourse = self.cwFlightPlan[indexPath.section]
            self.completedCourses.append(flightPlanCourse.courses[indexPath.row].name)
            
            self.saveCompletedCourses()
            
            self.tableView.reloadData()
        })
        
        for course in completedCourses {
            if course == cellCourse {
                let incompleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "\u{00D7}\n Retake" , handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
                
                    let index = self.completedCourses.indexOf(course)
                    self.completedCourses.removeAtIndex(index!)
                    
                    self.saveCompletedCourses()
                    self.setCompleteActionAttributes(cell, indexPath: indexPath)
                    self.tableView.reloadData()
                })
                
                incompleteAction.backgroundColor = UIColor.redColor()
                
                return [incompleteAction]
            }
        }
        
        
        
        completeAction.backgroundColor = UIColor.actionBackgroundColor()
        
        return [completeAction]
    }
    
    func setCompleteActionAttributes(cell: FlightPlanTableViewCell, indexPath: NSIndexPath) {
        cell.courseName.textColor = UIColor.darkGrayColor()
        cell.courseCode.textColor = UIColor.darkGrayColor()
        cell.courseCredits.textColor = UIColor.darkGrayColor()
        cell.coursePreRegs.textColor = UIColor.darkGrayColor()
        cell.completionImage.hidden = true
    }
    
    func saveCompletedCourses() {
        
        guard let entity = NSEntityDescription.entityForName("CompletedCourses", inManagedObjectContext: coreDataStack.managedObjectContext) else {
            fatalError("Could not find entity descriptions!")
        }
        
        let courseEntity = CompletedCourses(entity: entity, insertIntoManagedObjectContext: coreDataStack.managedObjectContext)
        
        courseEntity.courses = completedCourses
        
        do {
          try coreDataStack.managedObjectContext.save()
        } catch let error as NSError {
            print("Could not save: \(error.localizedDescription)")
        }
        
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
