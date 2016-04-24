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
        return [self.bocaBuildings()]
    }
    
    class func cwJupiterBuildings() -> [CWBuildings] {
        return [self.jupiterBuildings()]
    }
    
    private class func bocaBuildings() -> CWBuildings {
        var buildings = [CWBuilding]()
        
        buildings.append(CWBuilding(buildingName: "Glades Park Towers", buildingLat: 26.367787, buildingLong: -80.104272))
        buildings.append(CWBuilding(buildingName: "Heritage Park South", buildingLat: 26.369226, buildingLong: -80.103733))
        buildings.append(CWBuilding(buildingName: "Heritage Park North", buildingLat: 26.369743, buildingLong: -80.103944))
        
        sortBuildings(&buildings)
        return CWBuildings(buildings: buildings)
        
    }
    
    private class func jupiterBuildings() -> CWBuildings {
        var buildings = [CWBuilding]()
        
        buildings.append(CWBuilding(buildingName: "Harriet L. Wilkes Honors College", buildingLat: 26.888154, buildingLong: -80.117663))
        buildings.append(CWBuilding(buildingName: "MacArthur Administration & Classroom Building", buildingLat: 26.887309, buildingLong: -80.118046))
        buildings.append(CWBuilding(buildingName: "Student Resources & Classroom Building", buildingLat: 26.887481, buildingLong: -80.117553))
        buildings.append(CWBuilding(buildingName: "Utility Plant", buildingLat: 26.886509, buildingLong: -80.118044))
        
        
        return CWBuildings(buildings: buildings)
    }
    
    private class func sortBuildings(inout buildings: [CWBuilding]) {
        buildings.sortInPlace{$0.name < $1.name}
    }
}