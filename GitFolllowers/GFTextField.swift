//
//  GFTextField.swift
//  GitFolllowers
//
//  Created by Kirill Frolovskiy on 09.04.2023.
//

import UIKit

///```
///Данный класс GFTextField предоставляет кастомный TextField с настройками
///по умолчанию, которые можно изменить через конструктор.
/// ```
class GFTextField: UITextField {

  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func configure() {
    translatesAutoresizingMaskIntoConstraints = false

    layer.cornerRadius = 10
    layer.borderWidth = 2
    layer.borderColor = UIColor.systemGray4.cgColor

    textColor = .label
    tintColor = .label
    textAlignment = .center
    font = UIFont.preferredFont(forTextStyle: .title2)
    adjustsFontSizeToFitWidth = true
    minimumFontSize = 12

    backgroundColor = .tertiarySystemBackground
    autocorrectionType = .no

    placeholder = "Enter a username"
  }
}

let Some = GFTextField()
