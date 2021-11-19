//
//  ModelResponse.swift
//  Prueba
//
//  Created by Brayan Galvis on 18/11/21.
//

import Foundation

enum ModelResponse<T> {
    case success(result: T)
    case error(result: ErrorApp)
}
