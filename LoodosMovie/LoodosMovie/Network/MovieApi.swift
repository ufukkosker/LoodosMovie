//
//  MovieApi.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 13.03.2022.
//

import Foundation
import Moya

public enum MovieAPI {
  case search(text: String, page: String)
  case movieDetail(imdbId: String)
}

extension MovieAPI: BaseTarget {
  
//  public var subDirectory: String { "demojson" }
  
  public var path: String {
    switch self {
    default:
      return ""
    }
  }
  
  public var method: Moya.Method {
    switch self {
    default:
      return .get
    }
  }
  
  public var task: Task {
    switch self {
    case .search(let text, let page):
      return .requestParameters(parameters: ["s":"\(text)", "page": page, "apikey": "564727fa"], encoding: URLEncoding.queryString)
    case .movieDetail(imdbId: let imdbId):
      return .requestParameters(parameters: ["i":"\(imdbId)", "apikey":"564727fa"], encoding: URLEncoding.queryString)
    }
  }
  
  public var headers: [String : String]?{
    switch self {
    default:
      return ["Content-Type": "application/json"]
    }
  }
}
