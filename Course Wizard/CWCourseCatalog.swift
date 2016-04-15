//
//  CWCourseCatalog.swift
//  Course Wizard
//
//  Created by Daniel Marquez on 4/7/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import Foundation

class CWCourseCatalog {
    
    private var crnCatalog = [String:CWCourse]()
    private var courseCatalog = [String:String]()
    
    init() {
        crnCatalog["MAC2311"] = CWCourse(courseName: "Calculus w/ Analytical Geometry 1", courseCode: "MAC 2311", courseCredits: 4, courseCoreqs: ["None"],  coursePreRegs: ["MAC 1114", "MAC 1140"], courseDescription: "Continuity, differentiability, differential approximation, optimization and curve sketching of functions and inverse functions of a single variable, including treatment of trigonometric functions. Mean value theorem and L'Hopital's Rule. Introduction to integration.", isGordonRule: true)
        courseCatalog["Calculus w/ Analytical Geometry 1"] = "MAC2311"
        
        crnCatalog["ENC1101"] = CWCourse(courseName: "College Writing 1", courseCode:"ENC 1101" , courseCredits: 3, courseCoreqs: ["None"], coursePreRegs: ["None"], courseDescription: "Reading examples of effective expository prose and writing essays practicing the forms of rhetoric.", isGordonRule: true)
        courseCatalog["College Writing 1"] = "ENC1101"
        
        crnCatalog["COP2220"] = CWCourse(courseName: "Introduction to Programming in C", courseCode: "COP 2220", courseCredits: 3, courseCoreqs: ["CDA 3201C"], coursePreRegs: ["None"], courseDescription: "Introduction to programming in C. Variable types, arithmetic statements, input/output statements, loops, conditional statements, functions, arrays and structures. Programming projects in C.", isGordonRule: false)
        courseCatalog["Introduction to Programming in C"] = "COP2220"
        
        //GROUP
        crnCatalog["IFP"] = CWCourse(courseName: "Foundations of Society & Human Behavior", courseCode: "IFP", courseCredits: 3, courseCoreqs: ["None"], coursePreRegs: ["None"], courseDescription: "Courses in this area examine the forces that shape human behavior and societies. The disciplines represented in this foundation area study individuals, groups, societies, cultures, markets and nations. Their scope is broad: the formation of attitudes; how institutions develop, function and change; the forces that transform society and social institutions; how societies change the environment and respond to environmental change; the relationships between individuals and society; and the scope and complexity of systems of race, ethnicity, gender, sexuality and social class.", isGordonRule: true)
        courseCatalog["Foundations of Society & Human Behavior"] = "IFP"
        
        crnCatalog["MAC2312"] = CWCourse(courseName: "Calculus w/ Analytical Geometry 2", courseCode: "MAC 2312", courseCredits: 4, courseCoreqs: ["None"], coursePreRegs: ["MAC 2311"], courseDescription: "Continuation of MAC 2311. Logarithmic, Exponential, hyperbolic, and inverse trigonometric functions, techniques of integration, partial fractions, area, trapezoid and Simpson's rules, volume, work; analytic geometry; Taylor approximations; sequences and series; polar representation of complex numbers.", isGordonRule: true)
        courseCatalog["Calculus w/ Analytical Geometry 2"] = "MAC2312"
        
        crnCatalog["ENC1102"] = CWCourse(courseName: "College Writing 2", courseCode: "ENC 1102", courseCredits: 3, courseCoreqs: ["None"], coursePreRegs: ["ENC 1101 with a grade of C or better."], courseDescription: "A continuation of College Writing 1.", isGordonRule: true)
        courseCatalog["College Writing 2"] = "ENC1102"
        
        crnCatalog["COP3014"] = CWCourse(courseName: "Foundations of Computer Science", courseCode: "COP 3014", courseCredits: 3, courseCoreqs: ["COP 3014L"], coursePreRegs: ["COP 2220 with a grade of C or better."], courseDescription: "Builds programming skills with an emphasis on disciplined program design and coding. Introduction to object-based programming concepts including class design and implementation. Programming in C++.", isGordonRule: false)
        courseCatalog["Foundations of Computer Science"] = "COP3014"
        
        crnCatalog["COP3014L"] = CWCourse(courseName: "Foundations of Computer Science Lab", courseCode: "COP 3014L", courseCredits: 1, courseCoreqs: ["COP 3014"], coursePreRegs: ["COP 2220 with a grade of C or better"], courseDescription: "Laboratory experiments and exercises in Computer Science will be done. Students will learn to use Unix.", isGordonRule: false)
        courseCatalog["Foundations of Computer Science Lab"] = "COP2014L"
        
        crnCatalog["CDA3210C"] = CWCourse(courseName: "Introduction to Logic Design", courseCode: "CDA 3201C", courseCredits: 4, courseCoreqs: ["COP 2220"], coursePreRegs: ["COP 2220"], courseDescription: "Fundamentals of logic design, Boolean algebra, simplification of Boolean expressions, design of combinational circuits, design with SSI and MSI logic ICs including PLDs. Flip flops, analysis and synthesis of sequential circuits, design with MSI and LSI logic ICS. Training kits will be used in the lab to build logic circuits.", isGordonRule: false)
        courseCatalog["Introduction to Logic Design"] = "CDA3210C"
        
        crnCatalog["MAD2104"] = CWCourse(courseName: "Discrete Mathematics", courseCode: "MAD 2104", courseCredits: 3, courseCoreqs: ["None"], coursePreRegs: ["MAC 1105 or higher"], courseDescription: "A proof-oriented approach to and applications of propositional logic, sets, functions, relations, combinatorics, graphs and trees.", isGordonRule: false)
        courseCatalog["Discrete Mathematics"] = "MAD2104"
    }
    
    func getCourse(courseCode: String) -> CWCourse? {
        let searchedCourse = crnCatalog[courseCode]
        if searchedCourse != nil {
            return searchedCourse
        } else {
            let secondSearch = courseCatalog[courseCode]
            if secondSearch != nil {
                return crnCatalog[secondSearch!]
            } else {
               return nil
            }
        }
    }
    
    func getCourseFromTitle(title: String) -> CWCourse? {
        if let searchedTitle = courseCatalog[title] {
            return crnCatalog[searchedTitle]
        } else {
            return nil
        }
    }
    
    func getAllTitles() -> [String] {
        var titles = [String]()
        for title in courseCatalog {
            titles.append(title.0)
        }
        return titles
    }
    
    func getAllCourses() -> [CWCourse] {
        var courses = [CWCourse]()
        for course in crnCatalog {
            courses.append(course.1)
        }
        return courses
    }
}
