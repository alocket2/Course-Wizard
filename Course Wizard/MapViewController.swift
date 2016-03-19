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

    var mapView: MGLMapView!
    var coreDataStack = CoreDataStack()
    var currentCampus: String = "`"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCampusFromCoreData()
        
        let styleURL = NSURL(string: "mapbox://styles/alockettjr/cik7nnuaw00emnyko48ysfg9c")
        mapView = MGLMapView(frame: view.bounds, styleURL: styleURL)
        mapView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
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
        setMapLocation()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        getCampusFromCoreData()
        setMapLocation()
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


}
