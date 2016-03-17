//
//  SettingsTableViewController.swift
//  Course Wizard
//
//  Created by Anthony Lockett on 3/17/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit
import CoreData

class SettingTableViewController: UITableViewController {
    
    var coreDataStack: CoreDataStack!
    
    var currentCampus: String?
    
    override func viewDidLoad() {
        title = "Features"
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showSemestersSegue" {
            let controller = segue.destinationViewController as! SemestersTableViewController
            controller.coreDataStack = coreDataStack
        }
    }
    
    /*
    This whole helper function has to do with Core Data. I will do my best to explain it. THIS MIGHT BE A HUGE COMMENT
    We are going to go over this line by line but its about what you think you need to do.
    
    Getting information from Core Data
    
    1. NSFetchRequest - This  is how you request information from core data. You initialize a fetch request with the entity that you want to grab from the model
    2. Since this request could come back with an error, its always a good idea to put it in a do catch block
    3. You need to store this data somewhere, we store it in a variable called results, well its an array actually.
    4. the keyword try is just as it means I want to TRY to run this request.
    5. Everything comes from the Core Data Stack, Look at CoreDataStack.swift in the Resources folder for the helper mehtods.
    6. managedObjectContext - this holders several managedObjects which is what the entity is.
    7. we call managedObjectContext for about everything as you will see.
    8. coreDataStack.managedObjectContext.executeFetchRequest(campusFetchRequest): this is obvious, we are trying to execute the fetch request.
    9. We this cast it as an array of strings. You might need to cast differently. Look around and see what I do in different situations
    10.  Next we check if there are any results, if not we know no one has set their campus location so we set one.
    
    
    Setting information in Core Data
    
    1. When setting information we need to know where we are setting it.
    2. First we need to get an instance to our entity from the model.  We do this in the guard statement.
    3. If you dont know about the guard statement, its like a if let but safer, use them when possible. We like those here :)
    4. We then make an entity for the campus, this might be confusing cause didnt we just get the campus entity?
    Yeah kind of. We got the entity but we would like to turn that entity into our own using our own class. Here we are doing that.
    5. Remember the files core data made for use when we made the subclasses?
    This is why we do that we can use Campus(........)
    6. Now we have access to the attributes of that entity
    7. campusEntity.location = currentCampus, here we are setting the attribute to the variable
    8. Save that shit.
    */
    
    func saveCampusToCoreData() {
        
        // Check to see if there is currently a campus
        let campusFetchRequest = NSFetchRequest(entityName: "Campus")
        
        do {
            
            let results = try coreDataStack.managedObjectContext.executeFetchRequest(campusFetchRequest) as? [String]
            
            if results!.count == 0 {
                //There is no campus so set one
                guard let entity = NSEntityDescription.entityForName("Campus", inManagedObjectContext: coreDataStack.managedObjectContext) else {
                    fatalError("Could not find entity descriptions!")
                }
                let campusEntity = Campus(entity: entity, insertIntoManagedObjectContext: coreDataStack.managedObjectContext)
                campusEntity.location = currentCampus
                
                do {
                    try coreDataStack.managedObjectContext.save()
                } catch {
                    print("Could not save...")
                }
                
            } else {
                //There is a campus so check if it is the same
                //Anthony needs to figure out how to implement this!!!!!!
            }
            
        } catch {
            fatalError("Could not set campus")
        }
        
    }
    
}




