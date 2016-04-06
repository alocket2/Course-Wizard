//
//  MapViewController.swift
//  Course Wizard
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
import CoreData
import Mapbox

class MapViewController: UIViewController {
    
    enum Campuses: String {
        case Boca_Raton = "Boca Raton"
        case Dania_Beach = "Dania Beach (Sea Tech)"
        case Davie
        case Fort_Lauderdale = "Fort Lauderdale"
        case Harbor_Branch = "Harbor Branch"
        case Jupiter
    }
    
    
    @IBOutlet weak var tableView: UITableView!

    var mapView: MGLMapView!
    var currentCampus: String = ""
    var coreDataStack = CoreDataStack()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let styleURL = NSURL(string: "mapbox://styles/alockettjr/cik7nnuaw00emnyko48ysfg9c")
        mapView = MGLMapView(frame: view.bounds, styleURL: styleURL)
        mapView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        
        if currentCampus != "" {
            tableView.hidden = true
            setMapLocation()
            getCampusFromCoreData()
            self.navigationItem.title = currentCampus
            
        } else {
            tableView.hidden = false
            tableView.emptyDataSetSource = self
            tableView.emptyDataSetDelegate = self
            tableView.tableFooterView = UIView()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        
        getCampusFromCoreData()
        
        if currentCampus != "" {
            tableView.hidden = true
            setMapLocation()
            self.navigationItem.title = currentCampus
        } else {
            tableView.hidden = false
        }
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setMapLocation() {
        switch currentCampus {
        case Campuses.Boca_Raton.rawValue:
            mapView.setCenterCoordinate(CLLocationCoordinate2D(latitude: 26.370038,
                longitude: -80.102316),
                zoomLevel: 13, animated: false)
        case Campuses.Davie.rawValue:
            mapView.setCenterCoordinate(CLLocationCoordinate2D(latitude: 26.082184,
                longitude: -80.234852),
                zoomLevel: 13, animated: false)
        case Campuses.Jupiter.rawValue:
            mapView.setCenterCoordinate(CLLocationCoordinate2D(latitude: 26.887515,
                longitude: -80.116710),
                zoomLevel: 13, animated: false)
        default:
            print("Thats not a campus")
        }
        
        
        
        mapView.zoomEnabled = true
        mapView.zoomLevel = 17
        mapView.showsUserLocation = true
        mapView.userLocationVisible
        view.addSubview(mapView)
    }
    
    
    func getCampusFromCoreData() {
        
        let campusRequest = NSFetchRequest(entityName: "Campus")
        
        do {
            let results = try coreDataStack.managedObjectContext.executeFetchRequest(campusRequest)
            
            for result in results {
                if let campusRetrieved = result.valueForKey("location") as? String {
                    currentCampus = campusRetrieved
                }
            }
            
        } catch {
            print("Could not fetch the semester entity")
        }
        
    }
    
    func saveCampusToCoreData() {
        // Check to see if there is currently a campus
        guard let entity = NSEntityDescription.entityForName("Campus", inManagedObjectContext: coreDataStack.managedObjectContext) else {
            fatalError("Could not find entity descriptions!")
        }
        
        let campusEntity = Campus(entity: entity, insertIntoManagedObjectContext: coreDataStack.managedObjectContext)
        campusEntity.location = currentCampus
        
        do {
            try coreDataStack.managedObjectContext.save()
        } catch {
            print("Could not save location...")
        }
    }
    
    
    @IBAction func changeCampus(sender: UIBarButtonItem) {
        
        let controller = UIAlertController(title: "Campuses", message: nil, preferredStyle: .ActionSheet)
        let bocaAciton = UIAlertAction(title: "Boca Raton", style: .Default) { (UIAlertAction) -> Void in
            self.currentCampus = "Boca Raton"
            self.setMapLocation()
            self.navigationItem.title = self.currentCampus
            self.saveCampusToCoreData()
        }
        let davieAction = UIAlertAction(title: "Davie", style: .Default) { (UIAlertAction) -> Void in
            self.currentCampus = "Davie"
            self.setMapLocation()
            self.navigationItem.title = self.currentCampus
            self.saveCampusToCoreData()
        }
        let jupiterAction = UIAlertAction(title: "Jupiter", style: .Default) { (UIAlertAction) -> Void in
            self.currentCampus = "Jupiter"
            self.setMapLocation()
            self.navigationItem.title = self.currentCampus
            self.saveCampusToCoreData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        controller.addAction(bocaAciton)
        controller.addAction(davieAction)
        controller.addAction(jupiterAction)
        controller.addAction(cancelAction)
        
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "chooseBuildingSegue" {
            let controller = segue.destinationViewController as! CWBuildingsTableView
            controller.delegate = self
        }
    }
}

extension MapViewController: BuildingProtocol {
    func userDidSelect(building building: String, coordinates: (latitude: Double, longitude: Double)) {
        
        navigationController?.popViewControllerAnimated(true)
        
        // Add annotation to map
        //MARK: Check for previous points before adding a point if there is and it isnt the same point remove it
        
        let point = MGLPointAnnotation()
        
        if mapView.annotations?.count > 0 {
            mapView.removeAnnotation((mapView.annotations?.first)!)
        }
        
        point.coordinate = CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
        point.title = building
        
        mapView.addAnnotation(point)
    
        //Draws line from user location to annotation of building selected
        drawPolyLine((coordinates.latitude, coordinates.longitude))
    }
    
    func drawPolyLine(coordinates: (latitude: Double, longitude: Double)) {
        
        //Draws line from user location to annotation of building selected
        
    }
}

extension MapViewController: DZNEmptyDataSetDelegate, DZNEmptyDataSetSource {
    
    func titleForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        return UIFont.headlineFontWith(headline: "Campus Map")
    }
    
    func descriptionForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        return UIFont.taglineFontWith(body: "No campus has been selected. Please select your campus above or in the settings")
    }
    
    func imageForEmptyDataSet(scrollView: UIScrollView!) -> UIImage! {
        return UIImage(named: "map_route")
    }
    
    func imageTintColorForEmptyDataSet(scrollView: UIScrollView!) -> UIColor! {
        return UIColor.imageTintColor()
    }
    
}

