//
//  LocalesViewController.swift
//  Prueba
//
//  Created by Brayan Galvis on 19/11/21.
//

import UIKit

class LocalesViewController: UIViewController {
  
  let nameLabel = UILabel()
  let loadingLabel = UILabel()
  let localeTableView = UITableView()
  var locales:[Locales] = []
  
  var pruebaViewModel: PruebaViewModel? {
    didSet{
      pruebaViewModel?.isGetLocalesValid.dataBinding({ [self] (param) in
        guard let isGetLocalesValid = param else {  return }
        if isGetLocalesValid {
          if let locales = self.pruebaViewModel?.locales{
            self.locales = locales
            self.loadingLabel.isHidden = true
            localeTableView.reloadData()
          }
        }else{
          self.present(Utilities.setAlert(sms: pruebaViewModel?.messageError ?? ""), animated: true, completion: nil)
        }
      })
    }
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.configureView()
    localeTableView.delegate = self
    localeTableView.dataSource = self
  }
  
  override func viewWillAppear(_ animated: Bool) {
      self.pruebaViewModel = PruebaViewModel()
      self.pruebaViewModel?.getLocales()
      self.customThemeNavigation()
    
  }
  
  func customThemeNavigation(){
    self.title = "Locales"
    self.navigationController?.isNavigationBarHidden = false
    let nav = self.navigationController?.navigationBar
    nav?.barTintColor = .red
    nav?.backgroundColor = .systemBlue
    nav?.tintColor = .white
    nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    nav?.isTranslucent = true
    let backButton = UIBarButtonItem(title: "Logout", style: UIBarButtonItem.Style.plain, target: self, action: nil)
    navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
  }
  
  
  func configureView(){
    view.backgroundColor = .white
    let nameUser = Constant.dataLogin?.name ?? ""
    nameLabel.text = "Hola \(nameUser)"
    nameLabel.textColor = .black
    nameLabel.textAlignment = .center
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(nameLabel)
    
    localeTableView.tableFooterView = UIView(frame: .zero)
    localeTableView.backgroundColor = UIColor.white
    localeTableView.separatorColor = UIColor.gray
    localeTableView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(localeTableView)
    
    loadingLabel.text = "Loading locales..."
    loadingLabel.textColor = .black
    loadingLabel.textAlignment = .center
    loadingLabel.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(loadingLabel)
    
    NSLayoutConstraint.activate([
      
      nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
      nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -20),
      nameLabel.heightAnchor.constraint(equalToConstant: 20),
    
      localeTableView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
      localeTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
      localeTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
      localeTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20),
      
      loadingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      loadingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      loadingLabel.widthAnchor.constraint(equalToConstant: 200),
      loadingLabel.heightAnchor.constraint(equalToConstant: 21),
      
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
    
    let infoLocal = InfoLocalViewController(nibName: "InfoLocal", bundle: nil)
    infoLocal.modalPresentationStyle = .popover
    infoLocal.infoLocal = self.locales[indexPath.row]
    self.navigationController?.pushViewController(infoLocal, animated: true)
    
  }
}
