//
//  CWCalendar.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 4/11/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit
import CVCalendar

class CWCalendar: UIViewController {

    @IBOutlet weak var calendarMenu: CVCalendarMenuView!
    @IBOutlet weak var calendar: CVCalendarView!
    @IBOutlet weak var assignmentsTableView: UITableView!
    @IBOutlet weak var monthButton: UIBarButtonItem!
    @IBOutlet weak var weekButton: UIBarButtonItem!
    
    var animationFinished = true
    var selectedDate: String!
    
    //To test out
    var assignments: [String] = ["Study for the final exam", "Homework #3", "Study for Operating Systems", "Finish Course Wizard"]
    var courseAssignments: [String] = ["Discrete Mathematics", "Introduction to Database Structures", "Computer Operating Systems", "Principals of Software Engineering"]
    
    override func viewDidLoad() {

        navigationItem.title = CVDate(date: NSDate()).globalDescription
        
        monthButton.enabled = false
        
        assignmentsTableView.backgroundColor = UIColor.tableviewCellBackgroundColor()
        
        
        assignmentsTableView.emptyDataSetSource = self
        assignmentsTableView.emptyDataSetDelegate = self
        assignmentsTableView.tableFooterView = UIView()
        
        assignmentsTableView.delegate = self
        assignmentsTableView.dataSource = self
        
        if assignments.count == 0 {
            assignmentsTableView.reloadData()
            assignmentsTableView.backgroundColor = UIColor.whiteColor()
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        calendar.commitCalendarViewUpdate()
        calendarMenu.commitMenuViewUpdate()
    }
    
    func didSelectDayView(dayView: DayView, animationDidFinish: Bool) {
        selectedDate = dayView.date.commonDescription
        print(selectedDate)
    }
    
    
    
    @IBAction func changeCalendarView(sender: UIBarButtonItem) {
        if sender.title == "Week" {
            calendar.changeMode(.WeekView)
            weekButton.enabled = false
            monthButton.enabled = true
        } else if sender.title == "Month" {
            calendar.changeMode(.MonthView)
            sender.enabled = false
            monthButton.enabled = false
            weekButton.enabled = true
        }
    }
}

extension CWCalendar: CVCalendarMenuViewDelegate, CVCalendarViewDelegate {
    func presentationMode() -> CalendarMode {
        return .MonthView
    }
    
    func firstWeekday() -> Weekday {
        return .Sunday
    }
    
    func shouldShowWeekdaysOut() -> Bool {
        return true
    }
    
    func presentedDateUpdated(date: Date) {
        if self.animationFinished {
            self.navigationItem.title = date.globalDescription
        }
    }
}

extension CWCalendar: CVCalendarViewAppearanceDelegate {
    func dotMarkerColor() -> UIColor {
        return UIColor.actionBackgroundColor()
    }
    
    func dayOfWeekTextColor() -> UIColor {
        return UIColor.darkGrayColor()
    }
    
    func dayLabelWeekdaySelectedBackgroundColor() -> UIColor {
        return UIColor.actionBackgroundColor()
    }
    
    func dayLabelPresentWeekdaySelectedBackgroundColor() -> UIColor {
        return UIColor.actionBackgroundColor()
    }
    
    func dayLabelPresentWeekdayTextColor() -> UIColor {
        return UIColor.actionBackgroundColor()
    }
}

extension CWCalendar: DZNEmptyDataSetDelegate, DZNEmptyDataSetSource {
    func titleForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        return UIFont.headlineFontWith(headline: "Assignments")
    }
    
    func descriptionForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        return UIFont.taglineFontWith(body: "Sit back and relax, no schoolwork today!")
    }
    
    func imageForEmptyDataSet(scrollView: UIScrollView!) -> UIImage! {
        return UIImage(named: "file")
    }
    
    func imageTintColorForEmptyDataSet(scrollView: UIScrollView!) -> UIColor! {
        return UIColor.imageTintColor()
    }
    
    func emptyDataSetShouldFadeIn(scrollView: UIScrollView!) -> Bool {
        return true
    }
}

extension CWCalendar: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if assignments.count == 0 {
            return ""
        }
        
        return "Assignments"
    }
    
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.contentView.backgroundColor = UIColor.whiteColor()
        header.textLabel?.textColor = UIColor.darkGrayColor()
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return assignments.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "assignmentsCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        cell?.textLabel?.text = assignments[indexPath.row]
        cell?.detailTextLabel?.text = courseAssignments[indexPath.row]
        
        cell?.backgroundColor = UIColor.tableviewCellBackgroundColor()
        cell?.textLabel?.textColor = UIColor.darkGrayColor()
        
        assignmentsTableView.separatorColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 0.15)
        
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let completeAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "\u{2713}\n Complete" , handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            self.assignments.removeAtIndex(indexPath.row)
            self.courseAssignments.removeAtIndex(indexPath.row)
            self.assignmentsTableView.reloadData()
        })
        
        completeAction.backgroundColor = UIColor.actionBackgroundColor()
        
        return [completeAction]
    }
    
}
