//
//  ApiConstant.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 13.03.2022.
//

import Foundation

public enum EndpointManager: String, CaseIterable {
  
  case dev
  
  var url : URL {
    return URL(string: "http://www.omdbapi.com/")!
  }
}

public struct APIConstants {
  
  public static var tmpEnv : EndpointManager = .dev
  
  public static var env: EndpointManager {
    return .dev
  }
  
  public var apiBaseURL: URL { APIConstants.env.url }
  
  public func apiURL(with path: String) -> URL {
    URL(string: apiBaseURL.absoluteString + path)!
  }
  
  mutating func change(_ env: EndpointManager) {
    APIConstants.tmpEnv = env
  }
}
