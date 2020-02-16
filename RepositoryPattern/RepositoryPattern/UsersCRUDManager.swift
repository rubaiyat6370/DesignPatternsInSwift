//
//  UsersCRUDManager.swift
//  RepositoryPattern
//
//  Created by Rubaiyat Jahan Mumu on 2020-02-11.
//  Copyright © 2020 Rubaiyat Jahan Mumu. All rights reserved.
//

import Foundation

class UserCRUDManger {

    var DB: DBProtocol

    init(DB: DBProtocol) {
        self.DB = DB
    }

    func createUser( name: String, city: String?, country: String, bio: String?, gender: String, image: String?) -> Bool {
        let user = UserProfile()
        user.name = name
        user.bio = bio ?? ""
        user.gender = gender

        if image != nil {
            user.image = image
        } else {
            if gender.caseInsensitiveCompare("female") == .orderedSame {
                user.image = "girlIcon"
            } else {
                user.image = "boyIcon"
            }
        }

        user.address = createAddress(city: city, country: country)
        user.address?.uuid = user.uuid
        return insert(user: user)
    }

    func createAddress( city: String?, country: String) -> Address {
        let address = Address()
        address.city = city
        address.country = country
        return address
    }

    func insert(user: UserProfile) -> Bool {
        return DB.insert(object: user)
    }

    func getAllUser() -> [UserProfile]? {
        return DB.get(type: UserProfile.self, where: nil)
    }

    func getAllUser(where predicate: NSPredicate) -> [UserProfile]? {
        return DB.get(type: UserProfile.self, where: predicate)
    }

    func delete(user: UserProfile) -> Bool {
        return DB.delete(object: user)
    }

    func update(user: UserProfile, name: String? = nil, city: String? = nil, country: String? = nil, bio: String? = nil, image: String? = nil, gender: String? = nil) -> Bool {
        let updatedUser = UserProfile()
        updatedUser.name = user.name
        updatedUser.uuid = user.uuid
        updatedUser.bio = user.bio
        updatedUser.gender = user.gender
        updatedUser.image = user.image
        
        let newAdd = Address()
        newAdd.city = user.address?.city
        newAdd.country = user.address?.country ?? ""
        updatedUser.address = newAdd

        if name != nil {
            updatedUser.name = name!
        }

        if city != nil {
            updatedUser.address?.city = city!
        }

        if country != nil {
            updatedUser.address?.country = country!
        }

        if gender != nil {
            updatedUser.gender = gender!
        }

        if bio != nil {
            updatedUser.bio = bio!
        }

        if image != nil {
            updatedUser.image = image
        } else {
            if updatedUser.gender.caseInsensitiveCompare("female") == .orderedSame {
                updatedUser.image = "girlIcon"
            } else {
                updatedUser.image = "boyIcon"
            }
        }
        
        let predicate: NSPredicate = NSPredicate(format: "uuid == %@", user.uuid)

        return DB.update(object: updatedUser, where: predicate)

    }
}
