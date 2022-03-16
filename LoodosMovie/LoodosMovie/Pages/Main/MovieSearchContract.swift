//  
//  MovieSearchContract.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 14.03.2022.
//

import Foundation

protocol MovieSearchViewProtocol: BaseView {
  var presenter: MovieSearchModule.Presenter! { get set }
  
  func updateMovieTableView(for movie: [MovieSearchModule.MovieTableItem])
}

protocol MovieSearchInteractorProtocol: BaseInteractor {
  var presenter: MovieSearchModule.Presenter! { get set }
  
  func fetchMovie(_ movieName: String, page: String)
}

protocol MovieSearchPresenterProtocol: BasePresenter {
  var view: MovieSearchModule.View! { get set }
  var interactor: MovieSearchModule.Interactor! { get set }
  var router: MovieSearchModule.Router! { get set }
  
  func didChangePage()
  func didSearchMovie(_ movieName: String)
  func didFetchSearchMovie(_ movie: [Movie])
  func showServiceErrorOnTableView(error message: String)
  func prepareNavigateToDetailVC(for model: MovieSearchModule.MovieViewModel)
}

protocol MovieSearchRouterProtocol: BaseRouter {
  
  func navigateToMovieDetailVC(with model: Movie)
}

struct MovieSearchModule {
  typealias View = MovieSearchViewProtocol
  typealias Interactor = MovieSearchInteractorProtocol
  typealias Presenter = MovieSearchPresenterProtocol
  typealias Router = MovieSearchRouterProtocol
}

extension MovieSearchModule.Presenter {
  var _view: BaseView? { view }
}

extension MovieSearchModule {
  
  enum MovieTableItem {
    case empty(errorDescription: String)
    case movie(model: MovieTableItemPagination)
    case lastPage
  }
  
  struct MovieViewModel {
    var title: String
    var year: String
    var imdbId: String
    var type: String
    var poster: String
  }
  
  struct MovieTableItemPagination {
    let title: String
    let movie: [MovieViewModel]
  }
}
 
