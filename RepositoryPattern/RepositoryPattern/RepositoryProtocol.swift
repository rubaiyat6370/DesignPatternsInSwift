//
//  DBProtocol.swift
//  RepositoryPattern
//
//  Created by Rubaiyat Jahan Mumu on 2020-02-10.
//  Copyright © 2020 Rubaiyat Jahan Mumu. All rights reserved.
//

import Foundation

protocol DBProtocol {
    func insert<T>(object: T) -> Bool
    func get<T>(type: T.Type, where predicate: NSPredicate?) -> [T]?
    func delete<T>(object: T) -> Bool
    func update<T>(object: T, where predicate: NSPredicate?) -> Bool
}
