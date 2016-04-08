//
//  CWFlightPlan.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 3/29/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit
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
    
    class func getCoursesFor(degree degree: String) -> [CWFlightPlan]? {
        
        switch degree {
            case "Computer Science":
                return [self.computerScienceFreshman(), /*self.computerScienceSophmore(), self.computerScienceJunior(), self.computerScienceSenior()*/]
          
            case "Computer Engineering":
                return [] //[self.computerEngineeringFreshman(), self.computerEngineeringSophmore(), self.computerEngineeringJunior(), self.computerEngineeringSenior()]
            
            case "Ocean Engineering":
                return [] //[self.oceanEngineeringFreshman(), self.oceanEngineeringSophmore(), self.oceanEngineeringJunior()]
            default:
                return []
        }
    }

}

// MARK: Extensions are used for each degree's flight plan

// MARK: BAchelor Degree's

// Computer Science Fligt Plan

extension CWFlightPlan {
    
    private class func computerScienceFreshman() -> CWFlightPlan {
        var courses = [CWCourse]()
        
        courses.append(CWCourse(courseName: "Calculus w/ Analytical Geometry 1", courseCode: "MAC 2311", courseCredits: 4, courseCoreqs: ["None"],  coursePreRegs: ["MAC 1114", "MAC 1140"], courseDescription: "Continuity, differentiability, differential approximation, optimization and curve sketching of functions and inverse functions of a single variable, including treatment of trigonometric functions. Mean value theorem and L'Hopital's Rule. Introduction to integration.", isGordonRule: true))
        
        courses.append(CWCourse(courseName: "College Writing 1", courseCode:"ENC 1101" , courseCredits: 3, courseCoreqs: ["None"], coursePreRegs: ["None"], courseDescription: "Reading examples of effective expository prose and writing essays practicing the forms of rhetoric.", isGordonRule: true))
        
        courses.append(CWCourse(courseName: "Introduction to Programming in C", courseCode: "COP 2220", courseCredits: 3, courseCoreqs: ["CDA 3201C"], coursePreRegs: ["None"], courseDescription: "Introduction to programming in C. Variable types, arithmetic statements, input/output statements, loops, conditional statements, functions, arrays and structures. Programming projects in C.", isGordonRule: false))
        
        courses.append(CWCourse(courseName: "Foundations of Society & Human Behavior", courseCode: "IFP", courseCredits: 3, courseCoreqs: ["None"], coursePreRegs: ["None"], courseDescription: "Courses in this area examine the forces that shape human behavior and societies. The disciplines represented in this foundation area study individuals, groups, societies, cultures, markets and nations. Their scope is broad: the formation of attitudes; how institutions develop, function and change; the forces that transform society and social institutions; how societies change the environment and respond to environmental change; the relationships between individuals and society; and the scope and complexity of systems of race, ethnicity, gender, sexuality and social class.", isGordonRule: true))
        
       courses.append(CWCourse(courseName: "Calculus w/ Analytical Geometry 2", courseCode: "MAC 2312", courseCredits: 4, courseCoreqs: ["None"], coursePreRegs: ["MAC 2311"], courseDescription: "Continuation of MAC 2311. Logarithmic, Exponential, hyperbolic, and inverse trigonometric functions, techniques of integration, partial fractions, area, trapezoid and Simpson's rules, volume, work; analytic geometry; Taylor approximations; sequences and series; polar representation of complex numbers.", isGordonRule: true))
        
        courses.append(CWCourse(courseName: "College Writing 2", courseCode: "ENC 1102", courseCredits: 3, courseCoreqs: ["None"], coursePreRegs: ["ENC 1101 with a grade of C or better."], courseDescription: "A continuation of College Writing 1.", isGordonRule: true))
       
        courses.append(CWCourse(courseName: "Foundations of Computer Science", courseCode: "COP 3014", courseCredits: 3, courseCoreqs: ["COP 3014L"], coursePreRegs: ["COP 2220 with a grade of C or better."], courseDescription: "Builds programming skills with an emphasis on disciplined program design and coding. Introduction to object-based programming concepts including class design and implementation. Programming in C++.", isGordonRule: false))
       
        courses.append(CWCourse(courseName: "Foundations of Computer Science Lab", courseCode: "COP 3014L", courseCredits: 1, courseCoreqs: ["COP 3014"], coursePreRegs: ["COP 2220 with a grade of C or better"], courseDescription: "Laboratory experiments and exercises in Computer Science will be done. Students will learn to use Unix.", isGordonRule: false))
        
        courses.append(CWCourse(courseName: "Introduction to Logic Design", courseCode: "CDA 3201C", courseCredits: 4, courseCoreqs: ["COP 2220"], coursePreRegs: ["COP 2220"], courseDescription: "Fundamentals of logic design, Boolean algebra, simplification of Boolean expressions, design of combinational circuits, design with SSI and MSI logic ICs including PLDs. Flip flops, analysis and synthesis of sequential circuits, design with MSI and LSI logic ICS. Training kits will be used in the lab to build logic circuits.", isGordonRule: false))
       
        courses.append(CWCourse(courseName: "Discrete Mathematics", courseCode: "MAD 2104", courseCredits: 3, courseCoreqs: ["None"], coursePreRegs: ["MAC 1105 or higher"], courseDescription: "A proof-oriented approach to and applications of propositional logic, sets, functions, relations, combinatorics, graphs and trees.", isGordonRule: false))
        
        return CWFlightPlan(classStanding: classStandings.Freshman.rawValue, courses: courses)
    }
    
    
//    private class func computerScienceSophmore() -> CWFlightPlan {
//        var courses = [CWCourse]()
//        
//        courses.append(CWCourse(courseName: "Physics 1", courseCode: "PHY 2048", courseCredits: 4, coursePreRegs: ["MAC 2311", "MAC 2312"], courseCompletion: false))
//        courses.append(CWCourse(courseName: "Physics 1 Lab", courseCode: "PHY 2048L", courseCredits: 1, coursePreRegs: ["PHY 2048"], courseCompletion: false))
//        courses.append(CWCourse(courseName: "Data Structures & Algorithm Analysis", courseCode: "COP 3530", courseCredits: 3, coursePreRegs: ["COP 3014", "MAD 2104"], courseCompletion: false))
//        courses.append(CWCourse(courseName: "Foundations in Global Citizenship", courseCode: "IFP", courseCredits: 3, coursePreRegs: ["None"], courseCompletion: false))
//        courses.append(CWCourse(courseName: "Foundations of Humanities", courseCode: "IFP", courseCredits: 3, coursePreRegs: ["None"], courseCompletion: false))
//        courses.append(CWCourse(courseName: "Physics 2", courseCode: "PHY 2049", courseCredits: 4, coursePreRegs: ["PHY 2048"], courseCompletion: false))
//        courses.append(CWCourse(courseName: "Physics 2 Lab", courseCode: "PHY 2049L", courseCredits: 1, coursePreRegs: ["PHY 2048L"], courseCompletion: false))
//        courses.append(CWCourse(courseName: "Public Speaking", courseCode: "SPC 2608", courseCredits: 3, coursePreRegs: ["None"], courseCompletion: false))
//        courses.append(CWCourse(courseName: "Intro to Internet Computing", courseCode: "COP 3813", courseCredits: 3, coursePreRegs: ["COP 3014"], courseCompletion: false))
//        courses.append(CWCourse(courseName: "Introduction to Microprocessor Systems", courseCode: "CDA 3331C", courseCredits: 4, coursePreRegs: ["CDA 3201C"], courseCompletion: false))
//        
//        return CWFlightPlan(classStanding: classStandings.Sophmore.rawValue, courses: courses)
//    }
//    
//    private class func computerScienceJunior() -> CWFlightPlan {
//        var courses = [CWCourse]()
//        
//        courses.append(CWCourse(courseName: "Foreign Language 1", courseCode: "Language", courseCredits: 4, coursePreRegs: ["None"], courseCompletion: false))
//        courses.append(CWCourse(courseName: "Computer Operating Systems", courseCode: "COP 4610", courseCredits: 3, coursePreRegs: ["COP 3530", "CDA 3331C"], courseCompletion: false))
//        courses.append(CWCourse(courseName: "2nd Programming Language", courseCode: "CS Elective", courseCredits: 3, coursePreRegs: ["COP 3530"], courseCompletion: false))
//        courses.append(CWCourse(courseName: "Mathematics Elective", courseCode: "Math Elective", courseCredits: 4, coursePreRegs: ["MAC 2311", "MAC 2312"], courseCompletion: false))
//        courses.append(CWCourse(courseName: "Foreign Language 2", courseCode: "Language", courseCredits: 4, coursePreRegs: ["Foreign Lanuage 1"], courseCompletion: false))
//        courses.append(CWCourse(courseName: "Design & Analysis of Algorithms", courseCode: "COT 4400", courseCredits: 3, coursePreRegs: ["COP 3530"], courseCompletion: false))
//        courses.append(CWCourse(courseName: "Formal Languages & Automata Theory", courseCode: "COT 4420", courseCredits: 3, coursePreRegs: ["COP 3530"], courseCompletion: false))
//        courses.append(CWCourse(courseName: "Stochastic Models for Computer Science", courseCode: "STA 4821", courseCredits: 3, coursePreRegs: ["MAC 2311", "MAC 2312"], courseCompletion: false))
//        
//        return CWFlightPlan(classStanding: classStandings.Junior.rawValue, courses: courses)
//    }
//    
//    private class func computerScienceSenior() -> CWFlightPlan {
//        var courses = [CWCourse]()
//        
//        courses.append(CWCourse(courseName: "Computer Science Elective", courseCode: "CS Elective", courseCredits: 3, coursePreRegs: ["COP 3530"], courseCompletion: false))
//        courses.append(CWCourse(courseName: "Introduction to Database Structures", courseCode: "COP 3540", courseCredits: 3, coursePreRegs: ["COP 3530"], courseCompletion: false))
//        courses.append(CWCourse(courseName: "Principles of Software Engineering", courseCode: "CEN 4010", courseCredits: 3, coursePreRegs: ["COP 3530"], courseCompletion: false))
//        courses.append(CWCourse(courseName: "Additional Science Course", courseCode: "Science", courseCredits: 4, coursePreRegs: ["None"], courseCompletion: false))
//        courses.append(CWCourse(courseName: "Computer Science Elective", courseCode: "CS Elective", courseCredits: 3, coursePreRegs: ["COP 3530"], courseCompletion: false))
//        courses.append(CWCourse(courseName: "Senior Seminar", courseCode: "COT 4935", courseCredits: 1, coursePreRegs: ["Senior Standing"], courseCompletion: false))
//        courses.append(CWCourse(courseName: "Free Electives", courseCode:"Electives", courseCredits: 8, coursePreRegs: ["None"], courseCompletion: false))
//        
//        return CWFlightPlan(classStanding: classStandings.Senior.rawValue, courses: courses)
//    }

}

//// Computer Engineering Flight Plan
//
//extension CWFlightPlan {
//    private class func computerEngineeringFreshman() -> CWFlightPlan {
//        var courses = [CWCourse]()
//        
//        courses.append(CWCourse(courseName: "Calculus w/ Analytical Geometry 1", courseCode: "MAC 2311", courseCredits: 4, coursePreRegs: ["MAC 1114", "MAC 1140"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "College Writing 1", courseCode: "ENC 1101", courseCredits: 3, coursePreRegs: ["None"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Introduction to Programming in C", courseCode: "COP 2220", courseCredits: 3, coursePreRegs: ["None"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Foundations of Society & Human Behavior", courseCode: "IFP", courseCredits: 3, coursePreRegs: ["None"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Fundamentals of Engineering", courseCode: "ENG 1002", courseCredits: 3, coursePreRegs: ["None"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Calculus w/ Analytical Geometry 2", courseCode: "MAC 2312", courseCredits: 4, coursePreRegs: ["MAC 2311"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "College Writing 2", courseCode: "ENC 1102", courseCredits: 3, coursePreRegs: ["END 1101"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Foundations of Computer Science", courseCode: "COP 3014", courseCredits: 3, coursePreRegs: ["COP 2220"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Foundations of Computer Science Lab", courseCode: "COP 3014L", courseCredits: 1, coursePreRegs: ["COP 3014"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Foundations of Society & Human Behavior", courseCode: "IFP", courseCredits: 3, coursePreRegs: ["None"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Introduction to Logic Design", courseCode: "CDA 3201C", courseCredits: 4, coursePreRegs: ["COP 2220"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Discrete Mathematics", courseCode: "MAD 2104", courseCredits: 3, coursePreRegs: ["MAC 033"], courseCompletion: false))
//        
//        return CWFlightPlan(classStanding: classStandings.Freshman.rawValue, courses: courses)
//    }
//    
//    private class func computerEngineeringSophmore() -> CWFlightPlan {
//        var courses = [CWCourse]()
//        
//        courses.append(CWCourse(courseName: "Physics 1", courseCode: "PHY 2048", courseCredits: 4, coursePreRegs: ["MAC 2311", "MAC 2312"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Physics 1 Lab", courseCode: "PHY 2048L", courseCredits: 1, coursePreRegs: ["PHY 2048"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Data Structures & Algorithm Analysis", courseCode: "COP 3530", courseCredits: 3, coursePreRegs: ["COP 3014", "MAD 2104"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Introduction to Microprocessors", courseCode: "CDA 3331C", courseCredits: 4, coursePreRegs: ["CDA 3201C"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Foundations in Global Citizenship", courseCode: "IFP", courseCredits: 3, coursePreRegs: ["None"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Physics 2", courseCode: "PHY 2049", courseCredits: 4, coursePreRegs: ["PHY 2048"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Physics 2 Lab", courseCode: "PHY 2049L", courseCredits: 1, coursePreRegs: ["PHY 2048L"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "1 Semi Core/Technical Elective", courseCode: "SC/TE", courseCredits: 3, coursePreRegs: ["CDA 3331C"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Calculus w/ Analytical Geometry 3", courseCode: "MAC 2313", courseCredits: 4, coursePreRegs: ["MAC 2312"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Computer Operating Systems", courseCode: "COP 4610", courseCredits: 3, coursePreRegs: ["COP 3530", "CDA 3331C"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Foundations of Humanities", courseCode: "IFP", courseCredits: 3, coursePreRegs: ["None"], courseCompletion: false))
//        
//        return CWFlightPlan(classStanding: classStandings.Sophmore.rawValue, courses: courses)
//    }
//    
//    private class func computerEngineeringJunior() -> CWFlightPlan {
//        var courses = [CWCourse]()
//        
//        courses.append(CWCourse(courseName: "General Chemistry 1", courseCode: "CHM 2045", courseCredits: 3, coursePreRegs: ["None"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "General Chemistry 1 Lab", courseCode: "CHM 2045L", courseCredits: 1, coursePreRegs: ["None"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "1 Semi Core/Technical Elective", courseCode: "SC/TE", courseCredits: 3, coursePreRegs: ["None"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Differential Equations/Engineering Mathematics 1", courseCode: "MAP 2302/MAP 3305", courseCredits: 3, coursePreRegs: ["MAC 2313"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "1 Semi Core/Technical Elective", courseCode: "SC/TE", courseCredits: 3, coursePreRegs: ["CDA 3331C"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "1 Semi Core/Technical Elective", courseCode: "SC/TE", courseCredits: 3, coursePreRegs: ["CDA 3331C"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Circuits 1", courseCode: "EEL 3111", courseCredits: 3, coursePreRegs: ["MAP 2302", "MAP 3305"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Principles of Software Engineering", courseCode: "CEN 4010", courseCredits: 3, coursePreRegs: ["COP 3530"], courseCompletion: false))
//        
//        return CWFlightPlan(classStanding: classStandings.Junior.rawValue, courses: courses)
//    }
//    
//    private class func computerEngineeringSenior() -> CWFlightPlan {
//        var courses = [CWCourse]()
//        
//        courses.append(CWCourse(courseName: "Electronics 1", courseCode: "EEE 3000", courseCredits: 4, coursePreRegs: ["EEL 3111"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Laboratory 1", courseCode: "EEL 3118L", courseCredits: 2, coursePreRegs: ["EEE 3000"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Engineering Design 1", courseCode: "EGN 4950C", courseCredits: 3, coursePreRegs: ["CDA 3331C", "EEL 3118L"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "1 Semi Core/Technical Elective", courseCode: "SC/TE", courseCredits: 3, coursePreRegs: ["CDA 3331C"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Stochastic Models for Computer Science", courseCode: "STA 4821", courseCredits: 3, coursePreRegs: ["MAC 2313"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Engineering Design 2", courseCode: "EGN 4952C", courseCredits: 3, coursePreRegs: ["EGN 4950C"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Senior Seminar", courseCode: "COT 4935", courseCredits: 1, coursePreRegs: ["Senior Standing"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "1 Semi Core/Technical Elective", courseCode: "SC/TE", courseCredits: 3, coursePreRegs: ["CDA 3331C"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "1 Semi Core/Technical Elective", courseCode: "SC/TE", courseCredits: 3, coursePreRegs: ["CDA 3331C"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "1 Semi Core/Technical Elective", courseCode: "SC/TE", courseCredits: 3, coursePreRegs: ["CDA 3331C"], courseCompletion: false))
//        
//        return CWFlightPlan(classStanding: classStandings.Senior.rawValue, courses: courses)
//    }
//
//}
//
//// MARK: Ocean Engineering
//
//extension CWFlightPlan {
//    
//    private class func oceanEngineeringFreshman() -> CWFlightPlan {
//        var courses = [CWCourse]()
//        
//        courses.append(CWCourse(courseName: "Calculus w/ Analytical Geometry 1", courseCode: "MAC 2311", courseCredits: 4, coursePreRegs: ["MAC 1114", "MAC 1140"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "College Writing 1", courseCode: "ENC 1101", courseCredits: 3, coursePreRegs: ["None"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "General Chemistry 1", courseCode: "CHM 2045", courseCredits: 3, coursePreRegs: ["None"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "General Chemistry 1 Lab", courseCode: "CHM 2045L", courseCredits: 1, coursePreRegs: ["CHM 2045"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Fundamentals of Engineering", courseCode: "EGN 1002", courseCredits: 3, coursePreRegs: ["None"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "College Writing 2", courseCode: "ENC 1102", courseCredits: 3, coursePreRegs: ["ENC 1101"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Calculus w/ Analytical Geometry 2", courseCode: "MAC 2312", courseCredits: 4, coursePreRegs: ["MAC 2311"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Physics 1", courseCode: "PHY 2048", courseCredits: 4, coursePreRegs: ["MAC 2312"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Physics 1 Lab", courseCode: "PHY 2048L", courseCredits: 1, coursePreRegs: ["PHY 2048"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Oceanography", courseCode: "OCE 3008", courseCredits: 3, coursePreRegs: ["CHM 2045"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Calculus w/ Analytical Geometry 3", courseCode: "MAC 2313", courseCredits: 4, coursePreRegs: ["MAC 2312"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "C for Engineers", courseCode: "EEL 2161", courseCredits: 3, coursePreRegs: ["None"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Foundations of Humanities", courseCode: "IFP", courseCredits: 3, coursePreRegs: ["None"], courseCompletion: false))
//    
//        return CWFlightPlan(classStanding: classStandings.Freshman.rawValue, courses: courses)
//    }
//    
//    private class func oceanEngineeringSophmore() -> CWFlightPlan {
//        var courses = [CWCourse]()
//        
//        courses.append(CWCourse(courseName: "Engineering Math 1", courseCode: "MAP 3305", courseCredits: 3, coursePreRegs: ["MAC 2313"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Physics for Engineers 2", courseCode: "PHY 2044", courseCredits: 3, coursePreRegs: ["PHY 2048"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Physics for Engineers 2 Lab", courseCode: "PHY 2044L", courseCredits: 1, coursePreRegs: ["PHY 2048L", "PHY 2044"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Statics", courseCode: "EGN 3311", courseCredits: 3, coursePreRegs: ["MAC 2312", "PHY 2048"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Engineering Graphics", courseCode: "EGN 1111C", courseCredits: 3, coursePreRegs: ["None"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Introduction to Logic Design", courseCode: "CDA 3201C", courseCredits: 4, coursePreRegs: ["EEL 2161"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Dynamics", courseCode: "EGN 3321", courseCredits: 3, coursePreRegs: ["EGN 3311"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Engineering Thermodynamics", courseCode: "EGN 3343", courseCredits: 3, coursePreRegs: ["MAC 2313", "PHY 2043"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Eng. Math 2 / Computer Applications 2", courseCode: "MAP 4306 / EML 4534", courseCredits: 3, coursePreRegs: ["MAP 3305"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Circuits", courseCode: "EEL 3111", courseCredits: 3, coursePreRegs: ["MAC 2313", "PHY 2049"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Strength of Materials", courseCode: "EGN 3331", courseCredits: 3, coursePreRegs: ["EGN 3311"], courseCompletion: false))
//        
//        return CWFlightPlan(classStanding: classStandings.Sophmore.rawValue, courses: courses)
//    }
//    
//    private class func oceanEngineeringJunior() -> CWFlightPlan {
//        var courses = [CWCourse]()
//        
//        courses.append(CWCourse(courseName: "Electro-Mechanical Devices", courseCode: "EGM 4045", courseCredits: 3, coursePreRegs: ["PHY 2044", "MAP 3305"], courseCompletion: false))
//        
//        courses.append(CWCourse(courseName: "Ocean Engineering Lab", courseCode: "EOC 3130L", courseCredits: 3, coursePreRegs: ["CHM 2045", "PHY 2044", "EEL 2161"], courseCompletion: false))
//        
//        return CWFlightPlan(classStanding: classStandings.Junior.rawValue, courses: courses)
//    }



