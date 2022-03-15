//
//  BaseTarget.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 13.03.2022.
//

import Foundation
import Moya

public protocol BaseTarget: TargetType {
//    var subDirectory: String { get }
}

public extension BaseTarget {
  
    var baseURL: URL { APIConstants().apiBaseURL }
    var headers: [String : String]? { ["Content-Type": "application/json"] }
    var sampleData: Data { Data() }
    var method: Moya.Method { .get }
}
