//
//  CWBuildingsTableView.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 4/5/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit

protocol BuildingProtocol: class {
    func userDidSelect(building building: String, coordinates:(latitude: Double, longitude: Double))
}

class CWBuildingsTableView: UITableViewController {
    
    weak var delegate: BuildingProtocol?
    
    override func viewDidLoad() {
        navigationItem.title = "Buildings"
    }
    
    lazy var cwBuildings: [CWBuildings] = {
        return CWBuildings.cwBuildings()
    }()
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let buildings = cwBuildings[section]
        return buildings.buildings.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "buildingCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! BuildingTableViewCell
        let cwBuilding = cwBuildings[indexPath.section]
        let building = cwBuilding.buildings[indexPath.row]
        
        cell.buildingName.text = building.name
        
        cell.backgroundColor = UIColor.incompletedCourseCellBackgroundColor()
        cell.textLabel?.textColor = UIColor.darkGrayColor()
        
        return cell
}
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cwBuilding = cwBuildings[indexPath.section]
        let building = cwBuilding.buildings[indexPath.row]
        delegate?.userDidSelect(building: building.name, coordinates: (building.latitude, building.longitutde))
    }
}
