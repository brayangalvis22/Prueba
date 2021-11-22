//
//  PruebaTests.swift
//  PruebaTests
//
//  Created by Brayan Galvis on 18/11/21.
//

import XCTest
@testable import Prueba

class PruebaTests: XCTestCase {
  
  var localDataBuilder: LocalDataBuilder!
  var localApiService: LocalApiService!
  var localViewModel: PruebaViewModel!
  
  override func setUp() {
    super.setUp()
    localDataBuilder = LocalDataBuilder()
    localApiService = LocalApiService()
    localViewModel = PruebaViewModel(localModel: localApiService!)
    
  }
  
  override func tearDown() {
    localDataBuilder = nil
    localApiService = nil
    localViewModel = nil
    super.tearDown()
  }
  
  
  func test_getLocalWithSuccessfulResponseWithZeroLocal() {
    let locales: [Locales] = []
    localViewModel.getLocales()
      localApiService.fetchSuccess(locales)
      XCTAssertTrue(localViewModel.locales.count == 0)
  }
  
  func test_getLocalWithSuccessfulResponseWithSomeLocal() {
    let locales = loadLocales()
    localViewModel.getLocales()
    localApiService.fetchSuccess(locales)
    XCTAssertTrue(localViewModel.locales.count > 0)
  }
  
  
  func test_getLocalWithFailedResponseWithInternalError() {
    localViewModel.getLocales()
    localApiService.fetchFail(error: ErrorApp.init(code: "000", message: "A error ocurred, try later"))
    XCTAssertEqual(localViewModel.messageError, "A error ocurred, try later 000")
  }
  
  private func loadLocales() -> [Locales] {
    var locales: [Locales] = []
    for _ in 0...10 {
      locales.append(localDataBuilder.build())
    }
    return locales
  }
  
}
