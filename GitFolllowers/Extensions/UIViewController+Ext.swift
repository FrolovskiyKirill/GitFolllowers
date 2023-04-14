//
//  UIViewController+Ext.swift
//  GitFolllowers
//
//  Created by Kirill Frolovskiy on 12.04.2023.
//

import UIKit

extension UIViewController {
  
  ///```
  ///Метод для вызова кастомного алерта на экране в главном потоке
  ///```
  func presentGFAlertOnTheMainThread(title: String, message: String, buttonTitle: String) {
    DispatchQueue.main.async {
      let alertViewController = GFAlertViewController(alertTitle: title, message: message, buttonTitle: buttonTitle)
      alertViewController.modalPresentationStyle = .overFullScreen
      alertViewController.modalTransitionStyle = .crossDissolve
      self.present(alertViewController, animated: true)
    }
  }
}
