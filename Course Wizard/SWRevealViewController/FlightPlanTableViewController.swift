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
    var flightPlan = [CWFlightPlan]?()
    var degree = ""
    
    var courseTitle: String = ""
    var courseCode: String = ""
    var courseCreds: String = ""
    var courseDesc: String = ""
    var courseCoReqs: [String] = []
    var coursePreReqs: [String] = []
    
    override func viewDidLoad() {
        
        getDegreeFromCoreData()
        
        flightPlan = CWFlightPlan.getCoursesFor(degree: degree)!
        
        if flightPlan?.count == 0 {
            tableView.reloadData()
            
        }
        
        getCompletedCoursesFromCoreData()
        tableView.reloadData()
        
        self.navigationItem.title = "Flight Plan"
        
        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
        tableView.tableFooterView = UIView()
    }

    func flightPlan(cwFlightPlan: [CWFlightPlan]) -> [CWFlightPlan]  {
        return self.flightPlan!
    }
    
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
        return (flightPlan!.count)
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let cwStanding = flightPlan![section]
        return cwStanding.standing
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.contentView.backgroundColor = UIColor.whiteColor()
        header.textLabel?.textColor = UIColor.darkGrayColor()
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let studentFlightPlan = flightPlan![section]
        
        return studentFlightPlan.courses.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70.0
    }
   
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "flightPlanCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! FlightPlanTableViewCell
        
        cell.backgroundColor = UIColor.tableviewCellBackgroundColor()
        
        let studentFlightPlan = flightPlan![indexPath.section]
        let course = studentFlightPlan.courses[indexPath.row].getName()
        let code = studentFlightPlan.courses[indexPath.row].getCode()
        let credits = studentFlightPlan.courses[indexPath.row].getCredits()
        let preReqs = studentFlightPlan.courses[indexPath.row].getPrereqs()
        var courseReq = ""
        
        var count = 0
        
        courseTitle = studentFlightPlan.courses[indexPath.row].getName()
        courseCode = studentFlightPlan.courses[indexPath.row].getCode()
        courseCreds = "\(studentFlightPlan.courses[indexPath.row].getCredits())"
        courseCoReqs = studentFlightPlan.courses[indexPath.row].getCoreqs()
        coursePreReqs = studentFlightPlan.courses[indexPath.row].getPrereqs()
        courseDesc = studentFlightPlan.courses[indexPath.row].getDescription()
        
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
                    cell.completionImage.hidden = false
                    break
                } else {
                    cell.backgroundColor = UIColor.tableviewCellBackgroundColor()
                    cell.courseName.textColor = UIColor.darkGrayColor()
                    cell.courseCode.textColor = UIColor.darkGrayColor()
                    cell.courseCredits.textColor = UIColor.darkGrayColor()
                    cell.completionImage.hidden = true
                }
            }
       }
        
        cell.courseName.text = course
        cell.courseCredits.text = "Credits: \(credits)"
        cell.courseCode.text = code
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
            let flightPlanCourse = self.flightPlan![indexPath.section]
            self.completedCourses.append(flightPlanCourse.courses[indexPath.row].getName())
            
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
                
                incompleteAction.backgroundColor = UIColor.retakeCourseCellActionColor()
                
                return [incompleteAction]
            }
        }
        
        
        
        completeAction.backgroundColor = UIColor.actionBackgroundColor()
        
        return [completeAction]
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "courseDetailSegue" {
            let controller = segue.destinationViewController as! CWCourseDetail
            
            let indexPath = tableView.indexPathForSelectedRow
            let cell = flightPlan![(indexPath?.section)!]
            
            controller.coursetitle = cell.courses[(indexPath?.row)!].getName()
            controller.credits = "\(cell.courses[(indexPath?.row)!].getCredits())"
            controller.code = cell.courses[(indexPath?.row)!].getCode()
            controller.coReqs = cell.courses[(indexPath?.row)!].getCoreqs()
            controller.preReqs = cell.courses[(indexPath?.row)!].getPrereqs()
            controller.desc = cell.courses[(indexPath?.row)!].getDescription()
            
            navigationController!.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
            navigationController!.navigationBar.shadowImage = UIImage()
            navigationController!.navigationBar.translucent = true
        }
    }
    
    func setCompleteActionAttributes(cell: FlightPlanTableViewCell, indexPath: NSIndexPath) {
        cell.courseName.textColor = UIColor.darkGrayColor()
        cell.courseCode.textColor = UIColor.darkGrayColor()
        cell.courseCredits.textColor = UIColor.darkGrayColor()
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
        return UIFont.taglineFontWith(body: "The degree you chose does not yet have a flight plan")
    }
    
    func imageForEmptyDataSet(scrollView: UIScrollView!) -> UIImage! {
        return UIImage(named: "flight")
    }
    
    func imageTintColorForEmptyDataSet(scrollView: UIScrollView!) -> UIColor! {
        return UIColor.imageTintColor()
    }
    
    func verticalOffsetForEmptyDataSet(scrollView: UIScrollView!) -> CGFloat {
        return -50.0
    }
    
    
    
}

extension FlightPlanTableViewController: DegreeProtocol  {
    func userHasSelectedDegree(degree: String) {
        self.degree = degree
    }
}
