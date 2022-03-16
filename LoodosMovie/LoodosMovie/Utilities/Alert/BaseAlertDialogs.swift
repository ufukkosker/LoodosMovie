//
//  BaseAlertDialogs.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 14.03.2022.
//

import Foundation
import Lottie

class BaseInAppAlertManager {
  
  static var shared = BaseInAppAlertManager()
  
  func prepareAlert(for inAppError: InAppError, _ arletTitle: AlertTitle, _ alertDescription: AlertDescription, completion: ((BaseAlertModel) -> ())) {
    switch inAppError {
    case .network:
      guard let animation = Animation.named("noConnection") else { return }
      completion(.init(title: arletTitle.title, description: alertDescription.description, icon: animation))
    case .lastPage:
      guard let animation = Animation.named("notFound") else { return }
      completion(.init(title: arletTitle.title, description: alertDescription.description, icon: animation))
    }
  }
}

enum AlertTitle {
  case networkTitle
  case lastPage
  
  var title: String {
    switch self {
    case .networkTitle:
      return "Bağlantı Hatası"
    case .lastPage:
      return "Son Sayfa"
    }
  }
}

enum AlertDescription {
  case networkDescription
  case lastPageDescription
  
  var description: String {
    switch self {
    case .networkDescription:
      return "Lütfen internet bağlantınızı kontrol edip tekrar deneyin."
    case .lastPageDescription:
      return "Son sayfaya ulaştınız."
    }
  }
}

enum InAppError {
  case network
  case lastPage
}
