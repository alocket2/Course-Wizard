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
        degrees.append(CWDegree(degreeName: "Anthropology"))
        degrees.append(CWDegree(degreeName: "Architecture"))
        degrees.append(CWDegree(degreeName: "Art: Ceramics, Painting, Photography, Printmaking, Sculpture"))
        degrees.append(CWDegree(degreeName: "Art: Studio Art"))
        degrees.append(CWDegree(degreeName: "Art: Graphic Design"))
        degrees.append(CWDegree(degreeName: "Art: History"))
        degrees.append(CWDegree(degreeName: "Arts and Humanities"))
        degrees.append(CWDegree(degreeName: "Biological Science"))
        degrees.append(CWDegree(degreeName: "Chemistry"))
        degrees.append(CWDegree(degreeName: "Civil Engineering"))
        degrees.append(CWDegree(degreeName: "Commercial Music - Creative Track"))
        degrees.append(CWDegree(degreeName: "Commercial Music - Technology Track"))
        degrees.append(CWDegree(degreeName: "Communication Studies"))
        degrees.append(CWDegree(degreeName: "Computer Arts in Animation"))
        degrees.append(CWDegree(degreeName: "Computer Engineering"))
        degrees.append(CWDegree(degreeName: "Computer Information Systems"))
        degrees.append(CWDegree(degreeName: "Computer Science"))
        degrees.append(CWDegree(degreeName: "Criminal Justice"))
        degrees.append(CWDegree(degreeName: "Economics"))
        degrees.append(CWDegree(degreeName: "Exercise Science and Health Promotion"))
        degrees.append(CWDegree(degreeName: "Electrical Engineering"))
        degrees.append(CWDegree(degreeName: "Elementery Education"))
        degrees.append(CWDegree(degreeName: "Exceptional Education"))
        degrees.append(CWDegree(degreeName: "Finance"))
        degrees.append(CWDegree(degreeName: "Geography"))
        degrees.append(CWDegree(degreeName: "Geology"))
        degrees.append(CWDegree(degreeName: "Geomatics Engineering"))
        degrees.append(CWDegree(degreeName: "German"))
        degrees.append(CWDegree(degreeName: "Graphic Design"))
        degrees.append(CWDegree(degreeName: "Health Administration"))
        degrees.append(CWDegree(degreeName: "History"))
        degrees.append(CWDegree(degreeName: "Hospitality and Tourism Mgmt."))
        degrees.append(CWDegree(degreeName: "Hospitality Management"))
        degrees.append(CWDegree(degreeName: "Information Engineering Technology"))
        degrees.append(CWDegree(degreeName: "Interdisciplinaty Studies- Arts and Humanities"))
        degrees.append(CWDegree(degreeName: "Interdisciplinary Studies- Social Science"))
        degrees.append(CWDegree(degreeName: "International Business & Trade"))
        degrees.append(CWDegree(degreeName: "Italian"))
        degrees.append(CWDegree(degreeName: "Jazz Studies"))
        degrees.append(CWDegree(degreeName: "Jewish Studies"))
        degrees.append(CWDegree(degreeName: "Liberal Arts And Science"))
        degrees.append(CWDegree(degreeName: "Linguistics"))
        degrees.append(CWDegree(degreeName: "Management"))
        degrees.append(CWDegree(degreeName: "Management Information Systems"))
        degrees.append(CWDegree(degreeName: "Marketing"))
        degrees.append(CWDegree(degreeName: "Mathematics"))
        degrees.append(CWDegree(degreeName: "Neuroscience and Behavior"))
        degrees.append(CWDegree(degreeName: "Mechanical Engineering"))
        degrees.append(CWDegree(degreeName: "Multimedia Studies"))
        degrees.append(CWDegree(degreeName: "Music"))
        degrees.append(CWDegree(degreeName: "Music Business"))
        degrees.append(CWDegree(degreeName: "Music Education"))
        degrees.append(CWDegree(degreeName: "Music: Performance - Guitar"))
        degrees.append(CWDegree(degreeName: "Music: Performance - Piano"))
        degrees.append(CWDegree(degreeName: "Music: Performance - Vocal"))
        degrees.append(CWDegree(degreeName: "Music Performance - Instrumental"))
        degrees.append(CWDegree(degreeName: "Nursing"))
        degrees.append(CWDegree(degreeName: "Ocean Engineering"))
        degrees.append(CWDegree(degreeName: "Philosophy"))
        degrees.append(CWDegree(degreeName: "Political Science"))
        degrees.append(CWDegree(degreeName: "Psychobiology"))
        degrees.append(CWDegree(degreeName: "Psychology"))
        degrees.append(CWDegree(degreeName: "Public Management"))
        degrees.append(CWDegree(degreeName: "Real Estate"))
        degrees.append(CWDegree(degreeName: "Secondary Education - Englsih"))
        degrees.append(CWDegree(degreeName: "Secondary Education - Math"))
        degrees.append(CWDegree(degreeName: "Secondary Education - Music"))
        degrees.append(CWDegree(degreeName: "Secondary Education - Social Science"))
        degrees.append(CWDegree(degreeName: "Social Work"))
        degrees.append(CWDegree(degreeName: "Sociology"))
        degrees.append(CWDegree(degreeName: "Spanish"))
        degrees.append(CWDegree(degreeName: "Theatre"))
        degrees.append(CWDegree(degreeName: "Urban and Regional Planning"))
        degrees.append(CWDegree(degreeName: "Weekend B.B.A (Management)"))
        
        sortDegrees(&degrees)
        
        return CWDegrees(degreeType: degreeTypes.Bachelors.rawValue, degrees: degrees)
    }
    
    //Graduate Certificate
    private class func certificates() -> CWDegrees {
        var degrees = [CWDegree]()
        
        degrees.append(CWDegree(degreeName: "Adult / Gerontological Nurse Practitioner"))
        degrees.append(CWDegree(degreeName: "Advanced Holistic Nursing"))
        degrees.append(CWDegree(degreeName: "Aging"))
        degrees.append(CWDegree(degreeName: "Bioengineering"))
        degrees.append(CWDegree(degreeName: "Biomedical Science"))
        degrees.append(CWDegree(degreeName: "Child Welfare"))
        degrees.append(CWDegree(degreeName: "Clinical Nurse Leader"))
        degrees.append(CWDegree(degreeName: "Economic Development and Tourism"))
        degrees.append(CWDegree(degreeName: "English as a second Language"))
        degrees.append(CWDegree(degreeName: "Environmental"))
        degrees.append(CWDegree(degreeName: "Environmental Restoration"))
        degrees.append(CWDegree(degreeName: "Environmental Studies"))
        degrees.append(CWDegree(degreeName: "Family Nurse Practitioner"))
        degrees.append(CWDegree(degreeName: "Film and Culture"))
        degrees.append(CWDegree(degreeName: "Geographic Information Systems"))
        degrees.append(CWDegree(degreeName: "Health Administration"))
        degrees.append(CWDegree(degreeName: "Hospitality Management"))
        degrees.append(CWDegree(degreeName: "Innovation Entrepreneurship"))
        degrees.append(CWDegree(degreeName: "Marine Engineering Management"))
        degrees.append(CWDegree(degreeName: "Medical Physics"))
        degrees.append(CWDegree(degreeName: "Neuroscience"))
        degrees.append(CWDegree(degreeName: "Nonprofit Management"))
        degrees.append(CWDegree(degreeName: "Nursing Administration and Financial Leadership"))
        degrees.append(CWDegree(degreeName: "Nurse Educator"))
        degrees.append(CWDegree(degreeName: "Pre-Health Professions Studies"))
        degrees.append(CWDegree(degreeName: "Professional Accounting"))
        degrees.append(CWDegree(degreeName: "Remote Sensing"))
        degrees.append(CWDegree(degreeName: "Risk Management"))
        degrees.append(CWDegree(degreeName: "Sustainable Community Planning"))
        degrees.append(CWDegree(degreeName: "Teacher Leadership"))
        degrees.append(CWDegree(degreeName: "Transportation Engineering"))
        degrees.append(CWDegree(degreeName: "Visual Planning Technology"))
        degrees.append(CWDegree(degreeName: "Women, Gender, & Sexuality Studies"))
        
        sortDegrees(&degrees)
        
        return CWDegrees(degreeType: degreeTypes.Graduate_Cert.rawValue, degrees: degrees)
    }
    
    //Master Degrees
    private class func masters() -> CWDegrees {
        var degrees = [CWDegree]()
        
        degrees.append(CWDegree(degreeName: "Accounting"))
        degrees.append(CWDegree(degreeName: "Anthropology"))
        degrees.append(CWDegree(degreeName: "Communications"))
        degrees.append(CWDegree(degreeName: "Comparative Literature"))
        degrees.append(CWDegree(degreeName: "Creative Writing"))
        degrees.append(CWDegree(degreeName: "English"))
        degrees.append(CWDegree(degreeName: "History"))
        degrees.append(CWDegree(degreeName: "Linguistics"))
        degrees.append(CWDegree(degreeName: "Media, Technology & Entertainment"))
        degrees.append(CWDegree(degreeName: "Music"))
        degrees.append(CWDegree(degreeName: "Political Science"))
        degrees.append(CWDegree(degreeName: "Sociology"))
        degrees.append(CWDegree(degreeName: "Spanish"))
        degrees.append(CWDegree(degreeName: "Design and Technology"))
        degrees.append(CWDegree(degreeName: "Acting"))
        degrees.append(CWDegree(degreeName: "Book Arts"))
        degrees.append(CWDegree(degreeName: "Ceramics"))
        degrees.append(CWDegree(degreeName: "Drawing"))
        degrees.append(CWDegree(degreeName: "Painting"))
        degrees.append(CWDegree(degreeName: "Photography"))
        degrees.append(CWDegree(degreeName: "Printmaking"))
        degrees.append(CWDegree(degreeName: "Sculpture"))
        degrees.append(CWDegree(degreeName: "Graphic Design"))
        degrees.append(CWDegree(degreeName: "Women's Studies"))
        degrees.append(CWDegree(degreeName: "Biomedical Science"))
        degrees.append(CWDegree(degreeName: "Executive Forensic Accounting"))
        degrees.append(CWDegree(degreeName: "Business Administration"))
        degrees.append(CWDegree(degreeName: "Entrepreneurship"))
        degrees.append(CWDegree(degreeName: "Executive MBA"))
        degrees.append(CWDegree(degreeName: "Information System"))
        degrees.append(CWDegree(degreeName: "International Business"))
        degrees.append(CWDegree(degreeName: "Marketing"))
        degrees.append(CWDegree(degreeName: "Operations Management"))
        degrees.append(CWDegree(degreeName: "Online MBA"))
        degrees.append(CWDegree(degreeName: "Online MBA - Hospitality Management"))
        degrees.append(CWDegree(degreeName: "Professional MBA"))
        degrees.append(CWDegree(degreeName: "Professional MBA - Hospitality Management"))
        degrees.append(CWDegree(degreeName: "Sport Management - On Campus"))
        degrees.append(CWDegree(degreeName: "Sport Management - Online"))
        degrees.append(CWDegree(degreeName: "Executive Health Administration"))
        degrees.append(CWDegree(degreeName: "Health Administration"))
        degrees.append(CWDegree(degreeName: "Economics"))
        degrees.append(CWDegree(degreeName: "Finance"))
        degrees.append(CWDegree(degreeName: "Information Technology and Management"))
        degrees.append(CWDegree(degreeName: "Music Business Admin"))
        degrees.append(CWDegree(degreeName: "Taxation"))
        degrees.append(CWDegree(degreeName: "Executive Taxation"))
        degrees.append(CWDegree(degreeName: "Counselor Education"))
        degrees.append(CWDegree(degreeName: "Clinical Mental Health Counseling"))
        degrees.append(CWDegree(degreeName: "Clinical Rehabilitation Counseling"))
        degrees.append(CWDegree(degreeName: "Elementary Education"))
        degrees.append(CWDegree(degreeName: "Environmental Education"))
        degrees.append(CWDegree(degreeName: "Exceptional Student Education"))
        degrees.append(CWDegree(degreeName: "Exercise and Health Promotion"))
        degrees.append(CWDegree(degreeName: "Reading Education"))
        degrees.append(CWDegree(degreeName: "Educational Psychology"))
        degrees.append(CWDegree(degreeName: "Instructional Technology"))
        degrees.append(CWDegree(degreeName: "School Counseling"))
        degrees.append(CWDegree(degreeName: "Social Foundations: Multicultural Education"))
        degrees.append(CWDegree(degreeName: "Speech-Language Pathology/Audiology"))
        degrees.append(CWDegree(degreeName: "TESOL and Bilingual Education"))
        degrees.append(CWDegree(degreeName: "Curriculum and Instruction"))
        degrees.append(CWDegree(degreeName: "Art"))
        degrees.append(CWDegree(degreeName: "Elementary Education plus Certification"))
        degrees.append(CWDegree(degreeName: "English"))
        degrees.append(CWDegree(degreeName: "French"))
        degrees.append(CWDegree(degreeName: "Spanish"))
        degrees.append(CWDegree(degreeName: "Biology"))
        degrees.append(CWDegree(degreeName: "Chemistry"))
        degrees.append(CWDegree(degreeName: "Physics"))
        degrees.append(CWDegree(degreeName: "Mathematics"))
        degrees.append(CWDegree(degreeName: "Social Science"))
        degrees.append(CWDegree(degreeName: "TESOL"))
        degrees.append(CWDegree(degreeName: "School Leaders (K-12)"))
        degrees.append(CWDegree(degreeName: "Adult and Community Educational Leaders"))
        degrees.append(CWDegree(degreeName: "Higher Education Leaders"))
        degrees.append(CWDegree(degreeName: "Bioengineering"))
        degrees.append(CWDegree(degreeName: "Civil Engineering"))
        degrees.append(CWDegree(degreeName: "Computer Engineering"))
        degrees.append(CWDegree(degreeName: "Computer Science"))
        degrees.append(CWDegree(degreeName: "Information Technology and Management"))
        degrees.append(CWDegree(degreeName: "Electrical Engineering"))
        degrees.append(CWDegree(degreeName: "Mechanical Engineering"))
        degrees.append(CWDegree(degreeName: "Ocean Engineering"))
        degrees.append(CWDegree(degreeName: "Nursing"))
        degrees.append(CWDegree(degreeName: "Nursing Administration and Financial Leadership"))
        degrees.append(CWDegree(degreeName: "Adult/Gerontological Nurse Practitioner"))
        degrees.append(CWDegree(degreeName: "Advanced Holistic Nursing"))
        degrees.append(CWDegree(degreeName: "Clinical Nurse Leader"))
        degrees.append(CWDegree(degreeName: "Family Nurse Practitioner"))
        degrees.append(CWDegree(degreeName: "Nurse Educator"))
        degrees.append(CWDegree(degreeName: "Post Master's Certificate"))
        degrees.append(CWDegree(degreeName: "Applied Math and Statistics"))
        degrees.append(CWDegree(degreeName: "Biological Sciences"))
        degrees.append(CWDegree(degreeName: "Business Biotechnology"))
        degrees.append(CWDegree(degreeName: "Complex Systems and Brain Sciences"))
        degrees.append(CWDegree(degreeName: "Environmental Science"))
        degrees.append(CWDegree(degreeName: "Experimental Psychology"))
        degrees.append(CWDegree(degreeName: "Geography"))
        degrees.append(CWDegree(degreeName: "Geology"))
        degrees.append(CWDegree(degreeName: "Geosciences"))
        degrees.append(CWDegree(degreeName: "Integrative Biology"))
        degrees.append(CWDegree(degreeName: "Integrative Biology and Neuroscience"))
        degrees.append(CWDegree(degreeName: "Mathematical Science"))
        degrees.append(CWDegree(degreeName: "Medical Physics"))
        degrees.append(CWDegree(degreeName: "Psychology"))
        
        sortDegrees(&degrees)
        
        return CWDegrees(degreeType: degreeTypes.Masters.rawValue, degrees: degrees)
    }
    
    //Doctorates
    private class func doctorates() -> CWDegrees {
        var degrees = [CWDegree]()
        
        degrees.append(CWDegree(degreeName: "Business Administration"))
        degrees.append(CWDegree(degreeName: "Chemistry"))
        degrees.append(CWDegree(degreeName: "Comparative Studies"))
        degrees.append(CWDegree(degreeName: "Complex Systems and Brain Sciences"))
        degrees.append(CWDegree(degreeName: "Computer Engineering"))
        degrees.append(CWDegree(degreeName: "Computer Science"))
        degrees.append(CWDegree(degreeName: "Counselor Education"))
        degrees.append(CWDegree(degreeName: "Curriculum and Instruction"))
        degrees.append(CWDegree(degreeName: "Educational Leadership"))
        degrees.append(CWDegree(degreeName: "Electrical Engineering"))
        degrees.append(CWDegree(degreeName: "Exceptional Student Education"))
        degrees.append(CWDegree(degreeName: "Experimental Psychology"))
        degrees.append(CWDegree(degreeName: "Geosciences"))
        degrees.append(CWDegree(degreeName: "Integrative Biology"))
        degrees.append(CWDegree(degreeName: "Mathematical Sciences"))
        degrees.append(CWDegree(degreeName: "Mechanical Engineering"))
        degrees.append(CWDegree(degreeName: "Medicine"))
        degrees.append(CWDegree(degreeName: "Nursing"))
        degrees.append(CWDegree(degreeName: "Ocean Engineering"))
        degrees.append(CWDegree(degreeName: "Physics"))
        degrees.append(CWDegree(degreeName: "Public Administration"))
        degrees.append(CWDegree(degreeName: "Social Work"))
        
        sortDegrees(&degrees)
        
        return CWDegrees(degreeType: degreeTypes.Doctorates.rawValue, degrees: degrees)
    }
    
     class func sortDegrees(inout degrees: [CWDegree]) {
        degrees.sortInPlace {$0.degree < $1.degree}
    }
        

}
    