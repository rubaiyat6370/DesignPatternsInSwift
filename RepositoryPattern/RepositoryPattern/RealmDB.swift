//
//  RealmDB.swift
//  RepositoryPattern
//
//  Created by Rubaiyat Jahan Mumu on 2020-02-11.
//  Copyright © 2020 Rubaiyat Jahan Mumu. All rights reserved.
//

import Foundation
import RealmSwift

class RealmDB: DBProtocol {

    private let realm: Realm

    init() {
        realm = try! Realm()
    }

    func insert<T>(object: T) -> Bool {
        do {
            try realm.write { () -> Bool in
                realm.add(object as! Object)
                return true
            }
        } catch {
            print("Insert unsuccessful")
            return false
        }
        return false
    }

    func get<T>(type: T.Type, where predicate: NSPredicate?) -> [T]? {
        var objects = realm.objects(type as! Object.Type)
        if predicate != nil {
            objects = objects.filter(predicate!)
        }
        return objects.compactMap{ $0 as? T}
    }

    func delete<T>(object: T) -> Bool {
        do {
            try realm.write { () -> Bool in
                realm.delete(object as! Object)
                return true
            }
        } catch {
            print("Delete unsuccessful")
            return false
        }
        return false
    }

    func update<T>(object: T, where predicate: NSPredicate?) -> Bool {
        let itemToUpdate = get(type: T.self, where: predicate)?[0]
        let isDeleted = delete(object: itemToUpdate)
        let isInserted = insert(object: object)
        return isDeleted && isInserted
    }
}

