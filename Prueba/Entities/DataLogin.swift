//
//  DataLogin.swift
//  Prueba
//
//  Created by Brayan Galvis on 19/11/21.
//

import Foundation


struct DataLogin: Decodable {
    var email: String
    var name: String


    private enum CodingKeys: CodingKey {
        case email
        case name
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
      self.email = try container.decodeIfPresent(String.self, forKey: .email) ?? ""
      self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""

    }
}
