//  
//  SplashRouter.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 13.03.2022.
//

import Foundation
import UIKit

class SplashRouter: SplashModule.Router {
  
  weak var viewController: UIViewController?
  
  func navigationToMovieSearchVC() {
    
    let vc = MovieSearchModule.createModule()
    let navigationController = UINavigationController(rootViewController: vc)
//    navigationController.navigationBar.isTranslucent = false
    navigationController.modalPresentationStyle = .fullScreen
    navigationController.modalTransitionStyle = .crossDissolve
    navigationController.navigationItem.largeTitleDisplayMode = .automatic
    navigationController.navigationBar.prefersLargeTitles = true
    viewController?.present(navigationController, animated: true, completion: nil)
  }
}
