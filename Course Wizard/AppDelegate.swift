//
//  AppDelegate.swift
//  Course Wi\zard
//
//  Created by Anthony Lockett
//             Daisy McCoy
//             Daniel Marquez
//             Khalil Millwood
//             Evan Liebovitz
//             Giselle Mohammed
//             Freguens Mildort on 2/28/16.
//  Copyright © 2016 Anthony Lockett & Team. All rights reserved.

import UIKit
import CoreData
import Canvas

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    lazy var coreDataStack = CoreDataStack()
    
    var kUserHasOnboardedKey = "user_has_onboarded"


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        
        let userHasOnboarded = NSUserDefaults.standardUserDefaults().boolForKey(kUserHasOnboardedKey)
        
        if userHasOnboarded {
            self.setupNormalRootViewController()
        } else {
            UIApplication.sharedApplication().statusBarStyle = .Default
            self.window!.rootViewController = self.generateWalkthroughView()
        }
        
        UITabBar.appearance().barTintColor = UIColor.tabBarTintColor()
        UITabBar.appearance().tintColor = UIColor.tabBarItemActiveColor()
        UITabBar.appearance().shadowImage = UIImage()
        
        let barAppearace = UIBarButtonItem.appearance()
        barAppearace.setBackButtonTitlePositionAdjustment(UIOffsetMake(0, -60), forBarMetrics:UIBarMetrics.Default)
        
        UINavigationBar.appearance().barTintColor = UIColor.whiteColor()
        
        UINavigationBar.appearance().tintColor = UIColor.navBarItemActiveColor()
        
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.navBarItemActiveColor()]
        
        if let tab = window?.rootViewController as? UITabBarController {
            for child in tab.viewControllers ?? [] {
                if let child = child as? UINavigationController, top = child.topViewController {
                    if top.respondsToSelector(Selector("setCoreDataStack:")) {
                        top.performSelector(Selector("setCoreDataStack:"), withObject: coreDataStack)
                    }
                }
            }
        }
                
        return true
    }
    
    
    func setupNormalRootViewController() {
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: kUserHasOnboardedKey)
        UIApplication.sharedApplication().statusBarStyle = .Default
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initialViewController = storyboard.instantiateViewControllerWithIdentifier("Overview") as UIViewController!
        self.window?.rootViewController = initialViewController
        self.window?.makeKeyAndVisible()
    }
    
    
    func generateWalkthroughView() -> OnboardingViewController {
        
        
        let model = UIDevice.modelName()
        
        let firstPage = OnboardingContentViewController(title: "Semester Tracking", body: "Get insight from current & previous semesters like how many courses you've taken and your gpa", image: UIImage(named: "semester_wt"), buttonText: nil, action: nil)
        let secondPage = OnboardingContentViewController(title: "Course Tracking", body: "Know whats going on for your classes like reminders, assignments and your current estimated grade.", image: UIImage(named: "Course_WT"), buttonText: nil, action: nil)
        let thirdPage = OnboardingContentViewController(title: "Assignment Tracking", body: "Never miss a beat by tracking your assignments including due date reminders and grades.", image: UIImage(named: "Assignment_WT"), buttonText: nil, action: nil)
        let fourthPage = OnboardingContentViewController(title: "Grades & GPA", body: "Start improving your performance with real time grade & gpa tracking.", image: UIImage(named: "Grades_wt"), buttonText: nil, action: nil)
        let fifthPage = OnboardingContentViewController(title: "Campus Map", body: "Never get lost trying to track down a building with our interactive campus map.", image: UIImage(named: "Map_WT"), buttonText: nil, action: nil)
        let sixthPage = OnboardingContentViewController(title: "Flight Plan", body: "Graduate on time by knowing what classes you've taken and which you still need.", image: UIImage(named: "FlightPlan_WT"), buttonText: nil, action: nil)
        
        if model == "iPhone 5s" || model == "iPhone SE" || model == "Simulator" {
            
            //First Page
            firstPage.topPadding = 35.0
            firstPage.underIconPadding = 5.0
            firstPage.underTitlePadding = 5.0
            firstPage.titleFontSize = 18.0
            firstPage.titleTextColor = UIColor.darkGrayColor()
            firstPage.bodyFontSize = 15.0
            firstPage.bodyTextColor = UIColor.darkGrayColor()
            
            //Second Page
            secondPage.topPadding = 35.0
            secondPage.underIconPadding = 30.0
            secondPage.underTitlePadding = 5.0
            secondPage.titleFontSize = 18.0
            secondPage.titleTextColor = UIColor.darkGrayColor()
            secondPage.bodyFontSize = 15.0
            secondPage.bodyTextColor = UIColor.darkGrayColor()
            
            //Third Page
            thirdPage.topPadding = 35.0
            thirdPage.underIconPadding = 30.0
            thirdPage.underTitlePadding = 5.0
            thirdPage.titleFontSize = 18.0
            thirdPage.titleTextColor = UIColor.darkGrayColor()
            thirdPage.bodyFontSize = 15.0
            thirdPage.bodyTextColor = UIColor.darkGrayColor()
            
            //Fourth Pages
            fourthPage.topPadding = 35.0
            fourthPage.underIconPadding = 5.0
            fourthPage.underTitlePadding = 5.0
            fourthPage.titleFontSize = 18.0
            fourthPage.titleTextColor = UIColor.darkGrayColor()
            fourthPage.bodyFontSize = 15.0
            fourthPage.bodyTextColor = UIColor.darkGrayColor()
            
            //Fifth Page
            fifthPage.topPadding = 35.0
            fifthPage.underIconPadding = 5.0
            fifthPage.underTitlePadding = 5.0
            fifthPage.titleFontSize = 18.0
            fifthPage.titleTextColor = UIColor.darkGrayColor()
            fifthPage.bodyFontSize = 15.0
            fifthPage.bodyTextColor = UIColor.darkGrayColor()
            
            sixthPage.topPadding = 35.0
            sixthPage.underIconPadding = 30.0
            sixthPage.underTitlePadding = 5.0
            sixthPage.titleFontSize = 18.0
            sixthPage.titleTextColor = UIColor.darkGrayColor()
            sixthPage.bodyFontSize = 15.0
            sixthPage.bodyTextColor = UIColor.darkGrayColor()
            
        } else if model == "iPhone 6" || model == "iPhone 6s" {
            
        } else if model == "iPhone 6 Plus" || model == "iPhone 6s Plus" {
            //First Page
            firstPage.topPadding = 85.0
            firstPage.underIconPadding = 25.0
            firstPage.titleFontSize = 18.0
            firstPage.titleTextColor = UIColor.darkGrayColor()
            firstPage.bodyFontSize = 15.0
            firstPage.bodyTextColor = UIColor.darkGrayColor()
            
            //Second Page
            secondPage.topPadding = 85.0
            secondPage.underIconPadding = 50.0
            secondPage.titleFontSize = 18.0
            secondPage.titleTextColor = UIColor.darkGrayColor()
            secondPage.bodyFontSize = 15.0
            secondPage.bodyTextColor = UIColor.darkGrayColor()
            
            //Third Page
            thirdPage.topPadding = 85.0
            thirdPage.underIconPadding = 50.0
            thirdPage.titleFontSize = 18.0
            thirdPage.titleTextColor = UIColor.darkGrayColor()
            thirdPage.bodyFontSize = 15.0
            thirdPage.bodyTextColor = UIColor.darkGrayColor()
            
            //Fourth Pages
            fourthPage.topPadding = 85.0
            fourthPage.underIconPadding = 28.0
            fourthPage.titleFontSize = 18.0
            fourthPage.titleTextColor = UIColor.darkGrayColor()
            fourthPage.bodyFontSize = 15.0
            fourthPage.bodyTextColor = UIColor.darkGrayColor()
            
            //Fifth Page
            fifthPage.topPadding = 85.0
            fifthPage.underIconPadding = 28.0
            fifthPage.titleFontSize = 18.0
            fifthPage.titleTextColor = UIColor.darkGrayColor()
            fifthPage.bodyFontSize = 15.0
            fifthPage.bodyTextColor = UIColor.darkGrayColor()
            fifthPage.buttonFontSize = 15.0
            
            sixthPage.topPadding = 85.0
            sixthPage.underIconPadding = 28.0
            sixthPage.titleFontSize = 18.0
            sixthPage.titleTextColor = UIColor.darkGrayColor()
            sixthPage.bodyFontSize = 15.0
            sixthPage.bodyTextColor = UIColor.darkGrayColor()
            
            if model == "Simulator" {
                firstPage.underTitlePadding = 25.0
                secondPage.underTitlePadding = 25.0
                thirdPage.underTitlePadding = 25.0
                fourthPage.underTitlePadding = 25.0
                fifthPage.underTitlePadding = 25.0
                fifthPage.bottomPadding = -20.0
            }

        }
        
        
        
        
        let onboardVC = OnboardingViewController(backgroundImage: UIImage.fromColor(UIColor.tableviewCellBackgroundColor()), contents: [firstPage, secondPage, thirdPage, fourthPage, fifthPage, sixthPage])
        
        
        
        onboardVC.shouldMaskBackground = false
        onboardVC.shouldFadeTransitions = true
        onboardVC.fadeSkipButtonOnLastPage = false
        onboardVC.fadePageControlOnLastPage = true
        onboardVC.allowSkipping = true
        onboardVC.skipButton.contentHorizontalAlignment = .Center
        onboardVC.skipButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        onboardVC.skipButton.backgroundColor = UIColor.actionBackgroundColor()
        onboardVC.skipHandler = {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewControllerWithIdentifier("gettingStarted")
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
        }
        onboardVC.pageControl.currentPageIndicatorTintColor = UIColor.activePageControlColor()
        onboardVC.pageControl.pageIndicatorTintColor = UIColor.inactivePageControlColor()
        
        if model == "iPhone 5s" || model == "Simulator" {
            onboardVC.underPageControlPadding = 40.0
            onboardVC.skipButton.contentEdgeInsets = UIEdgeInsetsMake(0, 280.0, 0, 0)
        } else if model == "iPhone 6" || model == "iPhone 6s" || model == "Simulator" {
            onboardVC.underPageControlPadding = 50.0
            onboardVC.skipButton.contentEdgeInsets = UIEdgeInsetsMake(0, 220.0, 0, 0)
        } else if model == "iPhone 6 Plus" || model == "iPhone 6s Plus" || model == "Simulator" {
            onboardVC.underPageControlPadding = 50.0
            onboardVC.skipButton.contentEdgeInsets = UIEdgeInsetsMake(0, 180.0, 0, 0)
        }
        
        return onboardVC
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.coreDataStack.saveMainContext()
    }

}

