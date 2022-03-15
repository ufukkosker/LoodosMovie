//  
//  MovieSearchRouter.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 14.03.2022.
//

import Foundation
import UIKit

class MovieSearchRouter: MovieSearchModule.Router {
  
  weak var viewController: UIViewController?
  
  func navigateToMovieDetailVC(with model: Movie) {
    let vc = MovieDetailModule.createModule(with: model)
    viewController?.navigationController?.pushViewController(vc, animated: true)
  }
}
