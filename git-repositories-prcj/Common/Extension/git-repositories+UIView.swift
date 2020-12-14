//
//  git-repositories+UIView.swift
//  git-repositories-prcj
//
//  Created by Paulo Cremonine on 10/12/20.
//

import UIKit

extension UIView{
    func Border(radius:CGFloat, color:UIColor = .clear) {
        self.layer.cornerRadius = CGFloat(radius)
        self.layer.borderWidth = 1
        self.layer.borderColor = color.cgColor
        self.clipsToBounds = true
    }
}
