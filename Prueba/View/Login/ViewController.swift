//
//  ViewController.swift
//  Prueba
//
//  Created by Brayan Galvis on 18/11/21.
//

import UIKit
import RNCryptor
import Alamofire

class ViewController: UIViewController{
  
  var user = DataUser()
  var key: String = ""
  
  var viewContent = UIView()
  
  var emailLabel = UILabel()
  var emailField = UITextField()
  var passLabel = UILabel()
  var passField = UITextField()
  var loginButton = UIButton()
  
  var pruebaViewModel: PruebaViewModel? {
    didSet{
      pruebaViewModel?.isAddUserValid.dataBinding({ [] (param) in
        guard let isAddUserValid = param else {  return }
        if isAddUserValid {
          print("Guardo con exito")
        }else{
          print("Error al guardar el usuario")
        }
      })
      
      pruebaViewModel?.isLoginValid.dataBinding({ [] (param) in
        guard let isLoginValid = param else {  return }
        if isLoginValid {
          
          let vc = LocalesViewController()
          vc.modalPresentationStyle = .fullScreen
          self.present(vc, animated: true) {
            
          }
          
        }else{
          self.present(Utilities.setAlert(sms: "Usuario o contraseña incorrecto"), animated: true, completion: nil)
        }
      })
    }
  }
    
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let directoryLocation = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).last {
        print("Documents Directory: \(directoryLocation)Application Support")
    }
    self.configureView()
//    loginButton.addTarget(self,action:#selector(login),for:.touchUpInside)
    loginButton.addTarget(self, action: #selector (self.loginAction), for: .touchUpInside)


  }
  
  private func configureView() {

    viewContent.backgroundColor = .white
    viewContent.translatesAutoresizingMaskIntoConstraints = false
    viewContent.layer.masksToBounds = true
    view.addSubview(viewContent)
    
    emailLabel.text = "Email:"
    emailLabel.textColor = .black
    emailLabel.textAlignment = .right
    emailLabel.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(emailLabel)
    
    emailField.layer.borderWidth = 1
    emailField.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(emailField)
    
    passLabel.text = "Password:"
    passLabel.textColor = .black
    passLabel.textAlignment = .right
    passLabel.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(passLabel)
    
    passField.layer.borderWidth = 1
    passField.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(passField)
    
    loginButton.translatesAutoresizingMaskIntoConstraints = false
    loginButton.setTitle("Login", for: .normal)
    loginButton.layer.borderWidth = 1
    loginButton.layer.cornerRadius = 5
    loginButton.backgroundColor = .systemBlue
    view.addSubview(loginButton)
    
    NSLayoutConstraint.activate([
      
      viewContent.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      viewContent.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      viewContent.widthAnchor.constraint(equalToConstant: 300),
      viewContent.heightAnchor.constraint(equalToConstant: 300),
      
      emailLabel.topAnchor.constraint(equalTo: viewContent.topAnchor, constant: 10),
      emailLabel.leadingAnchor.constraint(equalTo: viewContent.leadingAnchor, constant: 0),
      emailLabel.widthAnchor.constraint(equalToConstant: 50),
      emailLabel.heightAnchor.constraint(equalToConstant: 21),
      
      emailField.topAnchor.constraint(equalTo: viewContent.topAnchor, constant: 10),
      emailField.leadingAnchor.constraint(equalTo: emailLabel.trailingAnchor, constant: 50),
      emailField.trailingAnchor.constraint(equalTo: viewContent.trailingAnchor, constant: -30),
      emailField.heightAnchor.constraint(equalToConstant: 21),
      
      
      passLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 20),
      passLabel.leadingAnchor.constraint(equalTo: viewContent.leadingAnchor, constant: 0),
      passLabel.widthAnchor.constraint(equalToConstant: 80),
      passLabel.heightAnchor.constraint(equalToConstant: 21),
      
      passField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 20),
      passField.leadingAnchor.constraint(equalTo: passLabel.trailingAnchor, constant: 30),
      passField.trailingAnchor.constraint(equalTo: viewContent.trailingAnchor, constant: -30),
      passField.heightAnchor.constraint(equalToConstant: 21),
      
      loginButton.topAnchor.constraint(equalTo: passField.bottomAnchor, constant: 20),
      loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      loginButton.heightAnchor.constraint(equalToConstant: 50),
      loginButton.widthAnchor.constraint(equalToConstant: 100),
    
    ])
        
  }
  
  
  func customThemeColor(){
    self.view.backgroundColor = .white
    self.title = "login"
  }
  
  override func viewWillAppear(_ animated: Bool) {
    self.pruebaViewModel = PruebaViewModel()
    self.storeUser()
  }


  func storeUser() {
    user.email = "brayan.galvis@prueba.co"
    user.password = "123456789"
    self.pruebaViewModel?.storeUser(email: user.email, password: user.password)
  }
  

  @objc func loginAction() {
    print("login")
    
    let vc = LocalesViewController()
    vc.modalPresentationStyle = .fullScreen
    self.present(vc, animated: true) {

    }
    
//    guard let emailText = self.emailField.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) else { return }
//    guard let passText = self.passField.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) else { return }
//    if emailText  != "" && passText != ""{
//      self.pruebaViewModel?.login(email: emailText, password: passText)
//    }
  }

}



