//
//  FollowerListViewController.swift
//  GitFolllowers
//
//  Created by Kirill Frolovskiy on 09.04.2023.
//

import UIKit

class FollowerListViewController: UIViewController {
  
  var username: String!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    navigationController?.isNavigationBarHidden = false
    navigationController?.navigationBar.prefersLargeTitles = true
  }
}
