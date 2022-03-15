//  
//  SplashPresenter.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 13.03.2022.
//

import UIKit
import Network
class SplashPresenter: SplashModule.Presenter {
  
  var view: SplashModule.View!
  var interactor: SplashModule.Interactor!
  var router: SplashModule.Router!
  let network = NetworkReachability()
  
  private let jsonAnimation = JSONAnimation()
  
  func didGetSplashAnimationFromFirebase(animationJson: String) {
    view.updateAnimationView(animationJson: animationJson)
  }
  
  func notifyViewLoaded() {
    showLoading()
    if network.isNetworkAvailable() {
      self.hideLoading()
      self.interactor.getSplashAnimationFromFirebase()
    } else {
      self.showCenterError(title: .networkTitle, message: .networkDescription) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
          self.notifyViewLoaded()
        }
      }
    }
  }
  
  func saveJsonAnimation(json: String) {
    jsonAnimation.saveJsonAnimationInFile(fileName: "splashAnimation.json", json)
  }
  
  func prepareNavigationToMovieSearchVC() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
      self.router.navigationToMovieSearchVC()
    }
  }
}

