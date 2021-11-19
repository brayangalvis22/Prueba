//
//  ListChat.swift
//  Prueba
//
//  Created by Brayan Galvis on 18/11/21.
//

import Foundation


struct ListUser: Codable {
  
  var email:          String
  var password:        String
  var name:        String
  
  
  private enum CodingKeys: CodingKey {
    
    case email
    case password
    case name
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.email          = try container.decode(String.self,             forKey: .email)
    self.password        = try container.decode(String.self,             forKey: .password)
    self.name        = try container.decode(String.self,             forKey: .name)

  }
  
  func encode(to encoder: Encoder) throws {
    
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(email,          forKey: .email)
    try container.encode(password,        forKey: .password)
    try container.encode(name,        forKey: .name)

    
  }
  
  init(email: String = "", password: String = "", name: String = "") {
    
    self.email           = email
    self.password        = password
    self.name            = name

  }
  
  init(userLocal: UserPersistent) {
    
    self.email          = userLocal.email
    self.password        = userLocal.password
    self.name        = userLocal.name

  }
}
