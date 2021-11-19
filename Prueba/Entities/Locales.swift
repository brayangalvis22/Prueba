//
//  Locales.swift
//  Prueba
//
//  Created by Brayan Galvis on 19/11/21.
//

import Foundation

struct Locales: Decodable {
  let LocalNombre: String
  let localDireccion: String
  let localidadNombre: String
  let fecha: String
  let localId: String
  let ComunaNombre: String
  let funcHoraApertura: String
  let funcHoraCierre: String
  let localTelefono: String
  let localLat: String
  let localLng: String
  let funcDia: String
  let fkRegion: String
  let fkComuna: String
  let fkLocalidad: String

  
  private enum CodingKeys: CodingKey {
    case local_nombre
    case local_direccion
    case localidad_nombre
    case fecha
    case local_id
    case comuna_nombre
    case funcionamiento_hora_apertura
    case funcionamiento_hora_cierre
    case local_telefono
    case local_lat
    case local_lng
    case funcionamiento_dia
    case fk_region
    case fk_comuna
    case fk_localidad
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.LocalNombre = try container.decodeIfPresent(String.self, forKey: .local_nombre) ?? ""
    self.localDireccion = try container.decodeIfPresent(String.self, forKey: .local_direccion) ?? ""
    self.localidadNombre = try container.decodeIfPresent(String.self, forKey: .localidad_nombre) ?? ""
    self.fecha = try container.decodeIfPresent(String.self, forKey: .fecha) ?? ""
    self.localId = try container.decodeIfPresent(String.self, forKey: .local_id) ?? ""
    self.ComunaNombre = try container.decodeIfPresent(String.self, forKey: .comuna_nombre) ?? ""
    self.funcHoraApertura = try container.decodeIfPresent(String.self, forKey: .funcionamiento_hora_apertura) ?? ""
    self.funcHoraCierre = try container.decodeIfPresent(String.self, forKey: .funcionamiento_hora_cierre) ?? ""
    self.localTelefono = try container.decodeIfPresent(String.self, forKey: .local_telefono) ?? ""
    self.localLat = try container.decodeIfPresent(String.self, forKey: .local_lat) ?? ""
    self.localLng = try container.decodeIfPresent(String.self, forKey: .local_lat) ?? ""
    self.funcDia = try container.decodeIfPresent(String.self, forKey: .funcionamiento_dia) ?? ""
    self.fkRegion = try container.decodeIfPresent(String.self, forKey: .fk_region) ?? ""
    self.fkComuna = try container.decodeIfPresent(String.self, forKey: .fk_comuna) ?? ""
    self.fkLocalidad = try container.decodeIfPresent(String.self, forKey: .fk_localidad) ?? ""

  }
  
  
  init(LocalNombre: String = "", localDireccion: String = "", localidadNombre: String = "", fecha: String = "", localId: String = "", ComunaNombre: String = "", funcHoraApertura: String = "", funcHoraCierre: String = "", localTelefono: String = "", localLat: String = "", localLng: String = "", funcDia: String = "", fkRegion: String = "", fkComuna: String = "", fkLocalidad: String = "") {
    
    self.LocalNombre           = LocalNombre
    self.localDireccion        = localDireccion
    self.localidadNombre            = localidadNombre
    self.fecha            = fecha
    self.localId            = localId
    self.ComunaNombre            = ComunaNombre
    self.funcHoraApertura            = funcHoraApertura
    self.funcHoraCierre            = funcHoraCierre
    self.localTelefono            = localTelefono
    self.localLat            = localLat
    self.localLng            = localLng
    self.funcDia            = funcDia
    self.fkRegion            = fkRegion
    self.fkComuna            = fkComuna
    self.fkLocalidad            = fkLocalidad
    
  }
}

