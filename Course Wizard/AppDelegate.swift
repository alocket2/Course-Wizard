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
            UIApplication.sharedApplication().statusBarStyle = .LightContent
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
        
        let firstPage = OnboardingContentViewController(title: "Semester Tracking", body: "Get insight from current & previous semesters like how many courses you've taken and your gpa", image: UIImage(named: "schoolbag"), buttonText: nil, action: nil)
        let secondPage = OnboardingContentViewController(title: "Course Tracking", body: "Know when and where your classes are", image: UIImage(named: "studying"), buttonText: nil, action: nil)
        let thirdPage = OnboardingContentViewController(title: "Assignment Tracking", body: "Never miss a beat by tracking your assignments including due date reminders and grades.", image: UIImage(named: "document"), buttonText: nil, action: nil)
        let fourthPage = OnboardingContentViewController(title: "Grades & GPA", body: "Start improving your performance with real time grade & gpa tracking.", image: UIImage(named: "a-grade"), buttonText: nil, action: nil)
        let fifthPage = OnboardingContentViewController(title: "Flight Plan", body: "Graduate on time by knowing what classes you've taken and which you still need.", image: UIImage(named: "paperplane"), buttonText: "Get Started") { () -> Void in
            self.setupNormalRootViewController()
        }
        
        //First Page
        firstPage.topPadding = 125.0
        firstPage.underIconPadding = 50.0
        firstPage.titleFontSize = 18.0
        firstPage.titleTextColor = UIColor.whiteColor()
        firstPage.bodyFontSize = 15.0
        firstPage.bodyTextColor = UIColor.whiteColor()
        
        //Second Page
        secondPage.topPadding = 125.0
        secondPage.underIconPadding = 50.0
        secondPage.titleFontSize = 18.0
        secondPage.titleTextColor = UIColor.whiteColor()
        secondPage.bodyFontSize = 15.0
        secondPage.bodyTextColor = UIColor.whiteColor()
        
        //Third Page
        thirdPage.topPadding = 125.0
        thirdPage.underIconPadding = 50.0
        thirdPage.titleFontSize = 18.0
        thirdPage.titleTextColor = UIColor.whiteColor()
        thirdPage.bodyFontSize = 15.0
        thirdPage.bodyTextColor = UIColor.whiteColor()
        
        //Fourth Pages
        fourthPage.topPadding = 125.0
        fourthPage.underIconPadding = 50.0
        fourthPage.titleFontSize = 18.0
        fourthPage.titleTextColor = UIColor.whiteColor()
        fourthPage.bodyFontSize = 15.0
        fourthPage.bodyTextColor = UIColor.whiteColor()
        
        //Fifth Page
        fifthPage.topPadding = 125.0
        fifthPage.underIconPadding = 50.0
        fifthPage.titleFontSize = 18.0
        fifthPage.titleTextColor = UIColor.whiteColor()
        fifthPage.bodyFontSize = 15.0
        fifthPage.bodyTextColor = UIColor.whiteColor()
        fifthPage.buttonFontSize = 15.0
        
        if model == "Simulator" {
            firstPage.underTitlePadding = 50.0
            secondPage.underTitlePadding = 50.0
            thirdPage.underTitlePadding = 50.0
            fourthPage.underTitlePadding = 50.0
            fifthPage.underTitlePadding = 50.0
            fifthPage.bottomPadding = -20.0
        } else if model == "iPhone 6s Plus" {
        }
        
        
        let onboardVC = OnboardingViewController(backgroundImage: UIImage.fromColor(UIColor.walkthroughBackgroundColor()), contents: [firstPage, secondPage, thirdPage, fourthPage, fifthPage])
        
        onboardVC.shouldMaskBackground = false
        onboardVC.shouldFadeTransitions = true
        onboardVC.fadeSkipButtonOnLastPage = true
        onboardVC.fadePageControlOnLastPage = true
        onboardVC.allowSkipping = true
        onboardVC.skipHandler = {
            self.setupNormalRootViewController()
        }
        onboardVC.pageControl.currentPageIndicatorTintColor = UIColor.activePageControlColor()
        onboardVC.pageControl.pageIndicatorTintColor = UIColor.inactivePageControlColor()
        
        if model == "Simulator" {
            onboardVC.underPageControlPadding = 25.0
        } else if model == "iPhone 6" {
            onboardVC.underPageControlPadding = 50.0
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

