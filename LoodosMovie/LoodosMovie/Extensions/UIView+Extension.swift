//
//  UIView+Extension.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 12.03.2022.
//

import UIKit

extension UIView {
  
  @IBInspectable
  var cornerRadius: CGFloat {
    get { layer.cornerRadius }
    set { layer.cornerRadius = newValue }
  }

  func cornerRadius(corners: UIRectCorner, radius: CGFloat) {
    var maskCorners: CACornerMask = .init()

    if corners.contains(.topLeft) {
      maskCorners.insert(.layerMinXMinYCorner)
    }

    if corners.contains(.topRight) {
      maskCorners.insert(.layerMaxXMinYCorner)
    }

    if corners.contains(.bottomLeft) {
      maskCorners.insert(.layerMinXMaxYCorner)
    }

    if corners.contains(.bottomRight) {
      maskCorners.insert(.layerMaxXMaxYCorner)
    }

    layer.cornerRadius = radius
    layer.maskedCorners = maskCorners
  }
  
  func cornerRadiusWithMask(radius: CGFloat) {
    layer.cornerRadius = radius
    layer.masksToBounds = true
  }
  
  func makeCornerRadius(radius: CGFloat = 4) {
    cornerRadius = radius
  }
  
  func makeBorder(color:UIColor? = UIColor.lightGray , borderWith:CGFloat = 0.5) {
    layer.borderWidth = borderWith
    layer.borderColor = color?.cgColor
  }
}
