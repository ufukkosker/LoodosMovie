//
//  NibLoadable.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 15.03.2022.
//

import Foundation
import UIKit

// MARK: - UIView

extension UIView {
  static var defaultReuseIdentifier: String { String(describing: self) }
}

protocol NibLoadable {
  static var defaultNibName: String { get }
  static func loadFromNib() -> Self
}

extension NibLoadable where Self: UIView {
  static var defaultNibName: String { defaultReuseIdentifier }

  static var defaultNib: UINib {
    print(defaultNibName)
    print(UINib(nibName: defaultNibName, bundle: nil))
    return UINib(nibName: defaultNibName, bundle: nil)
  }

  static func loadFromNib() -> Self {
    guard
      let nib = Bundle.main.loadNibNamed(defaultNibName, owner: nil, options: nil)?.first as? Self
    else {
      fatalError("[NibLoadable] Cannot load view from nib.")
    }
    return nib
  }
  
  func instantiateFromNib() -> UIView {
    let bundle = Bundle(for: type(of: self))
    let nib = UINib(nibName: Self.defaultNibName, bundle: bundle)
    let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
    return view
  }
}

// MARK: - UIViewController

extension UIViewController {
  static var defaultReuseIdentifier: String { String(describing: self) }
}

extension NibLoadable where Self: UIViewController {
  static var defaultNibName: String { defaultReuseIdentifier }

  static var defaultNib: UINib {
    return UINib(nibName: defaultNibName, bundle: nil)
  }

  static func loadFromNib() -> Self {
    return self.init(nibName: defaultNibName, bundle: nil)
  }
}
