//
//  FauDegrees.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 3/21/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import Foundation

class FauDegrees {
    
    enum degreeTypes: String {
        case Bachelors
        case Masters
        case Graduate_Certificate = "Graduate Certificate"
        case Doctorate
        
        static var count: Int { return degreeTypes.Doctorate.hashValue + 1 }
        static let types: [String] = [degreeTypes.Bachelors.rawValue, degreeTypes.Masters.rawValue, degreeTypes.Graduate_Certificate.rawValue, degreeTypes.Doctorate.rawValue]
    }
    
    var name: String
    var type: String
    
    init(degreeType: degreeTypes, degreeName: String) {
        self.name = degreeName
        self.type = degreeType.rawValue
    }
    
    class func getFAUDegree() -> [Degree] {
        
        var fauDegrees = [Degree]()
        
        let bachelors = degreeTypes.Bachelors.rawValue
        let masters = degreeTypes.Masters.rawValue
        let certificate = degreeTypes.Graduate_Certificate.rawValue
        let doctorate = degreeTypes.Doctorate.rawValue
        
        
        //Bachelor Degrees
        let accounting = Degree(degreeType: bachelors, degreeName: "Accounting")
        fauDegrees.append(accounting)
        
        let anthropology = Degree(degreeType: bachelors, degreeName: "Anthropology")
        fauDegrees.append(anthropology)
        
        let architecture = Degree(degreeType: bachelors, degreeName: "Architecture")
        fauDegrees.append(architecture)
        
        let artStudioArt = Degree(degreeType: bachelors, degreeName: "Art: Studio Art")
        let artGraphicDesgign = Degree(degreeType: bachelors, degreeName: "Art: Graphic Design")
        fauDegrees.append(artStudioArt)
        fauDegrees.append(artGraphicDesgign)
        
        let artHistory = Degree(degreeType: bachelors, degreeName: "Art History")
        fauDegrees.append(artHistory)
        
        let biologicalScience = Degree(degreeType: bachelors, degreeName: "Biological Sciences")
        fauDegrees.append(biologicalScience)
        
        
        
        
        
        //Master Degrees
        let masterAccounting = Degree(degreeType: masters, degreeName: "Accounting")
        fauDegrees.append(masterAccounting)
        
        let masterAnthropology = Degree(degreeType: masters, degreeName: "Anthropology")
        fauDegrees.append(masterAnthropology)
        
        
        
        
        
        
        //Graduate Certificates
        let adultNursePrac = Degree(degreeType: certificate, degreeName: "Adult/ Gerontological Nurse Practitioner")
        fauDegrees.append(adultNursePrac)
        
        
        
        
        
        //Doctorate Degrees
        let businessAdmin = Degree(degreeType: doctorate, degreeName: "Business Administration")
        fauDegrees.append(businessAdmin)
        
        
        return fauDegrees
    }
    
}