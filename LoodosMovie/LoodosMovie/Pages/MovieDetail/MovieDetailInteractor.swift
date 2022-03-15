//  
//  MovieDetailInteractor.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 15.03.2022.
//

import UIKit

class MovieDetailInteractor: MovieDetailModule.Interactor {

  private let service = MovieServiceManager()
  var movie: Movie
  var presenter: MovieDetailModule.Presenter!
  
  init(movie: Movie) {
    self.movie = movie
  }
  
  func fetchMovieDetail() {
    guard let imdbId = movie.imdbID else { return }
    service.getMovieDetail(imdbId: imdbId) { result in
      switch result {
      case .success(let response):
        self.presenter.didFetchMovieDetail(with: response)
      case .failure(_):
        break
      }
    }
  }
}

