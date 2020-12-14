//
//  git-repositories+UIImageView.swift
//  git-repositories-prcj
//
//  Created by Paulo Cremonine on 10/12/20.
//

import UIKit

extension UIImageView {
  public func maskCircle(anyImage: UIImage) {
    self.contentMode = UIView.ContentMode.scaleAspectFill
    self.layer.cornerRadius = self.frame.height / 2
    self.layer.masksToBounds = false
    self.layer.borderWidth = 1.0
    self.layer.masksToBounds = false
    self.layer.borderColor = Constant.colorGray.cgColor
    self.clipsToBounds = true
    self.image = anyImage
  }
}
