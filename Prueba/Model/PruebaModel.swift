//
//  PruebaModel.swift
//  Prueba
//
//  Created by Brayan Galvis on 18/11/21.
//

import Foundation
import CoreData
import UIKit
import Alamofire

enum localEndpoints: String {
    case getLocales = "https://farmanet.minsal.cl/index.php/ws/getLocales"
}

typealias ModelCompletion = ( (_ response: ModelResponse<Any>) -> Void )

class PruebaModel {
  
  let appDelegate = UIApplication.shared.delegate as? AppDelegate
  
  func addUserDB(user: DataUser,completion: @escaping ModelCompletion) {

    do {
      if let context = appDelegate?.persistentContainer.viewContext {
        
        //MARK: consulto si ya existe un usuario con el mismo Email para no volver a guardarlo
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserPersistent")
        let predicate = NSPredicate(format: "email = %@", user.email)
        fetchRequest.predicate = predicate
        let foundUser = try context.fetch(fetchRequest) as! [UserPersistent]
        if foundUser.isEmpty {
          //MARK: guardo
          let userP: UserPersistent = NSEntityDescription.insertNewObject(forEntityName: "UserPersistent", into: context) as! UserPersistent
          userP.email = user.email
          userP.password = user.password
          userP.name = "Brayan Galvis"
          try context.save()
          completion(.success(result: true))
          
        }
      }
    } catch {
      completion(.error(result: ErrorApp.init(code: "0000", message: "ErrorAddUser")))
    }
        
  }
  
  func login(user: DataUser,completion: @escaping ModelCompletion) {
    do {
      if let context = appDelegate?.persistentContainer.viewContext {
        
        let fetchRequest = NSFetchRequest<UserPersistent>(entityName: "UserPersistent")
        let predicateEmail = NSPredicate(format: "email = %@", user.email)
        fetchRequest.predicate = predicateEmail
        let result = try context.fetch(fetchRequest)
        completion(.success(result: result))
      }
    } catch {
      completion(.error(result: ErrorApp.init(code: "0000", message: "ErrorLogin")))
    }
        
  }
  
  
  func getLocales(completion: @escaping ModelCompletion){
    
    AF.request(localEndpoints.getLocales.rawValue)
      .validate()
      .responseDecodable(of: [Locales].self) { (response) in
        switch response.result {
        case .success(let result):
           completion(.success(result: result))
        case .failure(let error):
           completion(.error(result: ErrorApp.init(code: "0000", message: error.localizedDescription)))
        }
      }
  }
  
  
}



