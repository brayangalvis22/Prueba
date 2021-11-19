//
//  UserPersistentClass.swift
//  Prueba
//
//  Created by Brayan Galvis on 18/11/21.
//

import Foundation
import CoreData

@objc(UserPersistent)
public class UserPersistent: NSManagedObject {
   override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
          super.init(entity: entity, insertInto: context)
      }
}
