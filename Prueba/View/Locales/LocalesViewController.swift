//
//  LocalesViewController.swift
//  Prueba
//
//  Created by Brayan Galvis on 19/11/21.
//

import UIKit

class LocalesViewController: UIViewController {
  
  let nameLabel = UILabel()
  let localeTableView = UITableView()
  
  var locales:[Locales] = []
  
  var pruebaViewModel: PruebaViewModel? {
    didSet{
      pruebaViewModel?.isGetLocalesValid.dataBinding({ [self] (param) in
        guard let isGetLocalesValid = param else {  return }
        if isGetLocalesValid {
          if let locales = self.pruebaViewModel?.locales{
            self.locales = locales
            print("self.locales \(self.locales.count)")
            localeTableView.reloadData()
          }
        }else{
          print("error")
        }
      })
    }
  }
  
  
    override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .red
      self.configureView()
      localeTableView.delegate = self
      localeTableView.dataSource = self
    }

  override func viewWillAppear(_ animated: Bool) {
    self.pruebaViewModel = PruebaViewModel()
    self.pruebaViewModel?.getLocales()
  }
  
  
  func configureView(){
    view.backgroundColor = .white
    
    nameLabel.text = "Hola \(String(describing: Constant.dataLogin?.name))"
    nameLabel.textColor = .black
    nameLabel.textAlignment = .center
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(nameLabel)
    
    
    
    localeTableView.tableFooterView = UIView(frame: .zero)
    localeTableView.backgroundColor = UIColor.white
    localeTableView.separatorColor = UIColor.gray
    localeTableView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(localeTableView)

    NSLayoutConstraint.activate([
      
      nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
      nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -20),
      nameLabel.heightAnchor.constraint(equalToConstant: 20),
      
      localeTableView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
      localeTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      localeTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      localeTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20),
      
      ])
 
  }
  
}

extension LocalesViewController: UITableViewDelegate,UITableViewDataSource {

  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80.0
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.locales.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    var cell = tableView.dequeueReusableCell(withIdentifier: "LocalTableViewCell") as? LocalTableViewCell
    if cell == nil {
        tableView.register(UINib(nibName: "LocalTableViewCell", bundle: nil), forCellReuseIdentifier: "LocalTableViewCell")
        cell = tableView.dequeueReusableCell(withIdentifier: "LocalTableViewCell") as? LocalTableViewCell
    }
    
    cell?.name.text = self.locales[indexPath.row].LocalNombre
    cell?.direction.text = self.locales[indexPath.row].localDireccion
    cell?.nameLocalidad.text = self.locales[indexPath.row].localidadNombre

    return cell!
  }


  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let vc = InfoLocalViewController()
    vc.modalPresentationStyle = .popover
    vc.infoLocal = self.locales[indexPath.row]
    self.present(vc, animated: true) {
      
    }
  }
}
