//  
//  MovieDetailHelper.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 15.03.2022.
//

import UIKit

extension MovieDetailModule {
  
  static func createModule(with model: Movie) -> UIViewController {
    let view = MovieDetailVC()
    let interactor = MovieDetailInteractor(movie: model)
    let presenter = MovieDetailPresenter()
    let router = MovieDetailRouter()
    
    view.presenter = presenter
    interactor.presenter = presenter
    presenter.view = view
    presenter.interactor = interactor
    presenter.router = router
    router.viewController = view
    
    return view
  }
}

