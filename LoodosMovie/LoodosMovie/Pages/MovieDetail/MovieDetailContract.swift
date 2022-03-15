//  
//  MovieDetailContract.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 15.03.2022.
//

import Foundation

protocol MovieDetailViewProtocol: BaseView {
  var presenter: MovieDetailModule.Presenter! { get set }
  
  func updateMovieDetailViews(with model: MovieDetailResponse)
}

protocol MovieDetailInteractorProtocol: BaseInteractor {
  var presenter: MovieDetailModule.Presenter! { get set }
  var movie: Movie { get set }
  
  func fetchMovieDetail()
  
}

protocol MovieDetailPresenterProtocol: BasePresenter {
  var view: MovieDetailModule.View! { get set }
  var interactor: MovieDetailModule.Interactor! { get set }
  var router: MovieDetailModule.Router! { get set }
  
  func didFetchMovieDetail(with model: MovieDetailResponse)
}

protocol MovieDetailRouterProtocol: BaseRouter {

}

struct MovieDetailModule {
  typealias View = MovieDetailViewProtocol
  typealias Interactor = MovieDetailInteractorProtocol
  typealias Presenter = MovieDetailPresenterProtocol
  typealias Router = MovieDetailRouterProtocol
}

extension MovieDetailModule.Presenter {
  var _view: BaseView? { view }
}

