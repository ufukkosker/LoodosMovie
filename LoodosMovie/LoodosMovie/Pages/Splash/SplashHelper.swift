//  
//  SplashHelper.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 13.03.2022.
//

import UIKit

extension SplashModule {
  
  static func createModule() -> UIViewController {
    let view = SplashVC()
    let interactor = SplashInteractor()
    let presenter = SplashPresenter()
    let router = SplashRouter()
    
    view.presenter = presenter
    interactor.presenter = presenter
    presenter.view = view
    presenter.interactor = interactor
    presenter.router = router
    router.viewController = view
    
    return view
  }
}

