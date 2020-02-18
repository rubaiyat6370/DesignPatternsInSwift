//
//  CoreDataDB.swift
//  RepositoryPattern
//
//  Created by Rubaiyat Jahan Mumu on 2020-02-18.
//  Copyright © 2020 Rubaiyat Jahan Mumu. All rights reserved.
//

import Foundation
import CoreData

class CoreDataDB {

    let manageObjectContext = DatabaseController.getPersistentContainer().viewContext

    static let shared = CoreDataDB()
    
    func insert<T>(object: T) -> Bool {
        manageObjectContext.insert(object as! NSManagedObject)
        self.saveContext()
        return true
    }

//    func get<T>(type: T.Type, where predicate: NSPredicate?) -> [T]? {
//        //(T as? NSManagedObject)
//        //let fetchRequest: NSFetchRequest = (T as! NSManagedObject).fetchRequest()
//    }

    func delete<T>(object: T) -> Bool {
        manageObjectContext.delete(object as! NSManagedObject)
        self.saveContext()
        return true
    }

    func update<T>(object: T, where predicate: NSPredicate?) -> Bool {
        return true
    }

    func saveContext() {
        DatabaseController.saveContext()
    }

}
