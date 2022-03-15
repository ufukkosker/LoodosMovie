//  
//  MovieSearchInteractor.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 14.03.2022.
//

import UIKit

class MovieSearchInteractor: MovieSearchModule.Interactor {
  
  let service = MovieServiceManager()
  var presenter: MovieSearchModule.Presenter!
  
  func fetchMovie(_ movieName: String, page: String) {
    presenter.showLoading()
    service.searchMovie(search: movieName, page: page) { result in
      switch result {
      case .success(let response):
        self.presenter.hideLoading()
        print(response.response)
        self.presenter.didFetchSearchMovie(response.search ?? [])
      case .failure(let error):
        self.presenter.hideLoading()
        self.presenter.showServiceErrorOnTableView(error: error.serviceError?.error ?? "")
      }
    }
  }
}

