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
        buildings.append(CWBuilding(buildingName: "Indian River West Tower", buildingLat: 26.367630, buildingLong: -80.103453))
        buildings.append(CWBuilding(buildingName: "Indian River East Tower", buildingLat: 26.368985, buildingLong: -80.102933))
        buildings.append(CWBuilding(buildingName: "Culture & Society Building", buildingLat: 26.368399, buildingLong: -80.102348))
        buildings.append(CWBuilding(buildingName: "Living Room Theatres", buildingLat: 26.368264, buildingLong: -80.101635))
        buildings.append(CWBuilding(buildingName: "Dorothy F. Schmidt Arts & Letters", buildingLat: 26.369447, buildingLong: -80.102396))
        buildings.append(CWBuilding(buildingName: "Student Support Services", buildingLat: 26.368981, buildingLong: -80.105497))
        buildings.append(CWBuilding(buildingName: "General Classroom South", buildingLat: 26.371251, buildingLong: -80.102978))
        buildings.append(CWBuilding(buildingName: "Instructional Services", buildingLat: 26.371283, buildingLong: -80.103714))
        buildings.append(CWBuilding(buildingName: "S.E. Wimberly Library", buildingLat: 26.371806, buildingLong: -80.104018))
        buildings.append(CWBuilding(buildingName: "Levine-Weinberger Jewish Life Center", buildingLat: 26.371862, buildingLong: -26.371862))
        buildings.append(CWBuilding(buildingName: "Computer Center", buildingLat: 26.372457, buildingLong: -80.103811))
        buildings.append(CWBuilding(buildingName: "Hillel of Broward and Palm Beach", buildingLat: 26.372457, buildingLong: -80.103811))
        buildings.append(CWBuilding(buildingName: "Barry Kaye Hall", buildingLat: 26.373161, buildingLong: -80.103457))
        buildings.append(CWBuilding(buildingName: "Fleming Hall", buildingLat: 26.373159, buildingLong: -80.103911))
        buildings.append(CWBuilding(buildingName: "Fleming West", buildingLat: 26.373150, buildingLong: -80.104229))
        buildings.append(CWBuilding(buildingName: "College of Business", buildingLat: 26.373246, buildingLong: -80.104801))
        buildings.append(CWBuilding(buildingName: "Sean Stein Pavilion", buildingLat: 26.373254, buildingLong: -80.104565))
        buildings.append(CWBuilding(buildingName: "Office Depot Center for Executive Education", buildingLat: 26.373360, buildingLong: -80.105087))
        buildings.append(CWBuilding(buildingName: "College of Education", buildingLat: 26.373394, buildingLong: -80.105824))
        buildings.append(CWBuilding(buildingName: "Marleen & Harold Forkas Alumni Center", buildingLat: 26.374123, buildingLong: -80.103474))
        buildings.append(CWBuilding(buildingName: "Recreation and Fitness Center", buildingLat: 26.374243, buildingLong: -80.102366))
        buildings.append(CWBuilding(buildingName: "Plant Growth Complex", buildingLat: 26.373628, buildingLong: -80.103016))
        buildings.append(CWBuilding(buildingName: "Research Support Facility", buildingLat: 26.373650, buildingLong: -80.102756))
        buildings.append(CWBuilding(buildingName: "Behavioral Sciences", buildingLat: 26.372995, buildingLong: -80.102876))
        buildings.append(CWBuilding(buildingName: "General Classroom North", buildingLat: 26.373215, buildingLong: -80.102365))
        buildings.append(CWBuilding(buildingName: "Physical Sciences", buildingLat: 26.372928, buildingLong: -80.101939))
        buildings.append(CWBuilding(buildingName: "Kenneth R. Williams Administration", buildingLat: 26.371900, buildingLong: -80.101602))
        buildings.append(CWBuilding(buildingName: "Science and Engineering", buildingLat: 26.373236, buildingLong: -80.101602))
        buildings.append(CWBuilding(buildingName: "College of Medicine", buildingLat: 26.373438, buildingLong: -80.100443))
        buildings.append(CWBuilding(buildingName: "Social Science", buildingLat: 26.370704, buildingLong: -80.101838))
        buildings.append(CWBuilding(buildingName: "Bookstore", buildingLat: 26.370771, buildingLong: -80.103694))
        buildings.append(CWBuilding(buildingName: "Traditions Plaza", buildingLat: 26.370463, buildingLong: -80.102916))
        buildings.append(CWBuilding(buildingName: "College of Nursing", buildingLat: 26.370918, buildingLong: -80.100929))
        buildings.append(CWBuilding(buildingName: "Stand Among Friends", buildingLat: 26.370874, buildingLong: -80.100588))
        buildings.append(CWBuilding(buildingName: "Dorothy F. Schmidt Arts & Humanities", buildingLat: 26.369760, buildingLong: -80.101345))
        buildings.append(CWBuilding(buildingName: "Schmidt Center Gallery", buildingLat: 26.368763, buildingLong: -80.102024))
        buildings.append(CWBuilding(buildingName: "Dorothy F. Schmidt Visual Arts", buildingLat: 26.369187, buildingLong: -80.101079))
        buildings.append(CWBuilding(buildingName: "Engineering East", buildingLat: 26.372877, buildingLong: -80.098512))
        
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