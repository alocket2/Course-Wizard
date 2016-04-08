//
//  CWBuilding.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 4/6/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import Foundation


class CWBuilding {
    
    var name: String
    var longitutde: Double
    var latitude: Double
    
    init(buildingName: String, buildingLat: Double, buildingLong: Double) {
        self.name = buildingName
        self.latitude = buildingLat
        self.longitutde = buildingLong
    }
    
}