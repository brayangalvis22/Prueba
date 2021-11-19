//
//  InfoLocalViewController.swift
//  Prueba
//
//  Created by Brayan Galvis on 19/11/21.
//

import UIKit

class InfoLocalViewController: UIViewController {
  
  var infoLocal = Locales()
  var localNameLabel = UILabel()
  var name = UILabel()
  
  var localDirection = UILabel()
  var direction = UILabel()
  
  var localidadName = UILabel()
  var nameLocalidad = UILabel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    // Do any additional setup after loading the view.
  }
  
  override func viewWillAppear(_ animated: Bool) {
    self.configureView()
    print("infoLocal --> \(infoLocal)")
  }
  
  func configureView(){
    
    localNameLabel.text = "Local nombre: "
    localNameLabel.textColor = .black
    localNameLabel.textAlignment = .left
    localNameLabel.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(localNameLabel)
    
    name.text = infoLocal.LocalNombre
    name.textColor = .black
    name.textAlignment = .left
    name.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(name)
    
    localDirection.text = "Direccion local: "
    localDirection.textColor = .black
    localDirection.textAlignment = .left
    localDirection.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(localDirection)
    
    direction.text = infoLocal.localDireccion
    direction.textColor = .black
    direction.textAlignment = .left
    direction.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(direction)
    
    
    localidadName.text = "Localidad nombre: "
    localidadName.textColor = .black
    localidadName.textAlignment = .left
    localidadName.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(localidadName)
    
    nameLocalidad.text = infoLocal.localidadNombre
    nameLocalidad.textColor = .black
    nameLocalidad.textAlignment = .left
    nameLocalidad.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(nameLocalidad)
    
    NSLayoutConstraint.activate([
      
      localNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
      localNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
      localNameLabel.heightAnchor.constraint(equalToConstant: 20),
      localNameLabel.widthAnchor.constraint(equalToConstant: 120),

      name.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
      name.leadingAnchor.constraint(equalTo: localNameLabel.trailingAnchor, constant: 10),
      name.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
      name.heightAnchor.constraint(equalToConstant: 20),

      
      
      localDirection.topAnchor.constraint(equalTo: localNameLabel.bottomAnchor, constant: 5),
      localDirection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
      localDirection.heightAnchor.constraint(equalToConstant: 20),
      localDirection.widthAnchor.constraint(equalToConstant: 120),

      direction.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 5),
      direction.leadingAnchor.constraint(equalTo: localDirection.trailingAnchor, constant: 10),
      direction.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
      direction.heightAnchor.constraint(equalToConstant: 20),
      
      localidadName.topAnchor.constraint(equalTo: localDirection.bottomAnchor, constant: 5),
      localidadName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
      localidadName.heightAnchor.constraint(equalToConstant: 20),
      localidadName.widthAnchor.constraint(equalToConstant: 120),

      nameLocalidad.topAnchor.constraint(equalTo: direction.bottomAnchor, constant: 5),
      nameLocalidad.leadingAnchor.constraint(equalTo: localidadName.trailingAnchor, constant: 10),
      nameLocalidad.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
      nameLocalidad.heightAnchor.constraint(equalToConstant: 20),
      
      ])
    
    
  }
}
