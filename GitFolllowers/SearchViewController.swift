//
//  SearchViewController.swift
//  GitFolllowers
//
//  Created by Kirill Frolovskiy on 09.04.2023.
//

import UIKit

final class SearchViewController: UIViewController {

  let logoImageView = UIImageView()
  let usernameTextField = GFTextField()
  let callToActionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")

  ///```
  ///Замыкание, которое проверяет наличие текста в usernameTextField.
  ///```
  var isUsernameEntered: Bool {
    return !usernameTextField.text!.isEmpty
  }
  
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

    //Если пустая строка, то не переходит на следующий экран.
    guard isUsernameEntered else {
      print("no username")
      return
      }

    let followerListVC = FollowerListViewController()
    followerListVC.username = usernameTextField.text
    followerListVC.title = usernameTextField.text
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
    view.addSubview(usernameTextField)

    //Устанавливаем экземпляр класса как делигат.
    usernameTextField.delegate = self

    NSLayoutConstraint.activate([
      usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
      usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
      usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
      usernameTextField.heightAnchor.constraint(equalToConstant: 50)

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
