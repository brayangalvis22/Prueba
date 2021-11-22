//
//  LocalDataBuilder.swift
//  PruebaTests
//
//  Created by Brayan Galvis on 22/11/21.
//

import Foundation
@testable import Prueba

public class LocalDataBuilder {
  
  var LocalNombre: String
  var localDireccion: String
  var localidadNombre: String
  
  init() {
    self.LocalNombre = "Default Value"
    self.localDireccion = "Default Value"
    self.localidadNombre = "Default Value"

  }
  func withLocalNombre (_ LocalNombre: String) {
    self.LocalNombre = LocalNombre
  }
  func withtlocalDireccion (_ localDireccion: String) {
    self.localDireccion = localDireccion
  }
  func withtlocalidadNombre (_ localidadNombre: String) {
    self.localidadNombre = localidadNombre
  }
  func build () -> Locales {
    return Locales(LocalNombre: LocalNombre, localDireccion: localDireccion,localidadNombre: localidadNombre)
  }
  
}


