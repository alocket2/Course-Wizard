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
        
        crnCatalog["CAP4028"] = CWCourse(
            courseName: "Introduction to Game Programming",
            courseCode: "CAP 4028",
            courseCredits: 3,
            courseCoreqs: ["None"],
            coursePreRegs: ["COP 3530"],
            courseDescription: "Introduction to designing and building video games using high level programming languages and animation libraries. The techniques learned can be applied to simulations, instrumentation, and educational software and other software applications that require dynamic high speed interactive displays of graphic objects.",
            isGordonRule: true)
        
        
        
        crnCatalog["CAP4034"] = CWCourse(
            courseName: "Computer Animation",
            courseCode: "CAP 4034",
            courseCredits: 3,
            courseCoreqs: ["None"],
            coursePreRegs: ["None"],
            courseDescription: "Course includes basic animation concepts, principles of animation, storyboarding, character development, animation rendering, and design. Also, 2D animations for use in practical applications are developed. Basic 3D modeling, rendering, animation techniques, and common algorithms used to create computer animation are introduced.",
            isGordonRule: true)
        
        
        
        crnCatalog["CAP4401"] = CWCourse(
            courseName: "Digital Image Processing",
            courseCode: "CAP 4401",
            courseCredits: 3,
            courseCoreqs: ["None"],
            coursePreRegs: ["STA 4821", "COP 3530"],
            courseDescription: "Introduction to digitial image processing principles, tools and algorithms. Includes topics in image representation, encoding and analysis, such as filtering, transformation, segmentation, feature extraction and pattern recognition. Use of image processing software tools for lab assignments and projects.",
            isGordonRule: true)
        
        
        
        crnCatalog["CAP4630"] = CWCourse(
            courseName: "Introduction to Artificial Intelligence",
            courseCode: "CAP 4630",
            courseCredits: 3,
            courseCoreqs: ["None"],
            coursePreRegs: ["COP 3530", "or", "ISM 4234"],
            courseDescription: "A broad introduction to the core concepts of artificial intelligence, including knowledge representation, search techniques, heuristics and deduction. Programming in Lisp and possibly other software environments.",
            isGordonRule: true)
        
        
        
        crnCatalog["CAP4730"] = CWCourse(
            courseName: "Computer Graphics Methods",
            courseCode: "CAP 4730",
            courseCredits: 3,
            courseCoreqs: ["None"],
            coursePreRegs: ["COP 3530", "or", "(ISM 4234 and MAD 2104)"],
            courseDescription: "An introduction to the methods of computer graphics, including transformation, clipping, curves and surfaces, perspective, hidden lines, shading, animation, and peripheral graphics equipment.",
            isGordonRule: true)
        
        
        
        crnCatalog["CAP4770"] = CWCourse(
            courseName: "Introduction to Data Mining and Machine Intelligence",
            courseCode: "CAP 4770",
            courseCredits: 3,
            courseCoreqs: ["None"],
            coursePreRegs: ["COP 3530", "STA 4821"],
            courseDescription: "This course deals with the principles of data mining. Topics include machine learning methods, knowledge discovery and representation, classification and prediction models.",
            isGordonRule: true)
        
        
        
        crnCatalog["CAP4833"] = CWCourse(
            courseName: "Modeling and Simulation of Systems",
            courseCode: "CAP 4833",
            courseCredits: 3,
            courseCoreqs: ["None"],
            coursePreRegs: ["COP 3014", "COP 3014L", "STA 4821"],
            courseDescription: "Extending the classical world views of computer simulation with object-oriented programming and analysis. Examples from computer systems, ecology, service and manufacturing systems.",
            isGordonRule: true)
        
        
        
        
        crnCatalog["CDA3201C"] = CWCourse(
            courseName: "Introduction to Logic Design",
            courseCode: "CDA 3201C",
            courseCredits: 4,
            courseCoreqs: ["COP 2220"],
            coursePreRegs: ["COP 2220"],
            courseDescription: "Fundamentals of logic design, Boolean algebra, simplification of Boolean expressions, design of combinational circuits, design with SSI and MSI logic ICs including PLDs. Flip flops, analysis and synthesis of sequential circuits, design with MSI and LSI logic ICS. Training kits will be used in the lab to build logic circuits.",
            isGordonRule: true)
        
        
        
        crnCatalog["CDA3331C"] = CWCourse(
            courseName: "Introduction to Microprocessor Systems",
            courseCode: "CDA 3331C",
            courseCredits: 4,
            courseCoreqs: ["None"],
            coursePreRegs: ["COP 2220", "CDA 3201C"],
            courseDescription: "Architecture of a 32-bit microprocessor, addressing modes, instruction set, assembly language programming, program design, hardware model, exception handling and interface to memory and peripherals. Training kits will be used in the lab to run assembly programs.",
            isGordonRule: true)
        
        
        
        
        crnCatalog["CDA4102"] = CWCourse(
            courseName: "Structured Computer Architecture",
            courseCode: "CDA 4102",
            courseCredits: 3,
            courseCoreqs: ["None"],
            coursePreRegs: ["CDA 3201C"],
            courseDescription: "A multilevel approach to computer architecture: microarchitecture level, instruction set architecture level, and operating system level. Introduction to parallel computer architectures.",
            isGordonRule: true)
        
        
        
        crnCatalog["CDA4204"] = CWCourse(
            courseName: "CAD-Based Computer Design",
            courseCode: "CDA 4204",
            courseCredits: 3,
            courseCoreqs: ["CDA 3331C"],
            coursePreRegs: ["CDA 3201C", "CDA 3331C"],
            courseDescription: "Use of Verilog hardware description language for hierarchical behavioral level design of a CPU using current industry standards and design methodologies. Techniques for performance enhancement.",
            isGordonRule: true)
        
        
        
        crnCatalog["CDA4210"] = CWCourse(
            courseName: "Introduction to VLSI",
            courseCode: "CDA 4210",
            courseCredits: 3,
            courseCoreqs: ["None"],
            coursePreRegs: ["CDA 3201C", "EEE 3300", "or", "permission of instructor"],
            courseDescription: "Exposes students to digital VLSI design and simulation tools with simple examples. Use of commercial state-of-the-art industrial CAD/CAE tools.",
            isGordonRule: true)
        
        
        
        crnCatalog["CDA4630"] = CWCourse(
            courseName: "Introduction to Embedded System Design",
            courseCode: "CDA 4630",
            courseCredits: 3,
            courseCoreqs: ["None"],
            coursePreRegs: ["CDA 3331C"],
            courseDescription: "Unified system approach to integrate hardware and software of a state-of-the-art, real-time embedded system. Topics include an overview of high-level modeling of and design with application specific and general purpose processors, peripherals, memory, communication and protocols. Concepts include concurrent processing, real-time, control, and finite state machines in embedded systems.",
            isGordonRule: true)
        
        
        
        crnCatalog["CEN4010"] = CWCourse(
            courseName: "Principles of Software Engineering",
            courseCode: "CEN 4010",
            courseCredits: 3,
            courseCoreqs: ["None"],
            coursePreRegs: ["COP 3530"],
            courseDescription: "An introduction to the basic principles and practices of software engineering. Exposes students to a wide range of software engineering concepts and state-of-the-art technologies. Emphasis is placed on learning and practicing software engineering principles through team course project and gaining appreciation of ìprogramming in the large.î Topics include both technical aspects and non-technical aspects of software engineering, such as software life cycle models, specification and design methods, implementation and testing issues, deployment and post maintenance. Students are required to complete a team project involving written and oral presentations and demonstrations.",
            isGordonRule: true)
        
        
        
        crnCatalog["CEN4214"] = CWCourse(
            courseName: "Software-Hardware Codesign",
            courseCode: "CEN 4214",
            courseCredits: 3,
            courseCoreqs: ["None"],
            coursePreRegs: ["Junior or Senior Standing", "microcontrollers", "C/C++"],
            courseDescription: "Unified top-down system and software engineering approaches to integrate hardware and software of a state-of-the-art real-time embedded system.",
            isGordonRule: true)
        
        
        
        
        crnCatalog["CEN4400"] = CWCourse(
            courseName: "Introduction to Computer Systems Performance Evaluation",
            courseCode: "CEN 4400",
            courseCredits: 3,
            courseCoreqs: ["None"],
            coursePreRegs: ["COP 3014", "COP 3014L", "STA 4821"],
            courseDescription: "Principles of the quantitative evaluation techniques for computer system hardware and software, emphasizing the establishment and analysis of performance criteria. Deterministic and stochastic methods will be discussed.",
            isGordonRule: true)
        
        
        
        
        crnCatalog["CEN4910"] = CWCourse(
            courseName: "Software Engineering Project",
            courseCode: "CEN 4910",
            courseCredits: 3,
            courseCoreqs: ["None"],
            coursePreRegs: ["CEN 4010"],
            courseDescription: "Applies software engineering principles and practices taught in CEN 4010. Students work in teams to develop a software system, following a process similar to industry practices coupled with the software engineering method and theory. Students complete a team project involving written and oral presentation and demonstrations.",
            isGordonRule: true)
        
        
        
        
        crnCatalog["CGS1570"] = CWCourse(
            courseName: "Computer Applications 1",
            courseCode: "CGS 1570",
            courseCredits: 3,
            courseCoreqs: ["None"],
            coursePreRegs: ["None"],
            courseDescription: "A distance learning course for non-business, non-engineering and non-computer science majors that covers technology concepts and mastering the use of important computer applications, including word processing, spreadsheets, and presentation applications.",
            isGordonRule: true)
        
        
        
        
        crnCatalog["CGS1571"] = CWCourse(
            courseName: "Computer Applications 2",
            courseCode: "CGS 1571",
            courseCredits: 3,
            courseCoreqs: ["None"],
            coursePreRegs: ["None"],
            courseDescription: "A distance learning course for non-business, non-engineering and non-computer science majors to become proficient in the use of technology and combining computer applications to solve problems in various disciplines. Includes computer networking and Internet and security basics. Also includes advanced features and blending of computer applications, such as word processing, spreadsheets, and database and presentation applications.",
            isGordonRule: true)
        
        
        
        
        crnCatalog["CIS2930"] = CWCourse(
            courseName: "Topics in Computer Science and Engineering",
            courseCode: "CIS 2930",
            courseCredits: 19,
            courseCoreqs: ["None"],
            coursePreRegs: ["None"],
            courseDescription: "Study relating to topics in computer science and computer engineering.",
            isGordonRule: true)
        
        
        
        
        crnCatalog["CNT4104"] = CWCourse(
            courseName: "Introduction to Data Communications",
            courseCode: "CNT 4104",
            courseCredits: 3,
            courseCoreqs: ["None"],
            coursePreRegs: ["COP 3530", "CDA 3331C"],
                courseDescription: "To develop an understanding of the various aspects of data communications and computer networking systems. Topics include data transmission, multiplexing, switching, Ethernet and WiFi, Internet protocols and architecture, Internetworking, transport and application layer protocols.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["CNT4403"] = CWCourse(
                courseName: "Introduction to Data and Network Security",
                courseCode: "CNT 4403",
                courseCredits: 3,
                courseCoreqs: ["None"],
                coursePreRegs: ["COP 4610"],
                courseDescription: "Overview of technical aspects of data security with emphasis on the Internet. Attacks and defenses. The design of secure systems.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["CNT4713"] = CWCourse(
                courseName: "Computer Network Projects",
                courseCode: "CNT 4713",
                courseCredits: 3,
                courseCoreqs: ["None"],
                coursePreRegs: ["COP 3530"],
                courseDescription: "Course provides conceptual and practical understanding of the various aspects of computer networks protocols, technologies, and measurements. Introduction to network programming with emphasis on the TCP/IP protocol suite.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["COP2220"] = CWCourse(
                courseName: "Introduction to Programming in C",
                courseCode: "COP 2220",
                courseCredits: 3,
                courseCoreqs: ["None"],
                coursePreRegs: ["None"],
                courseDescription: "Introduction to programming in C. Variable types, arithmetic statements, input/output statements, loops, conditional statements, functions, arrays and structures. Programming projects in C.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["COP2224"] = CWCourse(
                courseName: "Introduction to Programming in C/C++",
                courseCode: "COP 2224",
                courseCredits: 3,
                courseCoreqs: ["None"],
                coursePreRegs: ["MAC 2312", "or", "MAC 2282"],
                courseDescription: "An introduction to programming in C/C++. Variable types, arithmetic statements, input/output statements, loops, if statements, functions, projects in C/C++.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["COP3014"] = CWCourse(
                courseName: "Foundations of Computer Science",
                courseCode: "COP 3014",
                courseCredits: 3,
                courseCoreqs: ["COP 3014L"],
                coursePreRegs: ["COP 2220 with a C or better"],
                courseDescription: "Builds programming skills with an emphasis on disciplined program design and coding. Introduction to object-based programming concepts including class design and implementation. Programming in C++. Must be taken with COP 3014L.",
                isGordonRule: true)
                
                
                
                
                
                crnCatalog["COP3014L"] = CWCourse(
                courseName: "Foundations of Computer Science",
                courseCode: "COP 3014L",
                courseCredits: 1,
                courseCoreqs: ["COP 3014"],
                coursePreRegs: ["None"],
                courseDescription: "Laboratory experiments and exercises in Computer Science will be done. Students will learn to use Unix. Must be taken with COP 3014.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["COP3530"] = CWCourse(
                courseName: "Data Structures and Algorithm Analysis",
                courseCode: "COP 3530",
                courseCredits: 3,
                courseCoreqs: ["MAD 2104"],
                coursePreRegs: ["MAD 2104", "COP 3014 (with a C or better)", "COP 3014L"],
                courseDescription: "The design, implementation and run-time analysis of important data structures and algorithms. The data structures considered include sorted arrays, linked lists, stacks, queues, and trees. An approach based on abstract data types and classes will be emphasized. The use of recursion for algorithm design. Class design and implementation in C++. Programming assignments in the C++ language.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["COP3540"] = CWCourse(
                courseName: "Introduction to Database Structures",
                courseCode: "COP 3540",
                courseCredits: 3,
                courseCoreqs: ["None"],
                coursePreRegs: ["COP 3530"],
                courseDescription: "An introduction to the design, implementation and use of file managers and relational data base systems. Topics include secondary storage devices, hash and indexed file structures, and the relational data base language SQL. Programming assignments will be done in the C language and in SQL.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["COP3813"] = CWCourse(
                courseName: "Introduction to Database Structures",
                courseCode: "COP 3813",
                courseCredits: 3,
                courseCoreqs: ["None"],
                coursePreRegs: ["COP 3014", "COP 3014L"],
                courseDescription: "This course teaches students how to design web pages and develop websites at the introductory to intermediate level. The course is project oriented. Students are required to finish several Internet-based projects using the tools introduced in class.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["COP4020"] = CWCourse(
                courseName: "Programming Languages",
                courseCode: "COP 4020",
                courseCredits: 3,
                courseCoreqs: ["COT 4420"],
                coursePreRegs: ["COP 3530", "COT 4420"],
                courseDescription: "Covers the fundamental concepts of programming languages by discussing the design issues of the various language constructs, examining the choices for realizing these constructs in some of the most common languages and critically comparing design alternatives. Topics include a wide range of programming paradigms, how different programming languages evolve, the differences in problem domains and language suitability, the basic features of programming language translation and implementation techniques for selected language constructs. Selected programming languages assignments are used to demonstrate the language features learned in class.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["COP4331"] = CWCourse(
                courseName: "Object-Oriented Design and Programming",
                courseCode: "COP 4331",
                courseCredits: 3,
                courseCoreqs: ["None"],
                coursePreRegs: ["COP 3530"],
                courseDescription: "Introduces the Java programming language and the main phases of the object-oriented development process, including requirements analysis, design and implementation. Focuses on object-oriented design principles and covers topics such as UML, design patterns, reflection, serialization, generic types and multithreading. Students collaborate on a software term project that involves the entire development cycle.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["COP4367"] = CWCourse(
                courseName: "Graphical Application Development",
                courseCode: "COP 4367",
                courseCredits: 3,
                courseCoreqs: ["None"],
                coursePreRegs: ["COP 3530 with minimum grade of C"],
                courseDescription: "Development of applications that use graphics to display information and have graphical user interfaces. Bitmap and vector graphics are covered. Applications are web based and standalone. Multithreading and multimedia are also covered. There are individual and group projects.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["COP4593"] = CWCourse(
                courseName: "Component Programming with .NET",
                courseCode: "COP 4593",
                courseCredits: 3,
                courseCoreqs: ["None"],
                coursePreRegs: ["None"],
                courseDescription: "Microsoft .NET is explored as a component-based platform for programming Web and other applications. Emphasis is on the .NET component-based deployment model, the basic .NET programming model that is illustrated by the programming language C#, and on the higher-level programming models provided by ADO.NET and ASP.NET. Credit cannot be given for both COP 4593 and COP 5595.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["COP4604"] = CWCourse(
                courseName: "UNIX System Programming",
                courseCode: "COP 4604",
                courseCredits: 3,
                courseCoreqs: ["None"],
                coursePreRegs: ["COP 4610", "experience using a UNIX operating system"],
                courseDescription: "This is a second computer operating systems course that will give students a closer look at various functions of a computer operating system from a programmer's perspective. To gain insight into the implementation of an operating system, students will be required to do a term project by programming in C at least one of the major functions of an operating system.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["COP4610"] = CWCourse(
                courseName: "Computer Operating Systems",
                courseCode: "COP 4610",
                courseCredits: 3,
                courseCoreqs: ["None"],
                coursePreRegs: ["CDA 3331C", "COP 3530"],
                courseDescription: "An introduction to what makes up a digital computer operating system, includes developing an understanding of interrupts, interrupt handling, processes, process management, file and device management, and other features of control programs. A team design project is required.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["COP4633"] = CWCourse(
                courseName: "Introduction to Java and Concurrency",
                courseCode: "COP 4633",
                courseCredits: 3,
                courseCoreqs: ["None"],
                coursePreRegs: ["Junior standing or higher in engineering", "COP 3530"],
                courseDescription: "This course makes it practical and accessible to learn about concurrency and concurrent programming and to combine theory and practice in one common environment. The course allows students to verify and resolve concurrency issues at a high level of abstraction and implement the same in Java. The first one-third of the semester focuses on Java, object-oriented design and library-based design. The remainder of the course focuses on concurrency issues.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["COP4703"] = CWCourse(
                courseName: "Applied Database Systems",
                courseCode: "COP 4703",
                courseCredits: 3,
                courseCoreqs: ["None"],
                coursePreRegs: ["COP 3540"],
                courseDescription: "Investigation of state-of-the-art facilities provided by object-relational database systems using Oracle as a vehicle. Java and the Java database interface, JDBC, are considered. Also, server-side web programming with dynamic SQL and CGI, PL/SQL, Java servlets, and JavaServer Pages (JSP) are considered. No prior knowledge of Java or web programming is assumed.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["COP4814"] = CWCourse(
                courseName: "Web Services",
                courseCode: "COP 4814",
                courseCredits: 3,
                courseCoreqs: ["None"],
                coursePreRegs: ["COP 3813", "COP 3014"],
                courseDescription: "Introduction to the concept of web services as a new programming model for dynamic application interaction over the web. The class covers how to program web services using standard Java APIs and how to implement, describe, register, discover, invoke, and deploy web services using web services standards, such as SOAP, WSDL, and UDDI.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["COP4854"] = CWCourse(
                courseName: "Cutting-Edge Web Technologies",
                courseCode: "COP 4854",
                courseCredits: 3,
                courseCoreqs: ["None"],
                coursePreRegs: ["COP 3530", "COP 3813"],
                courseDescription: "Hands-on knowledge of the latest web development tools, languages, and models. Students develop projects consisting of innovative web-based solutions. Topics include characteristics and foundations of web-based applications; web development frameworks and best practices; server-side and client-side technologies, languages and libraries; usability and human factors; and content-sharing tools and technologies.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["COT2930"] = CWCourse(
                courseName: "Topics in Computer Science and Engineering",
                courseCode: "COT 2930",
                courseCredits: 19,
                courseCoreqs: ["None"],
                coursePreRegs: ["Permission of instructor"],
                courseDescription: "Study relating to specialized topics.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["COT3930"] = CWCourse(
                courseName: "Topics in Computer Science and Engineering",
                courseCode: "COT 3930",
                courseCredits: 19,
                courseCoreqs: ["None"],
                coursePreRegs: ["Permission of instructor"],
                courseDescription: "Study relating to specialized topics.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["COT3949"] = CWCourse(
                courseName: "Topics in Computer Science and Engineering",
                courseCode: "COT 3949",
                courseCredits: 19,
                courseCoreqs: ["None"],
                coursePreRegs: ["Permission of department"],
                courseDescription: "Study relating to specialized topics.",
                isGordonRule: false)
                
                
                
                
                crnCatalog["COT4400"] = CWCourse(
                courseName: "Design and Analysis of Algorithms",
                courseCode: "COT 4400",
                courseCredits: 3,
                courseCoreqs: ["None"],
                coursePreRegs: ["COP 3530"],
                courseDescription: "Builds upon existing skills in the mathematical analysis of algorithm complexity, including lower bounds, worst-case and average-case behavior. General techniques in algorithm design (such as divide and conquer, greedy and dynamic programming approaches) in the context of problem domains like graph, sorting and optimization problems. Introduction to the topic of NP-complete problems.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["COT4420"] = CWCourse(
                courseName: "Formal Languages and Automata Theory",
                courseCode: "COT 4420",
                courseCredits: 3,
                courseCoreqs: ["None"],
                coursePreRegs: ["COP 3530", "MAD 2104"],
                courseDescription: "An introduction to the formal languages and automata, with emphasis on context-free and regular languages. Topics will include regular grammars, deterministic and non-deterministic finite state machines, parsing algorithms, linear-bounded automata and the use of Turing machines to introduce the P=NP problem.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["COT4900"] = CWCourse(
                courseName: "Directed Independent Study",
                courseCode: "COT 4900",
                courseCredits: 19,
                courseCoreqs: ["None"],
                coursePreRegs: ["Permission of instructor"],
                courseDescription: "Study of topics relating to the special needs and interests of individual students.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["COT4930"] = CWCourse(
                courseName: "Topics in Computer Science and Engineering",
                courseCode: "COT 4930",
                courseCredits: 19,
                courseCoreqs: ["None"],
                coursePreRegs: ["Permission of instructor"],
                courseDescription: "Study relating to specialized topics.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["COT4935"] = CWCourse(
                courseName: "Senior Seminar",
                courseCode: "COT 4935",
                courseCredits: 1,
                courseCoreqs: ["None"],
                coursePreRegs: ["Senior Standing", "open only to Computer Science or Computer Engineering majors"],
                courseDescription: "Study and discussion regarding the social, legal, and ethical aspects of computing.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["MAP4260"] = CWCourse(
                courseName: "Introduction to Queueing Theory",
                courseCode: "MAP 4260",
                courseCredits: 3,
                courseCoreqs: ["None"],
                coursePreRegs: ["STA 4821"],
                courseDescription: "Queueing theory and its application to computer performance evaluation, operating systems analysis, telecommunications, and operations research.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["STA4821"] = CWCourse(
                courseName: "Stochastic Models for Computer Science",
                courseCode: "STA 48211",
                courseCredits: 3,
                courseCoreqs: ["None"],
                coursePreRegs: ["MAC 2312", "or", "MAC 2282"],
                courseDescription: "Basic principles of probability and statistics for modeling and experimentation in computer science. Topics include conditional probability, random variables, distribution and density functions, stochastic processes, queueing theory, the central limit theorem and simulation.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["EGN1002"] = CWCourse(
                courseName: "Fundamentals of Engineering",
                courseCode: "EGN 1002",
                courseCredits: 3,
                courseCoreqs: ["None"],
                coursePreRegs: ["None"],
                courseDescription: "Engineering survival skills: orientation, professionalism, planning, problem solving, creative thinking, software and calculator techniques, time and project management, teaming skills, engineering disciplines, report writing, and technical communications.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["MAC2311"] = CWCourse(
                courseName: "Calculus with Analytic Geometry 1",
                courseCode: "MAC 2311",
                courseCredits: 4,
                courseCoreqs: ["None"],
                coursePreRegs: ["MAC 1147", "or both", "MAC 1140", "and", "MAC 1114" ],
                courseDescription: "Continuity, differentiability, differential approximation, optimization and curve sketching of functions and inverse functions of a single variable, including treatment of trigonometric functions. Mean value theorem and L'Hopital's Rule. Introduction to integration. This is a General Education course.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["MAC2312"] = CWCourse(
                courseName: "Calculus with Analytic Geometry 2",
                courseCode: "MAC 2312",
                courseCredits: 4,
                courseCoreqs: ["None"],
                coursePreRegs: ["MAC 2281", "or", "MAC 2311" ],
                courseDescription: "Continuation of MAC 2311. Logarithmic, Exponential, hyperbolic, and inverse trigonometric functions, techniques of integration, partial fractions, area, trapezoid and Simpson's rules, volume, work; analytic geometry; Taylor approximations; sequences and series; polar representation of complex numbers. This is a General Education course.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["MAC2313"] = CWCourse(
                courseName: "Calculus with Analytic Geometry 3",
                courseCode: "MAC 2313",
                courseCredits: 4,
                courseCoreqs: ["None"],
                coursePreRegs: ["MAC 2282", "or", "MAC 2312" ],
                courseDescription: "Vector space, inner product, length, cross product, curves in space; functions of several variables: differentiability, gradient, tangent planes, differential approximation, surfaces, optimization with constraints, multiple integrals, theorems of Green, Stokes and Gauss.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["MAD2104"] = CWCourse(
                courseName: "Discrete Mathematics",
                courseCode: "MAD 2104",
                courseCredits: 3,
                courseCoreqs: ["None"],
                coursePreRegs: ["MAC 1105 or higher"],
                courseDescription: "A proof-oriented approach to and applications of propositional logic, sets, functions, relations, combinatorics, graphs and trees.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["MAC2281"] = CWCourse(
                courseName: "Calculus for Engineers 1",
                courseCode: "MAC 2281",
                courseCredits: 4,
                courseCoreqs: ["None"],
                coursePreRegs: ["MAC 1147", "or both", "MAC 1140 and Mac1114"],
                courseDescription: "Development of an engineering skill set. Topics include continuity, differentiability, differential approximations, optimization, curve sketching, transcendental and inverse functions, mean value theorem, and L'Hopital's Rule. Introduction to integration.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["MAC2282"] = CWCourse(
                courseName: "Calculus for Engineers 2",
                courseCode: "MAC 2282",
                courseCredits: 4,
                courseCoreqs: ["None"],
                coursePreRegs: ["MAC 2281", "or",  "MAC 2311"],
                courseDescription: "Continuation of MAC 2281; continued development of an engineering skill set. Topics include techniques of integration, partial fractions, area, volume, work, trapezoid, Simpson's Rules, analytic geometry, polar representation of complex numbers, Taylor approximations, sequences, and series",
                isGordonRule: true)
                
                
                
                
                crnCatalog["MAP2302"] = CWCourse(
                courseName: "Differential Equations 1",
                courseCode: "MAP 2302",
                courseCredits: 3,
                courseCoreqs: ["None"],
                coursePreRegs: ["MAC 2282", "or",  "MAC 2312"],
                courseDescription: "An introduction to ordinary differential equations stressing basic techniques and applications.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["MAP3305"] = CWCourse(
                courseName: "Engineering Mathematics 1",
                courseCode: "MAP 3305",
                courseCredits: 3,
                courseCoreqs: ["None"],
                coursePreRegs: ["MAC 2282", "or",  "MAC 2312"],
                courseDescription: "Complex numbers, matrices, determinants, systems of equations, diagonalization, first and second order linear differential equations and systems thereof, including power series solutions.",
                isGordonRule: true)
                
                
                
                
                
                crnCatalog["EGN2095"] = CWCourse(
                courseName: "Engineering Chemistry",
                courseCode: "EGN 2095",
                courseCredits: 3,
                courseCoreqs: ["EGN 2095L"],
                coursePreRegs: ["MAC 1105 with a grade of C or better"],
                courseDescription: "Introduction to fundamental concepts and principles of stoichiometry, kinetics, equilibrium, and organic chemistry most relevant to practical engineering principles. This is a General Education course.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["EGN2095L"] = CWCourse(
                courseName: "Engineering Chemistry",
                courseCode: "EGN 2095L",
                courseCredits: 1,
                courseCoreqs: ["EGN 2095"],
                coursePreRegs: ["MAC 1105 with a grade of C or better"],
                courseDescription: "Introduction to fundamental concepts and principles of stoichiometry, kinetics, equilibrium, and organic chemistry most relevant to practical engineering principles. This is a General Education course.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["PHY2043"] = CWCourse(
                courseName: "Physics for Engineers 1",
                courseCode: "PHY 2043",
                courseCredits: 3,
                courseCoreqs: ["None"],
                coursePreRegs: ["MAC 2311", "or", "MAC 2281"],
                courseDescription: "Intended for engineering major, the course surveys fundamental laws and phenomena of mechanics, fluids, and heat. Emphasis on mathematical analysis of physical problems. This is a General Education course.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["PHY2044"] = CWCourse(
                courseName: "Physics for Engineers 2", 
                courseCode: "PHY 2044", 
                courseCredits: 3, 
                courseCoreqs: ["None"],  
                coursePreRegs: ["(MAC 2311", "or", "MAC 2281)", "and", "PHY 2043"], 
                courseDescription: "Intended for engineering majors, the course surveys fundamental laws and phenomena of electricity, magnetism, and optics. Emphasis on mathematical analysis of physical problems.", 
                isGordonRule: true)
                
                
                
                
                crnCatalog["PHY2048"] = CWCourse(
                courseName: "General Physics 1", 
                courseCode: "PHY 2048", 
                courseCredits: 4, 
                courseCoreqs: ["None"],  
                coursePreRegs: ["(MAC 2311", "or", "MAC 2281)"], 
                courseDescription: "Intended for science majors, the course surveys the fundamental laws and phenomena of mechanics, fluids, heat, wave motion, and sound. Emphasis on mathematical analysis of physical problems. This is a General Education course.", 
                isGordonRule: true)
                
                
                
                
                crnCatalog["PHY2048L"] = CWCourse(
                courseName: "General Physics 1 Laboratory", 
                courseCode: "PHY 2048L", 
                courseCredits: 1, 
                courseCoreqs: ["PHY 2048", "or", "PHY 2053", "or", "PHY 2043"],  
                coursePreRegs: ["None"], 
                courseDescription: "Experiments in mechanics, fluids, heat, wave motion and sound comprise this course. Several classes cover developing theoretical problem solving techniques. This is a General Education course.", 
                isGordonRule: true)
                
                
                
                
                crnCatalog["PHY2049"] = CWCourse(
                courseName: "General Physics 2", 
                courseCode: "PHY 2049", 
                courseCredits: 4, 
                courseCoreqs: ["None"],  
                coursePreRegs: ["PHY 2048", "and", "MAC 2312", "or", "MAC 2282"], 
                courseDescription: "Intended for science majors, the course surveys fundamental laws and phenomena of electricity, magnetism, and optics. Emphasis on mathematical analysis of physical problems.", 
                isGordonRule: true)
                
                
                
                
                crnCatalog["PHY2049L"] = CWCourse(
                courseName: "General Physics 2 Laboratory", 
                courseCode: "PHY 2049L", 
                courseCredits: 1, 
                courseCoreqs: ["PHY 2049", "or", "PHY 2054", "or", "PHY 2044"],  
                coursePreRegs: ["None"], 
                courseDescription: "Experiments in electricity and magnetism, optics, and modern physics comprise this course. Several classes cover developing theoretical problem solving techniques.", 
                isGordonRule: true)
                
                
                
                
                crnCatalog["CHM2045"] = CWCourse(
                courseName: "General Chemistry 1", 
                courseCode: "CHM 2045", 
                courseCredits: 3, 
                courseCoreqs: ["MAC 1105", "or", "MAC 1114", "or", "MAC 1140", "or", "MAC 1147", "or", "MAC 2233", "or", "MAC 2281", "or", "MAC 2311", "and", "CHM 2045L"],  
                coursePreRegs: ["CHM 1025", "or", "MAC 1105", "or", "MAC 1114", "or", "MAC 1140", "or", "MAC 1147", "or", "MAC 2233", "or", "MAC 2281", "or", "MAC 2311"], 
                courseDescription: "An introduction to chemical principles, including atomic structure, chemical bonding, kinetics, thermodynamics and properties of the elements. A prerequisite to all other chemistry courses in science programs. This is a General Education course.", 
                isGordonRule: true)
                
                
                
                
                crnCatalog["CHM2045L"] = CWCourse(
                courseName: "General Chemistry 1 Lab", 
                courseCode: "CHM 2045L", 
                courseCredits: 1, 
                courseCoreqs: ["CHM 2045"],  
                coursePreRegs: ["None"], 
                courseDescription: "An introduction to experimental techniques in chemistry designed to demonstrate basic chemical principles. This is a General Education course.", 
                isGordonRule: true)
                
                
                
                
                crnCatalog["EEE3300"] = CWCourse(
                courseName: "Electronics 1", 
                courseCode: "EEE 3300", 
                courseCredits: 4, 
                courseCoreqs: ["None"],  
                coursePreRegs: ["EEL 3111"], 
                courseDescription: "Introduction to solid state devices (diodes, BJTs, FETs); op-amps, small signal amplifier analysis, large signal analysis. Use of circuit analysis programs (SPICE, etc.).", 
                isGordonRule: true)
                
                
                
                
                crnCatalog["EEL3111"] = CWCourse(
                courseName: "Circuits 1", 
                courseCode: "EEL 3111", 
                courseCredits: 3, 
                courseCoreqs: ["MAC 2312", "and", "MAP 3305"],  
                coursePreRegs: ["(MAC 2312 or MAC 2282)", "and", "(PHY 2049 or PHY 2044)", "with grades of C or better"], 
                courseDescription: "Introductory to electric circuit analysis: passive and active sign conventions; Ohm's and Kirchhoff's laws; network analysis, theorems as applied to d-c and a-c circuits; basic op-amp circuits; single time constant transient analysis; phasor representations and sinusoidal steady state; real and reactive single phase power.", 
                isGordonRule: true)
                
                
                
                
                crnCatalog["EEL3118L"] = CWCourse(
                courseName: "Electronics Labooratory 1", 
                courseCode: "EEL 3118L", 
                courseCredits: 3, 
                courseCoreqs: ["EEE 3300"],  
                coursePreRegs: ["None"], 
                courseDescription: "Introduction to basic electronic test equipment; measurement techniques, experimental analysis and design of linear and non-linear circuits.", 
                isGordonRule: true)
                
                
                
                
                crnCatalog["STA4821"] = CWCourse(
                courseName: "Stochastic Models for Computer Science", 
                courseCode: "STA 4821", 
                courseCredits: 3, 
                courseCoreqs: ["None"],  
                coursePreRegs: ["MAC 2312", "or", "MAC 2282"], 
                courseDescription: "Basic principles of probability and statistics for modeling and experimentation in computer science. Topics include conditional probability, random variables, distribution and density functions, stochastic processes, queueing theory, the central limit theorem and simulation.", 
                isGordonRule: true)
                
                
                
                
                crnCatalog["COT4935"] = CWCourse(
                courseName: "Senior Seminar", 
                courseCode: "COT 4935", 
                courseCredits: 1, 
                courseCoreqs: ["None"],  
                coursePreRegs: ["Senior standing;", "Only open to Computer Science or Computer Engineering majors"], 
                courseDescription: "Study and discussion regarding the social, legal, and ethical aspects of computing.", 
                isGordonRule: true)
                
                
                
                
                crnCatalog["GLY2010C"] = CWCourse(
                courseName: "Physical Geology/Evolution of the Earth", 
                courseCode: "GLY 2010C", 
                courseCredits: 4, 
                courseCoreqs: ["None"],  
                coursePreRegs: ["None"], 
                courseDescription: "Covers environmental and physical geology, how planet Earth works and the role of humans in sustaining the natural environment. Designed to convey the excitement of recent geologic discoveries and evaluate concerns in the news about diminishing resources, natural hazards and the fate of the Earth. Emphasis is on the applications of geology and its influence on contemporary trends in business, education, engineering, social science and the humanities. Slide-illustrated lectures. This is a General Education course.", 
                isGordonRule: true)
                
                
                
                
                crnCatalog["BSC1010"] = CWCourse(
                courseName: "Biological Principles", 
                courseCode: "BSC 1010", 
                courseCredits: 3, 
                courseCoreqs: ["BSC 1010L"],  
                coursePreRegs: ["None"], 
                courseDescription: "A comprehensive treatment of biological principles, including the scientific method, evolution and natural selection, cell biology, energy transformation, reproduction, development, genetics and molecular biology. This is a General Education course.", 
                isGordonRule: true)
                
                
                
                
                crnCatalog["BSC1010L"] = CWCourse(
                courseName: "Biological Principles Lab", 
                courseCode: "BSC 1010L", 
                courseCredits: 1, 
                courseCoreqs: ["BSC 1010"],  
                coursePreRegs: ["None"], 
                courseDescription: "An introduction to general laboratory procedures to demonstrate the basic principle of biology. This is a General Education course.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["SPC2608"] = CWCourse(
                courseName: "Public Speaking", 
                courseCode: "SPC 2608", 
                courseCredits: 3, 
                courseCoreqs: ["None"],  
                coursePreRegs: ["None"], 
                courseDescription: "Theory and practice in the common forms of public address.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["MAD3400"] = CWCourse(
                courseName: "Numerical Methods", 
                courseCode: "MAD 3400", 
                courseCredits: 3, 
                courseCoreqs: ["None"],  
                coursePreRegs: ["MAC 2282 with a C or better", "or", "MAC 2312 with a C or better", "and some programming experience.", "(not available for students with credit for MAD 4401"], 
                courseDescription: "An introductory course in scientific computation for engineering and science students. Topics covered include numerical errors, roots of equations, curve fitting, matrix methods, numerical integration, solution of differential equations and graphic output.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["MAS2103"] = CWCourse(
                courseName: "Matrix Theory", 
                courseCode: "MAS 2103", 
                courseCredits: 3, 
                courseCoreqs: ["None"],  
                coursePreRegs: ["MAC 2233 with a C or better", "or", "MAC 2281 with a C or better", "or", "MAC 2311  with a C or better"], 
                courseDescription: "Vectors and vector spaces. Linear transformation and matrices. Rank and determinants. Systems of linear equations. Diagonalization. Characteristic values.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["MAS4301"] = CWCourse(
                courseName: "Modern Algebra", 
                courseCode: "MAS 4301", 
                courseCredits: 3, 
                courseCoreqs: ["None"],  
                coursePreRegs: ["MAD 2014 with a C or better"], 
                courseDescription: "Elementary number theory. Groups, rings and ideals, polynomials, and fields.",
                isGordonRule: true)
                
                
                
                
                crnCatalog["EGN 4040"] = CWCourse(
                courseName: "Inventive Problem Solving in Engineering", 
                courseCode: "EGN 4040", 
                courseCredits: 3, 
                courseCoreqs: ["None"],  
                coursePreRegs: ["None"], 
                courseDescription: "Common problem-solving methods, followed by an introduction to TRIZ (Russian acronym for systematic inventive thinking); introduction to intellectual property, including patents, copyrights, trademarks, trade secrets and unfair competition.",
                isGordonRule: true)
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
