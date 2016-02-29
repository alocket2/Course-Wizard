//
//  MapViewController.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 2/28/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit
import Mapbox

class MapViewController: UIViewController {

    var mapView: MGLMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let styleURL = NSURL(string: "mapbox://styles/alockettjr/cik7nnuaw00emnyko48ysfg9c")
        mapView = MGLMapView(frame: view.bounds, styleURL: styleURL)
        mapView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        
        mapView.setCenterCoordinate(CLLocationCoordinate2D(latitude: 26.370038,
            longitude: -80.102316),
            zoomLevel: 13, animated: false)
        
        mapView.zoomEnabled = true
        mapView.zoomLevel = 16
        
        view.addSubview(mapView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
