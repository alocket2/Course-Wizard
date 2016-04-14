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
        case Jupiter
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buildingsButton: UIBarButtonItem!
    
    var mapView: MGLMapView!
    var currentCampus: String = ""
    var coreDataStack = CoreDataStack()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let styleURL = NSURL(string: "mapbox://styles/alockettjr/cik7nnuaw00emnyko48ysfg9c")
        mapView = MGLMapView(frame: view.bounds, styleURL: styleURL)
        mapView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]

        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        getCampusFromCoreData()
        
        if currentCampus == "Boca Raton" || currentCampus == "Jupiter" {
            tableView.hidden = true
            mapView.hidden = false
            buildingsButton.enabled = true
            setMapLocation()
            self.navigationItem.title = currentCampus
        } else {
            tableView.hidden = false
            mapView.hidden = true
            buildingsButton.enabled = false
            tableView.reloadData()
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadInitialMapView() {
        
    }
    
    func setMapLocation() {
        
        switch currentCampus {
        case Campuses.Boca_Raton.rawValue:
            mapView.setCenterCoordinate(CLLocationCoordinate2D(latitude: 26.370038,
                longitude: -80.102316),
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
        //mapView.userTrackingMode = .Follow
        
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
            self.mapView.hidden = false
            self.buildingsButton.enabled = true
            self.navigationItem.title = self.currentCampus
            self.saveCampusToCoreData()
        }
        let jupiterAction = UIAlertAction(title: "Jupiter", style: .Default) { (UIAlertAction) -> Void in
            self.currentCampus = "Jupiter"
            self.setMapLocation()
            self.mapView.hidden = false
            self.buildingsButton.enabled = true
            self.navigationItem.title = self.currentCampus
            self.saveCampusToCoreData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        controller.addAction(bocaAciton)
        controller.addAction(jupiterAction)
        controller.addAction(cancelAction)
        
        self.presentViewController(controller, animated: true, completion: nil)
        
        controller.view.tintColor = UIColor.actionBackgroundColor()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "chooseBuildingSegue" {
            let controller = segue.destinationViewController as! CWBuildingsTableView
            controller.delegate = self
        }
    }
}

extension MapViewController: DZNEmptyDataSetDelegate, DZNEmptyDataSetSource {
    
    func titleForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        return UIFont.headlineFontWith(headline: "Campus Map")
    }
    
    func descriptionForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        return UIFont.taglineFontWith(body: "Currently the \(currentCampus) campus has no campus map.")
    }
    
    func imageForEmptyDataSet(scrollView: UIScrollView!) -> UIImage! {
        return UIImage(named: "map_route")
    }
    
    func imageTintColorForEmptyDataSet(scrollView: UIScrollView!) -> UIColor! {
        return UIColor.imageTintColor()
    }
    
    func verticalOffsetForEmptyDataSet(scrollView: UIScrollView!) -> CGFloat {
        return -50.0
    }
    
}

extension MapViewController: BuildingProtocol, MGLMapViewDelegate {
    func userDidSelect(building building: String, coordinates: (latitude: CLLocationDegrees, longitude: CLLocationDegrees)) {
        
        navigationController?.popViewControllerAnimated(true)
        
        var cords = [CLLocationCoordinate2D]()
        let buildingLocation = CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
        
        cords.append(buildingLocation)
        cords.append((mapView.userLocation?.coordinate)!)
        
        // Add annotation to map
        let point = MGLPointAnnotation()
        
        if mapView.annotations?.count > 0 {
            mapView.removeAnnotations(mapView.annotations!)
        }
        
        point.coordinate = CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
        point.title = building
        
        mapView.addAnnotation(point)
        
    }
    
}

