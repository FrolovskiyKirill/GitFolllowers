//
//  GFBodyLabel.swift
//  GitFolllowers
//
//  Created by Kirill Frolovskiy on 11.04.2023.
//

import UIKit

///```
///Класс, который устанавливает настройки основного текста UILabel.
///```
class GFBodyLabel: UILabel {

  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(textAligment: NSTextAlignment) {
    super.init(frame: .zero)
    self.textAlignment = textAligment
    
    configure()
  }

  private func configure() {
    textColor = .secondaryLabel
    font = UIFont.preferredFont(forTextStyle: .body)
    adjustsFontSizeToFitWidth = true
    minimumScaleFactor = 0.75
    lineBreakMode = .byWordWrapping
    translatesAutoresizingMaskIntoConstraints = false
  }
}
