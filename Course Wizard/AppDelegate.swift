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

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, BWWalkthroughViewControllerDelegate {

    var window: UIWindow?
    lazy var coreDataStack = CoreDataStack()


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if defaults.integerForKey("viewedWalkthrough") == 0 {
            
            let initialViewController = storyboard.instantiateViewControllerWithIdentifier("Walkthrough") as! BWWalkthroughViewController
            let page_one = storyboard.instantiateViewControllerWithIdentifier("page1") as UIViewController
            let page_two = storyboard.instantiateViewControllerWithIdentifier("page2") as UIViewController
            let page_three = storyboard.instantiateViewControllerWithIdentifier("page3") as UIViewController
            
            initialViewController.delegate = self
            
            initialViewController.addViewController(page_one)
            initialViewController.addViewController(page_two)
            initialViewController.addViewController(page_three)
            
            
            self.window?.rootViewController = initialViewController
            self.window?.makeKeyAndVisible()
            
            defaults.setInteger(1, forKey: "viewedWalkthrough")
            
        } else {
            let initialViewController = storyboard.instantiateViewControllerWithIdentifier("Overview") as UIViewController!
            self.window?.rootViewController = initialViewController
            self.window?.makeKeyAndVisible()
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
                    if top.respondsToSelector("setCoreDataStack:") {
                        top.performSelector("setCoreDataStack:", withObject: coreDataStack)
                    }
                }
            }
        }
                
        return true
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

