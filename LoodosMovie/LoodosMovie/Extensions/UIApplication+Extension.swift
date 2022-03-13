//
//  UIApplication+Extension.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 11.03.2022.
//

import Foundation
import UIKit

extension UIApplication {
  
  class func changeRoot(with viewController: UIViewController, animated: Bool = false) {
    DispatchQueue.main.async {
      guard
        let window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first,
        let rootViewController = window.rootViewController
      else {
        return
      }
      
      viewController.view.frame = rootViewController.view.frame
      viewController.view.layoutIfNeeded()
      window.rootViewController = viewController
      
      if animated {
        UIView.transition(
          with: window,
          duration: 0.6,
          options: .transitionCrossDissolve,
          animations: nil,
          completion: nil
        )
      }
    }
  }
  
  class func getTopViewController(base: UIViewController? = UIApplication.shared.windows.filter{ $0.isKeyWindow }.first?.rootViewController) -> UIViewController? {

      if let nav = base as? UINavigationController {
          return getTopViewController(base: nav.visibleViewController)

      } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
          return getTopViewController(base: selected)

      } else if let presented = base?.presentedViewController {
          return getTopViewController(base: presented)
      }
      return base
  }
}
