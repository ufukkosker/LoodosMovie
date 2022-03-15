//
//  ServiceManager.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 13.03.2022.
//

import Foundation
import Result
import Moya

public typealias APIResult<T> = Result<T, MoyaError>
/// Servis Basic Handler
public typealias SBH<T: Decodable> = (_ resut: APIResult<T>) -> Void

extension MoyaError {
  
  public var serviceError: LoodosError? {
    return response.flatMap {
      try? $0.map(LoodosError.self)
    }
  }
}

extension MultiTarget: AccessTokenAuthorizable {
  
  public var authorizationType: AuthorizationType {
    switch self {
    default:
      return .none
    }
  }
}

public class ServiceManager {
  
  static var plugins: [PluginType] = {
    [
      NetworkLoggerPlugin(verbose: true, cURL: true)
    ]
  }()
  
  
  let provider = MoyaProvider<MultiTarget>(plugins: plugins)
  
  var jsonDecoder: JSONDecoder {
    let jsonDecoder = JSONDecoder()
    jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
    return jsonDecoder
  }
  
  public static let shared = ServiceManager()
  
  private func handleResponse<M: Decodable>(
    _ result: Result<Response, MoyaError>,
    _ target: TargetType,
    completion: @escaping (_ result: APIResult<M>) -> Void )
  {
    switch result {
    case .success(let response):
      do {
        let filteredResponse = try response.filter(statusCodes: 200...399)
        let mappedResponse = try filteredResponse.map(M.self,
                                                      atKeyPath: nil,
                                                      using: self.jsonDecoder,
                                                      failsOnEmptyData: false)
        
        
        DispatchQueue.main.async {
          completion(.success(mappedResponse))
        }
      } catch MoyaError.statusCode(let response) {
        completion(.failure(MoyaError.jsonMapping(response)))
      } catch {
        debugPrint("##ERROR parsing##: \(error.localizedDescription)")
        let moyaError = MoyaError.jsonMapping(response)
        completion(.failure(moyaError))
      }
    case .failure(let error):
      debugPrint("##ERROR service:## \(error.localizedDescription)")
      completion(.failure(error))
    }
  }
  
  func fetch<M: Decodable, T: TargetType>(
    target: T,
    callbackQueue: DispatchQueue? = .none,
    completion: @escaping (_ result: APIResult<M>) -> Void )
  {
    provider.request(MultiTarget(target), callbackQueue: callbackQueue) { [weak self] (result) in
      self?.handleResponse(result, target, completion: completion)
    }
  }
}
