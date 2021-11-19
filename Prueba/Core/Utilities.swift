//
//  Utilities.swift
//  Prueba
//
//  Created by Brayan Galvis on 18/11/21.
//

import Foundation
import RNCryptor
import UIKit

class Utilities {
  
  
  static func encryptMessage(message: String, encryptionKey: String) -> String {
       let messageData = message.data(using: .utf8)!
       let cipherData = RNCryptor.encrypt(data: messageData, withPassword: encryptionKey)
       return cipherData.base64EncodedString()
   }

  static func decryptMessage(encryptedMessage: String, encryptionKey: String) throws -> String {
       let encryptedData = Data.init(base64Encoded: encryptedMessage)!
       let decryptedData = try RNCryptor.decrypt(data: encryptedData, withPassword: encryptionKey)
       let decryptedString = String(data: decryptedData, encoding: .utf8)!
       return decryptedString
   }
  
  static func generateEncryptionKey(withPassword password:String) throws -> String {
      let randomData = RNCryptor.randomData(ofLength: 32)
      let cipherData = RNCryptor.encrypt(data: randomData, withPassword: password)
      return cipherData.base64EncodedString()
  }
  
  class func setAlert(sms: String) -> UIAlertController {
    let alert = UIAlertController(title: "WARNING", message: sms, preferredStyle: UIAlertController.Style.alert)
    let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
    alert.setValue(NSAttributedString(string: "WARNING", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 18)!]), forKey: "attributedTitle")
    alert.setValue(NSAttributedString(string: sms, attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont(name: "HelveticaNeue", size: 15)!]), forKey: "attributedMessage")
    
    let subview = (alert.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
    subview.backgroundColor = UIColor.white
    alert.view.tintColor = UIColor.black
    alert.addAction(ok)
    return alert
  }
  
}
