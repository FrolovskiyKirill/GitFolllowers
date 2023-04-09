//
//  SearchViewController.swift
//  GitFolllowers
//
//  Created by Kirill Frolovskiy on 09.04.2023.
//

import UIKit

final class SearchViewController: UIViewController {

  let logoImageView = UIImageView()
  let userNameTextField = GFTextField()
  let callToActionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    configureLogoImageView()
    configureTextField()
    configureCallToActionButton()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.isNavigationBarHidden = true
    tabBarController?.tabBar.isHidden = false
  }

  ///```
  ///Устанавлеваем лого и констрейнты для него.
  ///```
  private func configureLogoImageView() {
    view.addSubview(logoImageView)
    logoImageView.translatesAutoresizingMaskIntoConstraints = false
    logoImageView.image = UIImage(named: "gh-logo")!

    NSLayoutConstraint.activate([
      logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
      logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      logoImageView.heightAnchor.constraint(equalToConstant: 200),
      logoImageView.widthAnchor.constraint(equalToConstant: 200)
    ])
  }

  ///```
  ///Устанавлеваем TextField и констрейнты для него.
  ///```
  private func configureTextField() {
    view.addSubview(userNameTextField)

    NSLayoutConstraint.activate([
      userNameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
      userNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
      userNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
      userNameTextField.heightAnchor.constraint(equalToConstant: 50)

    ])
  }

  ///```
  ///Устанавлеваем Button и констрейнты для нее.
  ///```
  private func configureCallToActionButton() {

    view.addSubview(callToActionButton)

    NSLayoutConstraint.activate([
      callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
      callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
      callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
      callToActionButton.heightAnchor.constraint(equalToConstant: 50)
    ])
  }

}