//
//  UIFont+Extension.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 15.03.2022.
//

import UIKit

extension UIFont {
  
  public enum SFProText: String {
    case light = "-Light"
    case thin = "-Thin"
    case regular = "-Regular"
    case ultralight = "-Ultralight"
    case heavy = "-Heavy"
  }
  
  static func SFPro(_ type: SFProText = .regular, size: CGFloat = UIFont.systemFontSize) -> UIFont {
    return UIFont(name: "SFProText\(type.rawValue)", size: size)!
  }
  
  var isBold: Bool {
    return fontDescriptor.symbolicTraits.contains(.traitBold)
  }
  
  var isItalic: Bool {
    return fontDescriptor.symbolicTraits.contains(.traitItalic)
  }
}
