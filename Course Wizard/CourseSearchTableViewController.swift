//
//  CourseSearchTableViewController.swift
//  Course Wizard
//
//  Created by Daniel Marquez on 4/14/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit
import CoreData

protocol CourseSearchDelegate: class {
    func CourseSearchDidCancel(controller: CourseSearchTableViewController)
    func CourseSearchDidFinish(controller: CourseSearchTableViewController, course: CWCourse?)
}

class CourseSearchTableViewController: UITableViewController {
    
    var courseCatalog = CWCourseCatalog()
    weak var delegate: CourseSearchDelegate!
    var courses = [CWCourse]()
    var courseTitles = [String]()
    var filteredCourses = [CWCourse]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search for a Course"
        courses = courseCatalog.getAllCourses()
        courseTitles = courseCatalog.getAllTitles()
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        definesPresentationContext = true
        searchController.dimsBackgroundDuringPresentation = false
        
        searchController.searchBar.scopeButtonTitles = ["Course Title", "CRN Code"]
        tableView.tableHeaderView = searchController.searchBar
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.active && searchController.searchBar.text != "" {
            return filteredCourses.count
        } else {
            return courses.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("courseCell", forIndexPath: indexPath)
        let course: CWCourse
        if searchController.active && searchController.searchBar.text != "" {
            course = filteredCourses[indexPath.row]
        } else {
            course = courses[indexPath.row]
        }
        cell.textLabel!.text = course.getName()
        cell.detailTextLabel!.text = course.getCode()
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let course: CWCourse
        if searchController.active && searchController.searchBar.text != "" {
            course = filteredCourses[indexPath.row]
            delegate?.CourseSearchDidFinish(self, course: course)
        } else {
            course = courses[indexPath.row]
            delegate?.CourseSearchDidFinish(self, course: course)
        }
    }
    
    func filterCoursesForSearch(searchText: String, scope: String) {
        if scope == "Course Title" {
            filteredCourses = courses.filter({( course: CWCourse) -> Bool in
                return course.getName().lowercaseString.containsString(searchText.lowercaseString)
            })
        } else {
            filteredCourses = courses.filter({( course: CWCourse) -> Bool in
                return course.getCode().lowercaseString.containsString(searchText.lowercaseString)
            })
        }
        tableView.reloadData()
    }
    @IBAction func cancel(sender: UIBarButtonItem) {
        delegate?.CourseSearchDidCancel(self)
    }
}

extension CourseSearchTableViewController: UISearchResultsUpdating {
    func updateSearchResultsForSearchController(searchController: UISearchController){
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterCoursesForSearch(searchController.searchBar.text!, scope: scope)
    }
}

extension CourseSearchTableViewController: UISearchBarDelegate {
    func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterCoursesForSearch(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}