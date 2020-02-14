//
//  Address.swift
//  RepositoryPattern
//
//  Created by Rubaiyat Jahan Mumu on 2020-02-11.
//  Copyright © 2020 Rubaiyat Jahan Mumu. All rights reserved.
//

import Foundation
import RealmSwift


class Address: RealmObject {
    //@objc dynamic var road: String?
    @objc dynamic var city: String?
    @objc dynamic var country: String = ""
}

