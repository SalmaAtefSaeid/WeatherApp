//
//  DataController.swift
//  WeatherApp
//
//  Created by Salma Atef on 18/04/2025.
//

import CoreData

class DataController: ObservableObject {
    
    static let shared = DataController()
    
    let container: NSPersistentContainer
    
    var context: NSManagedObjectContext {
        return container.viewContext
    }
    
    
    private init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "WeatherDatabase")
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Core Data load failed: \(error)")
            }
        }
    }
    
    // MARK: - saveContext
    func saveContext() throws {
        if context.hasChanges {
            do {
                try context.save()
                print("✅ Context saved.")
            } catch let error as NSError {
                // Log detailed information about the error
                print("❌ Error saving context: \(error), \(error.userInfo)")
                throw error  // Throw the error for the caller to handle
            }
        } else {
            print("✅ No changes to save.")
        }
    }
    
}
