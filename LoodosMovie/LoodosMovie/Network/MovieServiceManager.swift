//
//  MovieServiceManager.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 13.03.2022.
//

import Foundation

class MovieServiceManager: ServiceManager {
  
  static var connect = MovieServiceManager()
  
  public func searchMovie(search: String, page: String, completion: @escaping (SBH<SearchMovieResponse>)) {
    fetch(target: MovieAPI.search(text: search, page: page), completion: completion)
  }
  
  public func getMovieDetail(imdbId: String, completion: @escaping (SBH<MovieDetailResponse>)) {
    fetch(target: MovieAPI.movieDetail(imdbId: imdbId), completion: completion)
  }
}
