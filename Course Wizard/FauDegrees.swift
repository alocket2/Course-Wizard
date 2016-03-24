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
        case Graduate_Cert = "Graduate Certificate"
        case Doctorates
    }
    
    var degrees: [Degree]
    var type: String
    
    init(degreeType: String, degrees: [Degree]) {
        self.degrees = degrees
        self.type = degreeType
    }
    
    
    class func fauDegrees() -> [FauDegrees] {
        return [self.bachelors(), self.masters(), self.certificates(), self.doctorates()]
    }
    
    
    //Bachelors Degrees
    private class func bachelors() -> FauDegrees {
        var degrees = [Degree]()
        
        degrees.append(Degree(degreeName: "Accounting"))
        degrees.append(Degree(degreeName: "Computer Science"))
        degrees.append(Degree(degreeName: "Computer Engineering"))
        
        return FauDegrees(degreeType: degreeTypes.Bachelors.rawValue, degrees: degrees)
    }
    
    
    
    
    //Master Degrees
    private class func masters() -> FauDegrees {
        var degrees = [Degree]()
        
        degrees.append(Degree(degreeName: "Accounting"))
    
        
        return FauDegrees(degreeType: degreeTypes.Masters.rawValue, degrees: degrees)
    }
    
    
    //Graduate Certificate
    private class func certificates() -> FauDegrees {
        var degrees = [Degree]()
        
        degrees.append(Degree(degreeName: "Adult / Gerontological Nurse Practitioner"))
        
        return FauDegrees(degreeType: degreeTypes.Graduate_Cert.rawValue, degrees: degrees)
    }
    
    //Doctorates
    private class func doctorates() -> FauDegrees {
        var degrees = [Degree]()
        
        degrees.append(Degree(degreeName: "Business Administration"))
        
        return FauDegrees(degreeType: degreeTypes.Doctorates.rawValue, degrees: degrees)
    }
        

}
    