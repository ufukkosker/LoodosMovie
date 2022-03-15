//  
//  MovieDetailPresenter.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 15.03.2022.
//

import UIKit

class MovieDetailPresenter: MovieDetailModule.Presenter {

  var view: MovieDetailModule.View!
  var interactor: MovieDetailModule.Interactor!
  var router: MovieDetailModule.Router!
  
  func notifyViewLoaded() {
    interactor.fetchMovieDetail()
  }
  
  func didFetchMovieDetail(with model: MovieDetailResponse) {
    view.updateMovieDetailViews(with: model)
  }
}

