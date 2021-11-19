//
//  User.swift
//  Prueba
//
//  Created by Brayan Galvis on 18/11/21.
//

import Foundation

struct DataUser: Decodable {
  
  var email: String
  var password: String

  
  private enum CodingKeys: CodingKey {
    case email
    case password


  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.email = try container.decode(String.self, forKey: .email)
    self.password = try container.decode(String.self, forKey: .password)

  }
  
  init(email: String = "", password: String = "") {
    self.email = email
    self.password = password
  }
  
  init(user: UserPersistent) {
      
    self.email  = user.email
    self.password  = user.password

  }
  
}
