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
    createDismissKeyboardTapGesture()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.isNavigationBarHidden = true
    tabBarController?.tabBar.isHidden = false
  }
  
  ///```
  ///Функция скрывает клавиатуру по любому тапу по экрану.
  ///```
  private func createDismissKeyboardTapGesture() {
    let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
    view.addGestureRecognizer(tap)
  }
  //Этот метод передает введеную инфу введеную TextField и переходит на экран FollowerListViewController.
  @objc func pushFolloverListVC() {
    let followerListVC = FollowerListViewController()
    followerListVC.username = userNameTextField.text
    followerListVC.title = userNameTextField.text
    navigationController?.pushViewController(followerListVC, animated: true)
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

    //Устанавливаем экземпляр класса как делигат.
    userNameTextField.delegate = self

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

    //Этот код настраивает действие, которое будет выполнено, когда пользователь нажимает кнопку callToActionButton.
    callToActionButton.addTarget(self, action: #selector(pushFolloverListVC), for: .touchUpInside)

    NSLayoutConstraint.activate([
      callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
      callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
      callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
      callToActionButton.heightAnchor.constraint(equalToConstant: 50)
    ])
  }
}

//UITextFieldDelegate - протокол который содержит методы для контроля над поведением текстового поля.
extension SearchViewController: UITextFieldDelegate {

  ///```
  ///Функция, которая выполняет определенное действие
  ///при нажатии на return на клавиатуре.
  ///```
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    pushFolloverListVC()
    print("Did Tap Return")
    return true
  }
}
