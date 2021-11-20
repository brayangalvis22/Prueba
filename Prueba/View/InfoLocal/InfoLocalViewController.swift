//
//  InfoLocalViewController.swift
//  Prueba
//
//  Created by Brayan Galvis on 19/11/21.
//

import UIKit

class InfoLocalViewController: UIViewController {
  
  var infoLocal = Locales()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    // Do any additional setup after loading the view.
  }
  
  override func viewWillAppear(_ animated: Bool) {
    self.configureView()
    self.customThemeNavigation()
  }
  
  
  func customThemeNavigation(){
    self.title = "Info Local"
    self.navigationController?.isNavigationBarHidden = false
    let nav = self.navigationController?.navigationBar
    nav?.barTintColor = .red
    nav?.backgroundColor = .systemBlue
    nav?.tintColor = .white
    nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    nav?.isTranslucent = true

  }
  
  func configureView(){
    let mirror = Mirror(reflecting: infoLocal)
    var positionX = 100
    for child in mirror.children  {
      let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 21))
      label.center = CGPoint(x: Int(self.view.frame.height) / 3 ,y: positionX)
      label.textAlignment = .left
      label.text = "\(child.label ?? ""): \(child.value)"
      self.view.addSubview(label)
      positionX = positionX + 20
    }

  }
}
