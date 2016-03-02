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
import Mapbox

class MapViewController: UIViewController {

    var mapView: MGLMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        
        mapView.setCenterCoordinate(CLLocationCoordinate2D(latitude: 26.370038,
            longitude: -80.102316),
            zoomLevel: 13, animated: false)
        
        mapView.zoomEnabled = true
        mapView.zoomLevel = 17
        
        view.addSubview(mapView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
