//
//  Article.swift
//  RepositoryPattern
//
//  Created by Rubaiyat Jahan Mumu on 2020-02-11.
//  Copyright © 2020 Rubaiyat Jahan Mumu. All rights reserved.
//

import Foundation
import RealmSwift

struct Article {
    var price: Double
    var name: String
}

class StorableArticle: Object, Storable {

    @objc dynamic var price: Double = 0.0
    @objc dynamic var name: String = ""
    @objc dynamic var uuid: String = ""

    var model: Article
    {
        get {
            return Article(price: price, name: name)
        }
    }
}

extension Article: Entity {
    private var storableArticle: StorableArticle {
        let realmArticle = StorableArticle()
        realmArticle.name = name
        realmArticle.price = price
        realmArticle.uuid = name
        return realmArticle
    }

    func toStorable() -> StorableArticle {
        return storableArticle
    }
}
