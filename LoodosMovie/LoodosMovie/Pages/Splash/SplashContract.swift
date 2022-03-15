//  
//  SplashContract.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 13.03.2022.
//

import Foundation

protocol SplashViewProtocol: BaseView {
  var presenter: SplashModule.Presenter! { get set }
  
  func updateAnimationView(animationJson: String)
}

protocol SplashInteractorProtocol: BaseInteractor {
  var presenter: SplashModule.Presenter! { get set }

  func getSplashAnimationFromFirebase()
}

protocol SplashPresenterProtocol: BasePresenter {
  var view: SplashModule.View! { get set }
  var interactor: SplashModule.Interactor! { get set }
  var router: SplashModule.Router! { get set }
  
  func didGetSplashAnimationFromFirebase(animationJson: String)
  func saveJsonAnimation(json: String)
  func prepareNavigationToMovieSearchVC()
}

protocol SplashRouterProtocol: BaseRouter {
  func navigationToMovieSearchVC()
}

struct SplashModule {
  typealias View = SplashViewProtocol
  typealias Interactor = SplashInteractorProtocol
  typealias Presenter = SplashPresenterProtocol
  typealias Router = SplashRouterProtocol
}

extension SplashModule.Presenter {
  var _view: BaseView? { view }
}

