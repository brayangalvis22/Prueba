//
//  PruebaViewModel.swift
//  Prueba
//
//  Created by Brayan Galvis on 18/11/21.
//

import Foundation


protocol PruebaViewModelProtocol {
  var isAddUserValid: Binding<Bool?> { get }
  var isLoginValid: Binding<Bool?> { get }
  var isGetLocalesValid: Binding<Bool?> { get }

}

class PruebaViewModel: NSObject, PruebaViewModelProtocol {
  let pruebaModel = PruebaModel()
  let isAddUserValid: Binding<Bool?>
  let isLoginValid: Binding<Bool?>
  let isGetLocalesValid: Binding<Bool?>

  var user = DataUser()
  var listUser: [ListUser] = []
  var locales: [Locales] = []
  
  func storeUser(email: String, password: String) {
    
    let passwordEncrypt = Utilities.encryptMessage(message: password, encryptionKey: Constant.key)
    self.user.email = email
    self.user.password = passwordEncrypt
    
    self.pruebaModel.addUserDB(user: self.user) { [weak self] response in
      guard let _ = self else {
        return
      }
      
      switch response {
      case .success(_):
        self?.isAddUserValid.value = true
      case .error(_):
        self?.isAddUserValid.value = false
        break
      }
    }
  }
  
  func login(email: String, password: String){
    
    self.pruebaModel.login(user: self.user) { [weak self] response in
      guard let _ = self else {
        return
      }
      switch response {
      case .success(let result):
       if let listChat = result as? [UserPersistent] {
                  
          if !listChat.isEmpty {
            self?.mapDataUserDB(user: listChat)
            if !self!.listUser.isEmpty{
              self?.listUser.forEach({
                let passDecrypt = self?.passDecrypt(pass: $0.password)
                if passDecrypt == password{
                  print("SON IGUALES LAS CONTRASEÑAS")
                  Constant.dataLogin = $0
                  self?.isLoginValid.value = true
                }else{
                  self?.isLoginValid.value = false
                }
              })
            }
          }else{
            self?.isLoginValid.value = false
          }
        }
        break
      case .error(_):
        self?.isLoginValid.value = false
        break
      }
    }
  }
  
  
  func getLocales(){
    self.pruebaModel.getLocales() { [weak self] response in
      guard let _ = self else {
        return
      }
      
      switch response {
      case .success(let result):
        self?.locales = result as? [Locales] ?? []
        self?.isGetLocalesValid.value = true
        break
      case .error(_):
        self?.isGetLocalesValid.value = false
        break
      }
    }
    
  }
  
  
  private func mapDataUserDB(user: [UserPersistent] ) {
    self.listUser = user.map {
        return ListUser(userLocal: $0)
    }
  }
  
  
  func generateKey() -> String{
    do{
      let key = try Utilities.generateEncryptionKey(withPassword: "asd")
      return key
    }catch{
      print(error)
    }
    return ""
  }
  
  func passDecrypt(pass: String) -> String{
    do{
      let passwaordDecrypy = try Utilities.decryptMessage(encryptedMessage: pass, encryptionKey: Constant.key)
      return passwaordDecrypy
    }catch{
      print(error.localizedDescription)
    }
    return ""
  }
  
  
  override init() {
    self.isAddUserValid = Binding(nil)
    self.isLoginValid = Binding(nil)
    self.isGetLocalesValid = Binding(nil)

    super.init()
  }
}
