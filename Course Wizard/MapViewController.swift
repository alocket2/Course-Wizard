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
        
        
       //Check campus location in an switch statement then set coordinate appropriately
        
        
       //Coordinates for campus locations.
        
        /*
        
        Davie - latitude: 26.082184, longitude: -80.234852
        Fort Lauderdale - latitude: 26.119693, longitude: -80.141193
        Dania Beach (Sea Tech) - latitude: 26.055044, longitude: -80.113076
        Boca Raton - latitude: 26.370038, longitude: -80.102316
        Jupiter - latitude: 26.887515, longitude: -80.116710
        Harbor Branch - latitude: 27.535612, longitude: -80.359711
        
       */
        
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
        case "Boca Raton":
            mapView.setCenterCoordinate(CLLocationCoordinate2D(latitude: 26.370038,
                longitude: -80.102316),
                zoomLevel: 13, animated: false)
        case "Dania Beach (Sea Tech)":
            mapView.setCenterCoordinate(CLLocationCoordinate2D(latitude: 26.055044,
                longitude: -80.113076),
                zoomLevel: 13, animated: false)
        case "Davie":
            mapView.setCenterCoordinate(CLLocationCoordinate2D(latitude: 26.082184,
                longitude: -80.234852),
                zoomLevel: 13, animated: false)
        case "Fort Lauderdale":
            mapView.setCenterCoordinate(CLLocationCoordinate2D(latitude: 26.119693,
                longitude: -80.141193),
                zoomLevel: 13, animated: false)
        case "Harbor Branch":
            mapView.setCenterCoordinate(CLLocationCoordinate2D(latitude: 27.535612,
                longitude: -80.359711),
                zoomLevel: 13, animated: false)
        case "Jupiter":
            mapView.setCenterCoordinate(CLLocationCoordinate2D(latitude: 26.887515,
                longitude: -80.116710),
                zoomLevel: 13, animated: false)
        default:
            print("Thats not a campus")
        }
        
        
        
        mapView.zoomEnabled = true
        mapView.zoomLevel = 17
        
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
        let daniaAction = UIAlertAction(title: "Dania Beach (Sea Tech)", style: .Default) { (UIAlertAction) -> Void in
            self.currentCampus = "Dania Beach (Sea Tech)"
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
        let fortLaudAction = UIAlertAction(title: "Fort Lauderdale", style: .Default) { (UIAlertAction) -> Void in
            self.currentCampus = "Fort Lauderdale"
            self.setMapLocation()
            self.navigationItem.title = self.currentCampus
            self.saveCampusToCoreData()
        }
        let harborAction = UIAlertAction(title: "Harbor Branch", style: .Default) { (UIAlertAction) -> Void in
            self.currentCampus = "Harbor Branch"
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
        controller.addAction(daniaAction)
        controller.addAction(davieAction)
        controller.addAction(fortLaudAction)
        controller.addAction(harborAction)
        controller.addAction(jupiterAction)
        controller.addAction(cancelAction)
        
        self.presentViewController(controller, animated: true, completion: nil)
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
