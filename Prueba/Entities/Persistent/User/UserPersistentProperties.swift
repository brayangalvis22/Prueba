//
//  UserPersistentProperties.swift
//  Prueba
//
//  Created by Brayan Galvis on 18/11/21.
//

import Foundation
import CoreData

extension UserPersistent{
    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserPersistent> {
        return NSFetchRequest<UserPersistent>(entityName: "UserPersistent")
    }
  @NSManaged public var email: String
  @NSManaged public var password: String
  @NSManaged public var name: String

}
