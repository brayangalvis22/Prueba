//
//  LocalApiService.swift
//  PruebaTests
//
//  Created by Brayan Galvis on 22/11/21.
//

import Foundation
@testable import Prueba


class LocalApiService: PruebaModel {
    
    var completion: ModelCompletion!
    
  override func getLocales(completion: @escaping ModelCompletion) {
        self.completion = completion
    }
    
    func fetchSuccess(_ locales: [Locales]) {
      completion(.success(result: locales))
    }
    
    func fetchFail(error: ErrorApp) {
      completion(.error(result: error))
    }
}
