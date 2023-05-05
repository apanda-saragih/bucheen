//
//  Persistence.swift
//  Bucheen
//
//  Created by Apanda Saragih on 03/05/23.
//

import CoreData
import CloudKit

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container : NSPersistentCloudKitContainer

    var viewContext: NSManagedObjectContext {
        return container.viewContext
    }
    

    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "Bucheen")
        
        guard let description = container.persistentStoreDescriptions.first else {
            fatalError("ngga ada coy")
        }
        description.cloudKitContainerOptions = NSPersistentCloudKitContainerOptions(containerIdentifier: "iCloud.com.octa.Bucheen")
        
        description.cloudKitContainerOptions?.databaseScope = .public
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        viewContext.automaticallyMergesChangesFromParent = true
        viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    }
    
    func saveData(){
        if container.viewContext.hasChanges {
            do {
                try container.viewContext.save()
            } catch let error {
                print("Error saving.\(error)")
            }
        }
    }
}
