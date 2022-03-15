//
//  BaseLayers.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 11.03.2022.
//

import Foundation
import UIKit

protocol BaseView: AnyObject {
  func showLoading()
  func hideLoading()
  func showError(_ error: Error)
}

protocol BasePresenter: AnyObject {
  var _view: BaseView? { get }
  func notifyViewLoaded()
  func showLoading()
  func hideLoading()
  func showError(with message: String?)
}

protocol BaseRouter: AnyObject { }

protocol BaseInteractor: AnyObject {}

extension BaseView where Self: UIViewController {
  
  func showLoading() {
    if self.navigationController != nil {
      if getLoadingView() != nil { return } // Loading is already active
      
      guard let v = UIApplication.shared.keyWindow else { return }
      let loadingView = LoadingView()
      loadingView.showIn(view: v)
      
    } else {
      showLoading(true)
    }
  }
  
  func hideLoading() {
    
    DispatchQueue.main.async {
      guard self.navigationController != nil, let loadingView = self.getLoadingView() else {
        self.showLoading(false)
        return
      }
      
      loadingView.removeFromSuperview()
    }
  }
  
  func showError(_ error: Error) {
    let alert = UIAlertController(
      title: "Error", // TODO: Add Localization,
      message: error.localizedDescription,
      preferredStyle: .alert
    )
    alert.addAction(
      UIAlertAction(
        title: "Ok", // TODO: Add Localization
        style: .default,
        handler: nil
      )
    )
    present(alert, animated: true, completion: nil)
  }
  
  private func getLoadingView() -> LoadingView? {
    UIApplication.shared.keyWindow?.subviews.first(where: { $0 is LoadingView }) as? LoadingView
  }
}

extension BasePresenter {
  
  func showLoading() {
    _view?.showLoading()
  }
  
  func hideLoading() {
    _view?.hideLoading()
  }
  
  func showError(with message: String?) {
    _view?.hideLoading()
    if let message = message {
      
    }
  }
  
  func showCenterError(title: AlertTitle, message: AlertDescription, completion: @escaping (() -> ())) {
    _view?.hideLoading()
    DispatchQueue.main.async {
      let alertView = CenterAlertView()
      alertView.showAlert(title: title.title, description: message.description) {
        completion()
      }
      alertView.modalTransitionStyle = .crossDissolve
      alertView.modalPresentationStyle = .custom
      UIApplication.getTopViewController()?.present(alertView, animated: true, completion: nil)
    }
  }
}

extension BaseRouter {
  
  func finishModule() {
    UIApplication.getTopViewController()?.navigationController?.popViewController(animated: true)
  }
}
