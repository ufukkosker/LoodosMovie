//
//  BaseServiceAlertManager.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 15.03.2022.
//

import Foundation
import Lottie

class BaseServiceAlertManager {
  
  static var shared = BaseServiceAlertManager()
  
  func prepareAlert(for description: ServiceError, completion: ((BaseAlertModel) -> ())) {
    
    switch description {
    case .notFound:
      guard let animation = Animation.named("notFound") else { return }
      completion(.init(title: "Film Bulunamadı", description: "Üzgünüz, aradığınız filmi şu an bulamadık.", icon: animation))
    case .tooMany:
      guard let animation = Animation.named("notFound") else { return }
      completion(.init(title: "Uppsss", description: "Arama sonucunuz çok fazla dataya sahip. Lütfen aramanızı daraltın.", icon: animation))
    case .non:
      guard let animation = Animation.named("notFound") else { return }
      completion(.init(title: "Bilinmeyen Hata", description: "Hatanın neye yol açtığını bilmiyoruz. Farklı bir arama deneyin veya daha sonra tekrar deneyin.", icon: animation))
    }
  }
}

enum ServiceError: String {
  case notFound = "Movie not found!"
  case tooMany = "Too many results."
  case non = ""
}
