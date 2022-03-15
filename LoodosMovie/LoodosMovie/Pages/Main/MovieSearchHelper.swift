//  
//  MovieSearchHelper.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 14.03.2022.
//

import UIKit

extension MovieSearchModule {
  
  static func createModule() -> UIViewController {
    let view = MovieSearchVC()
    let interactor = MovieSearchInteractor()
    let presenter = MovieSearchPresenter()
    let router = MovieSearchRouter()
    
    view.presenter = presenter
    interactor.presenter = presenter
    presenter.view = view
    presenter.interactor = interactor
    presenter.router = router
    router.viewController = view
    
    return view
  }
}

