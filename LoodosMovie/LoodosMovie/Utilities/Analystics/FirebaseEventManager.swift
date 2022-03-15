//
//  FirebaseEventManager.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 15.03.2022.
//

import UIKit
import Firebase

class FirebaseEventManager {
  
  static let shared = FirebaseEventManager()
  
  func movieDetailEvent(movie: MovieDetailResponse){
    Analytics.logEvent("selectedMovie", parameters: [
      "phoneid": "\(UIDevice.current.identifierForVendor?.uuidString ?? "")",
      "title": "\(movie.title ?? "")",
      "rating": "\(movie.imdbRating ?? "")",
      "plot": "\(movie.plot ?? "")",
      "year": "\(movie.year ?? "")",
      "genre": "\(movie.genre ?? "")",
      "runtime": "\(movie.runtime ?? "")",
      "director": "\(movie.director ?? "")",
      "writer": "\(movie.writer ?? "")",
      "actors": "\(movie.actors ?? "")",
      "language": "\(movie.language ?? "")",
      "awards": "\(movie.awards ?? "")"
    ]);
  }
}
