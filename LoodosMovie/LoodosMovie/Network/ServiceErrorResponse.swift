//
//  ServiceErrorResponse.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 15.03.2022.
//

import Foundation

// MARK: - LoodosError
public struct LoodosError: Codable {
    let response, error: String

    enum CodingKeys: String, CodingKey {
        case response = "Response"
        case error = "Error"
    }
}
