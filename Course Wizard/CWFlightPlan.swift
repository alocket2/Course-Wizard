//
//  CWFlightPlan.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 3/29/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import Foundation
import CoreData

class CWFlightPlan {
    
    enum classStandings: String {
        case Freshman
        case Sophmore
        case Junior
        case Senior
    }
    
    var courses: [CWCourse]
    var standing: String
    
    init(classStanding: String, courses: [CWCourse]) {
        self.standing = classStanding
        self.courses = courses
    }
    
    class func getCoursesFor(degree degree: String) -> [CWFlightPlan] {
        
        switch degree {
            case "Computer Science":
                return [self.computerScienceFreshman(), self.computerScienceSophmore(), self.computerScienceJunior(), self.computerScienceSenior()]
            case "Computer Engineering":
                return [self.computerEngineeringFreshman(), self.computerEngineeringSophmore(), self.computerEngineeringJunior(), self.computerEngineeringSenior()]
            default: break
        }
        
        return [self.computerScienceSenior()]
    }
    
    //Computer Science Flight Plan Courses
    
    private class func computerScienceFreshman() -> CWFlightPlan {
        var courses = [CWCourse]()
        
        courses.append(CWCourse(courseName: "Calculus w/ Analytical Geometry 1", courseCode: "MAC 2311", courseCredits: 4, coursePreRegs: ["MAC 1114", "MAC 1140"], courseCompletion: false))
        courses.append(CWCourse(courseName: "College Writing 1", courseCode:"ENC 1101" , courseCredits: 3, coursePreRegs: ["None"], courseCompletion: false))
        courses.append(CWCourse(courseName: "Introduction to Programming in C", courseCode: "COP 2220", courseCredits: 3, coursePreRegs: ["None"], courseCompletion: false))
        courses.append(CWCourse(courseName: "Foundations of Society & Human Behavior", courseCode: "IFP", courseCredits: 3, coursePreRegs: ["None"], courseCompletion: false))
        courses.append(CWCourse(courseName: "Calculus w/ Analytical Geometry 2", courseCode: "MAC 2312", courseCredits: 4, coursePreRegs: ["MAC 2311"], courseCompletion: false))
        courses.append(CWCourse(courseName: "College Writing 2", courseCode: "ENC 1102", courseCredits: 3, coursePreRegs: ["ENC 1101"], courseCompletion: false))
        courses.append(CWCourse(courseName: "Foundations of Computer Science", courseCode: "COP 3014", courseCredits: 3, coursePreRegs: ["COP 2220"], courseCompletion: false))
        courses.append(CWCourse(courseName: "Foundations of Computer Science Lab", courseCode: "COP 3014L", courseCredits: 1, coursePreRegs: ["COP 2220", "COP 3014"], courseCompletion: false))
        courses.append(CWCourse(courseName: "Introduction to Logic Design", courseCode: "CDA 3201C", courseCredits: 4, coursePreRegs: ["COP 2220"], courseCompletion: false))
        courses.append(CWCourse(courseName: "Discrete Mathematics", courseCode: "MAD 2104", courseCredits: 3, coursePreRegs: ["MAC 1105"], courseCompletion: false))
        
        return CWFlightPlan(classStanding: classStandings.Freshman.rawValue, courses: courses)
    }
    
    
    private class func computerScienceSophmore() -> CWFlightPlan {
        var courses = [CWCourse]()
        
        courses.append(CWCourse(courseName: "Physics 1", courseCode: "PHY 2048", courseCredits: 4, coursePreRegs: ["MAC 2311", "MAC 2312"], courseCompletion: false))
        courses.append(CWCourse(courseName: "Physics 1 Lab", courseCode: "PHY 2048L", courseCredits: 1, coursePreRegs: ["PHY 2048"], courseCompletion: false))
        courses.append(CWCourse(courseName: "Data Structures & Algorithm Analysis", courseCode: "COP 3530", courseCredits: 3, coursePreRegs: ["COP 3014", "MAD 2104"], courseCompletion: false))
        courses.append(CWCourse(courseName: "Foundations in Global Citizenship", courseCode: "IFP", courseCredits: 3, coursePreRegs: ["None"], courseCompletion: false))
        courses.append(CWCourse(courseName: "Foundations of Humanities", courseCode: "IFP", courseCredits: 3, coursePreRegs: ["None"], courseCompletion: false))
        courses.append(CWCourse(courseName: "Physics 2", courseCode: "PHY 2049", courseCredits: 4, coursePreRegs: ["PHY 2048"], courseCompletion: false))
        courses.append(CWCourse(courseName: "Physics 2 Lab", courseCode: "PHY 2049L", courseCredits: 1, coursePreRegs: ["PHY 2048L"], courseCompletion: false))
        courses.append(CWCourse(courseName: "Public Speaking", courseCode: "SPC 2608", courseCredits: 3, coursePreRegs: ["None"], courseCompletion: false))
        courses.append(CWCourse(courseName: "Intro to Internet Computing", courseCode: "COP 3813", courseCredits: 3, coursePreRegs: ["COP 3014"], courseCompletion: false))
        courses.append(CWCourse(courseName: "Introduction to Microprocessor Systems", courseCode: "CDA 3331C", courseCredits: 4, coursePreRegs: ["CDA 3201C"], courseCompletion: false))
        
        return CWFlightPlan(classStanding: classStandings.Sophmore.rawValue, courses: courses)
    }
    
    private class func computerScienceJunior() -> CWFlightPlan {
        var courses = [CWCourse]()
        
        courses.append(CWCourse(courseName: "Foreign Language 1", courseCode: "Language", courseCredits: 4, coursePreRegs: ["None"], courseCompletion: false))
        courses.append(CWCourse(courseName: "Computer Operating Systems", courseCode: "COP 4610", courseCredits: 3, coursePreRegs: ["COP 3530", "CDA 3331C"], courseCompletion: false))
        courses.append(CWCourse(courseName: "2nd Programming Language", courseCode: "CS Elective", courseCredits: 3, coursePreRegs: ["COP 3530"], courseCompletion: false))
        courses.append(CWCourse(courseName: "Mathematics Elective", courseCode: "Math Elective", courseCredits: 4, coursePreRegs: ["MAC 2311", "MAC 2312"], courseCompletion: false))
        courses.append(CWCourse(courseName: "Foreign Language 2", courseCode: "Language", courseCredits: 4, coursePreRegs: ["Foreign Lanuage 1"], courseCompletion: false))
        courses.append(CWCourse(courseName: "Design & Analysis of Algorithms", courseCode: "COT 4400", courseCredits: 3, coursePreRegs: ["COP 3530"], courseCompletion: false))
        courses.append(CWCourse(courseName: "Formal Languages & Automata Theory", courseCode: "COT 4420", courseCredits: 3, coursePreRegs: ["COP 3530"], courseCompletion: false))
        courses.append(CWCourse(courseName: "Stochastic Models for Computer Science", courseCode: "STA 4821", courseCredits: 3, coursePreRegs: ["MAC 2311", "MAC 2312"], courseCompletion: false))
        
        return CWFlightPlan(classStanding: classStandings.Junior.rawValue, courses: courses)
    }
    
    private class func computerScienceSenior() -> CWFlightPlan {
        var courses = [CWCourse]()
        
        courses.append(CWCourse(courseName: "Computer Science Elective", courseCode: "CS Elective", courseCredits: 3, coursePreRegs: ["COP 3530"], courseCompletion: false))
        courses.append(CWCourse(courseName: "Introduction to Database Structures", courseCode: "COP 3540", courseCredits: 3, coursePreRegs: ["COP 3530"], courseCompletion: false))
        courses.append(CWCourse(courseName: "Principles of Software Engineering", courseCode: "CEN 4010", courseCredits: 3, coursePreRegs: ["COP 3530"], courseCompletion: false))
        courses.append(CWCourse(courseName: "Additional Science Course", courseCode: "Science", courseCredits: 4, coursePreRegs: ["None"], courseCompletion: false))
        courses.append(CWCourse(courseName: "Computer Science Elective", courseCode: "CS Elective", courseCredits: 3, coursePreRegs: ["COP 3530"], courseCompletion: false))
        courses.append(CWCourse(courseName: "Senior Seminar", courseCode: "COT 4935", courseCredits: 1, coursePreRegs: ["Senior Standing"], courseCompletion: false))
        courses.append(CWCourse(courseName: "Free Electives", courseCode:"Electives", courseCredits: 8, coursePreRegs: ["None"], courseCompletion: false))
        
        return CWFlightPlan(classStanding: classStandings.Senior.rawValue, courses: courses)
    }
    
    //Computer Engineering Flight Plan Courses
    
    private class func computerEngineeringFreshman() -> CWFlightPlan {
        var courses = [CWCourse]()
        
        courses.append(CWCourse(courseName: "Calculus w/ Analytical Geometry 1", courseCode: "MAC 2311", courseCredits: 4, coursePreRegs: ["MAC 1114", "MAC 1140"], courseCompletion: false))
        
        
        return CWFlightPlan(classStanding: classStandings.Freshman.rawValue, courses: courses)
    }
    
    private class func computerEngineeringSophmore() -> CWFlightPlan {
        var courses = [CWCourse]()
        
        return CWFlightPlan(classStanding: classStandings.Sophmore.rawValue, courses: courses)
    }
    
    private class func computerEngineeringJunior() -> CWFlightPlan {
        var courses = [CWCourse]()
        
        return CWFlightPlan(classStanding: classStandings.Junior.rawValue, courses: courses)
    }
    
    private class func computerEngineeringSenior() -> CWFlightPlan {
        var courses = [CWCourse]()
        
        return CWFlightPlan(classStanding: classStandings.Senior.rawValue, courses: courses)
    }
    

}

