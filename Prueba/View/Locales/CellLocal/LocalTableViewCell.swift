//
//  LocalTableViewCell.swift
//  Prueba
//
//  Created by Brayan Galvis on 19/11/21.
//

import UIKit

class LocalTableViewCell: UITableViewCell {
  
  var localNameLabel = UILabel()
  var name = UILabel()
  
  var localDirection = UILabel()
  var direction = UILabel()
  
  var localidadName = UILabel()
  var nameLocalidad = UILabel()
  
  override func awakeFromNib() {
    super.awakeFromNib()
    self.configureView()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  
  func configureView() {
    localNameLabel.text = "Local nombre: "
    localNameLabel.textColor = .black
    localNameLabel.textAlignment = .left
    localNameLabel.translatesAutoresizingMaskIntoConstraints = false
    addSubview(localNameLabel)
    
    name.text = ""
    name.textColor = .black
    name.textAlignment = .left
    name.translatesAutoresizingMaskIntoConstraints = false
    addSubview(name)
    
    localDirection.text = "Direccion local: "
    localDirection.textColor = .black
    localDirection.textAlignment = .left
    localDirection.translatesAutoresizingMaskIntoConstraints = false
    addSubview(localDirection)
    
    direction.text = ""
    direction.textColor = .black
    direction.textAlignment = .left
    direction.translatesAutoresizingMaskIntoConstraints = false
    addSubview(direction)
    
    localidadName.text = "Localidad nombre: "
    localidadName.textColor = .black
    localidadName.textAlignment = .left
    localidadName.translatesAutoresizingMaskIntoConstraints = false
    addSubview(localidadName)
    
    nameLocalidad.text = ""
    nameLocalidad.textColor = .black
    nameLocalidad.textAlignment = .left
    nameLocalidad.translatesAutoresizingMaskIntoConstraints = false
    addSubview(nameLocalidad)
    
    NSLayoutConstraint.activate([
      
      localNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
      localNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
      localNameLabel.heightAnchor.constraint(equalToConstant: 20),
      localNameLabel.widthAnchor.constraint(equalToConstant: 120),
      
      name.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
      name.leadingAnchor.constraint(equalTo: localNameLabel.trailingAnchor, constant: 10),
      name.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10),
      name.heightAnchor.constraint(equalToConstant: 20),
      
      localDirection.topAnchor.constraint(equalTo: localNameLabel.bottomAnchor, constant: 5),
      localDirection.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
      localDirection.heightAnchor.constraint(equalToConstant: 20),
      localDirection.widthAnchor.constraint(equalToConstant: 120),
      
      direction.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 5),
      direction.leadingAnchor.constraint(equalTo: localDirection.trailingAnchor, constant: 10),
      direction.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10),
      direction.heightAnchor.constraint(equalToConstant: 20),
      
      localidadName.topAnchor.constraint(equalTo: localDirection.bottomAnchor, constant: 5),
      localidadName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
      localidadName.heightAnchor.constraint(equalToConstant: 20),
      localidadName.widthAnchor.constraint(equalToConstant: 120),
      
      nameLocalidad.topAnchor.constraint(equalTo: direction.bottomAnchor, constant: 5),
      nameLocalidad.leadingAnchor.constraint(equalTo: localidadName.trailingAnchor, constant: 10),
      nameLocalidad.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10),
      nameLocalidad.heightAnchor.constraint(equalToConstant: 20),
    ])
  }
}
