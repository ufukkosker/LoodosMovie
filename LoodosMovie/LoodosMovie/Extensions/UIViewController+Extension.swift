//
//  UIViewController+Extension.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 12.03.2022.
//

import UIKit

extension UIViewController {
  
  private func getLoadingView() -> LoadingView? {
    view.subviews.first(where: { $0 is LoadingView }) as? LoadingView
  }
  
  func showLoading(_ isLoading: Bool) {
    if isLoading {
      showLoadingView()
    } else {
      hideLoadingView()
    }
  }
  
  func showLoadingView() {
    if getLoadingView() != nil {
      return
    }

    let loadingView = LoadingView()
    loadingView.showIn(view: view)
  }

  func hideLoadingView() {
    DispatchQueue.main.async {
      self.getLoadingView()?.removeFromSuperview()
    }
  }
}
 
