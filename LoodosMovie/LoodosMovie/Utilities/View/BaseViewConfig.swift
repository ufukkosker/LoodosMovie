//
//  BaseViewConfig.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 14.03.2022.
//

import UIKit

@IBDesignable
class BaseViewConfig: UIView {
  
  @IBInspectable var borderWidth: Double {
    get {
      return Double(self.layer.borderWidth)
    }
    set {
      self.layer.borderWidth = CGFloat(newValue)
    }
  }
  @IBInspectable var borderColor: UIColor? {
    get {
      return UIColor(cgColor: self.layer.borderColor!)
    }
    set {
      self.layer.borderColor = newValue?.cgColor
    }
  }
  @IBInspectable var shadowColor: UIColor? {
    get {
      return UIColor(cgColor: self.layer.shadowColor!)
    }
    set {
      self.layer.shadowColor = newValue?.cgColor
    }
  }
  @IBInspectable var shadowOpacity: Float {
    get {
      return self.layer.shadowOpacity
    }
    set {
      self.layer.shadowOpacity = newValue
    }
  }
  
}
