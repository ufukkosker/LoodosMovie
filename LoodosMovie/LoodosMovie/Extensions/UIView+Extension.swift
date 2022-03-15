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
  
  func addSubviewForAutoLayout(_ view: UIView) {
    view.translatesAutoresizingMaskIntoConstraints = false
    addSubview(view)
  }
  
  func fillSuperview() {
    guard let superview = self.superview else { return }
    self.frame = superview.bounds
    self.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    self.translatesAutoresizingMaskIntoConstraints = true
  }
  
  func fillSuperviewWithConstraints() -> [NSLayoutConstraint] {
    guard let superview = self.superview else { return [] }
    translatesAutoresizingMaskIntoConstraints = false
    return [
      leadingAnchor.constraint(equalTo: superview.leadingAnchor),
      trailingAnchor.constraint(equalTo: superview.trailingAnchor),
      topAnchor.constraint(equalTo: superview.topAnchor),
      bottomAnchor.constraint(equalTo: superview.bottomAnchor),
    ]
  }
  
  func subview(with tag: Int) -> UIView? {
    subviews.first(where: { $0.tag == tag })
  }
  
  func makeCircle() {
    cornerRadiusWithMask(radius: bounds.midY)
  }
}
