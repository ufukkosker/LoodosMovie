//
//  MovieSearchPresenter.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 14.03.2022.
//

import UIKit

class MovieSearchPresenter: MovieSearchModule.Presenter {
  
  var view: MovieSearchModule.View!
  var interactor: MovieSearchModule.Interactor!
  var router: MovieSearchModule.Router!
  private var searchText: String = ""
  private var pageNumber: Int = 1
  private var tableItems: [MovieSearchModule.MovieTableItem] = []
  
  func notifyViewLoaded() {
    
  }
  
  func didChangePage(page: String) {
    pageNumber += 1
    interactor.fetchMovie(searchText, page: String(pageNumber))
  }
  
  func didSearchMovie(_ movieName: String) {
    tableItems.removeAll()
    pageNumber = 1
    searchText = movieName
    interactor.fetchMovie(movieName, page: String(pageNumber))
  }
  
  func didFetchSearchMovie(_ movie: [Movie]) {
    
//    tableItems.append(contentsOf: movie.map({ .movie(model: makeMovieItem(item: $0)) }))
//    tableItems.append(contentsOf: movie.map({ .movie(model: .init(title: "1", movie: makeMovieItem(item: $0)))}))
    tableItems.append(.movie(model: .init(title: String(pageNumber), movie: movie.map({ makeMovieItem(item: $0)}))))
    view.updateMovieTableView(for: tableItems)
  }
  
  func showServiceErrorOnTableView(error message: String) {
    var tableItems: [MovieSearchModule.MovieTableItem] = []
    tableItems.append(.empty(errorDescription: message))
    view.updateMovieTableView(for: tableItems)
  }
  
  func prepareNavigateToDetailVC(for model: MovieSearchModule.MovieViewModel) {
    let selectedMovieModel = Movie(title: model.title, year: model.year, imdbID: model.imdbId, type: model.type, poster: model.poster)
    router.navigateToMovieDetailVC(with: selectedMovieModel)
  }
}

extension MovieSearchPresenter {
  
  private func makeMovieItem(item: Movie) -> MovieSearchModule.MovieViewModel {
    
    return .init(title: item.title ?? "", year: item.year ?? "", imdbId: item.imdbID ?? "", type: item.type ?? "", poster: item.poster ?? "")
  }
  
  func makeMovieItemPagination(item: Movie) -> MovieSearchModule.MovieTableItemPagination {
    
    return .init(title: String(pageNumber), movie: [.init(title: item.title ?? "", year: item.year ?? "", imdbId: item.imdbID ?? "", type: item.type ?? "", poster: item.poster ?? "")])
  }
}

