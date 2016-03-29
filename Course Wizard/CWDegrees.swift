//
//  FauDegrees.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 3/21/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import Foundation

class CWDegrees {
    
    enum degreeTypes: String {
        case Bachelors
        case Masters
        case Graduate_Cert = "Graduate Certificate"
        case Doctorates
    }
    
    var degrees: [CWDegree]
    var type: String
    
    init(degreeType: String, degrees: [CWDegree]) {
        self.degrees = degrees
        self.type = degreeType
    }
    
    
    class func cwDegrees() -> [CWDegrees] {
        return [self.bachelors(), self.certificates(), self.masters(), self.doctorates()]
    }
    
    
    //Bachelors Degrees
    private class func bachelors() -> CWDegrees {
        var degrees = [CWDegree]()
        
        degrees.append(CWDegree(degreeName: "Accounting"))
        degrees.append(CWDegree(degreeName: "Computer Science"))
        degrees.append(CWDegree(degreeName: "Computer Engineering"))
        
        return CWDegrees(degreeType: degreeTypes.Bachelors.rawValue, degrees: degrees)
    }
    
    //Graduate Certificate
    private class func certificates() -> CWDegrees {
        var degrees = [CWDegree]()
        
        degrees.append(CWDegree(degreeName: "Adult / Gerontological Nurse Practitioner"))
        
        return CWDegrees(degreeType: degreeTypes.Graduate_Cert.rawValue, degrees: degrees)
    }
    
    //Master Degrees
    private class func masters() -> CWDegrees {
        var degrees = [CWDegree]()
        
        degrees.append(CWDegree(degreeName: "Accounting"))
    
        
        return CWDegrees(degreeType: degreeTypes.Masters.rawValue, degrees: degrees)
    }
    
    //Doctorates
    private class func doctorates() -> CWDegrees {
        var degrees = [CWDegree]()
        
        degrees.append(CWDegree(degreeName: "Business Administration"))
        //Test
        
        return CWDegrees(degreeType: degreeTypes.Doctorates.rawValue, degrees: degrees)
    }
        

}
    