//
//  CoraDataManager.swift
//  RepositoryPattern
//
//  Created by Rubaiyat Jahan Mumu on 2020-02-18.
//  Copyright © 2020 Rubaiyat Jahan Mumu. All rights reserved.
//

import Foundation

import UIKit
import CoreData

class DatabaseController: NSObject {
    // MARK: - Core Data stack

    static var persistentContainer: NSPersistentContainer?
    static func getPersistentContainer() -> NSPersistentContainer {

        if persistentContainer == nil {
            persistentContainer = NSPersistentContainer(name: "RepositoryPattern")
            persistentContainer!.loadPersistentStores(completionHandler: { (_, error) in
                if let error = error as NSError? {
                    print("Error: \(error.description)")
                }
            })
        }

        return persistentContainer!
    }

    // MARK: - Core Data Saving support

    static func saveContext () {
        if let context = persistentContainer?.viewContext {
            if context.hasChanges {
                do {
                    try context.save()
                } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    let nserror = error as NSError
                    print("Unresolved error \(nserror), \(nserror.userInfo)")
                }
            }
        }
    }
}
