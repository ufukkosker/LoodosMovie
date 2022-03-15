//
//  MovieSearchEntity.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 15.03.2022.
//

import Foundation

// MARK: - SearchMovieResponse
public struct SearchMovieResponse: Codable {
    let search: [Movie]?
    let totalResults, response: String

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
}

// MARK: - Search
public struct Movie: Codable {
    let title, year, imdbID: String?
    let type: String?
    let poster: String?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}

