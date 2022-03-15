//
//  BaseAlertDialogs.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 14.03.2022.
//

import Foundation

enum AlertTitle {
  case networkTitle
  
  var title: String {
    switch self {
    case .networkTitle:
      return "Bağlantı Hatası"
    }
  }
}

enum AlertDescription {
  case networkDescription
  
  var description: String {
    switch self {
    case .networkDescription:
      return "Lütfen internet bağlantınızı kontrol edip tekrar deneyin."
    }
  }
}

enum ServiceError: String {
  case notFound = "Movie not found!"
  case tooMany = "Too many results."
  case non = ""
}
