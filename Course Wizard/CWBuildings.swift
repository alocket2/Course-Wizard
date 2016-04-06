//
//  CWBuildings.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 4/6/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import Foundation

class CWBuildings {
    
    var buildings: [CWBuilding]
    
    init(buildings: [CWBuilding]) {
        self.buildings = buildings
    }
    
    class func cwBuildings() -> [CWBuildings] {
        return [self.allBuildings()]
    }
    
    private class func allBuildings() -> CWBuildings {
        var buildings = [CWBuilding]()
        
        buildings.append(CWBuilding(buildingName: "Glades Park Towers", buildingLat: 26.367787, buildingLong: -80.104272))
        buildings.append(CWBuilding(buildingName: "Heritage Park South", buildingLat: 26.369226, buildingLong: -80.103733))
        buildings.append(CWBuilding(buildingName: "Heritage Park North", buildingLat: 26.369743, buildingLong: -80.103944))
        
        sortBuildings(&buildings)
        return CWBuildings(buildings: buildings)
        
    }
    
    private class func sortBuildings(inout buildings: [CWBuilding]) {
        buildings.sortInPlace{$0.name < $1.name}
    }
}