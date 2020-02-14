//
//  UserProfile.swift
//  RepositoryPattern
//
//  Created by Rubaiyat Jahan Mumu on 2020-02-11.
//  Copyright © 2020 Rubaiyat Jahan Mumu. All rights reserved.
//

import Foundation
import RealmSwift

class RealmObject: Object {
    @objc dynamic var uuid = UUID().uuidString
}

class UserProfile: RealmObject {
    @objc dynamic var name = ""
    //@objc dynamic var bio = ""
    //@objc dynamic var image: String?
    //@objc dynamic var id = 0
    @objc dynamic var address: Address?

//    override static func primaryKey() -> String? {
//        return "id"
//    }
}

