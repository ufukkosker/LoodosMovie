//  
//  MovieDetailVC.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 15.03.2022.
//

import UIKit

class MovieDetailVC: UIViewController, MovieDetailModule.View {
  
  @IBOutlet weak var posterImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var plotLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var genreLabel: UILabel!
  @IBOutlet weak var durationLabel: UILabel!
  @IBOutlet weak var directorLabel: UILabel!
  @IBOutlet weak var wirterLabel: UILabel!
  @IBOutlet weak var actorsLabel: UILabel!
  @IBOutlet weak var languageLabel: UILabel!
  @IBOutlet weak var awardsLabel: UILabel!
  @IBOutlet weak var movieRatingCircleView: CircleView!
  
  var presenter: MovieDetailModule.Presenter!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    presenter.notifyViewLoaded()
  }
  
  func updateMovieDetailViews(with model: MovieDetailResponse) {
    if let rating = Float(model.imdbRating ?? ""), let poster = URL(string: model.poster ?? "") {
      posterImageView.kf.setImage(with: poster)
      movieRatingCircleView.setProgressWithAnimation(duration: 1.5, value: rating / 10)
      titleLabel.text = model.title
      plotLabel.text = model.plot
      dateLabel.text = model.year
      genreLabel.text = model.genre
      durationLabel.text = model.runtime
      directorLabel.text = model.director
      wirterLabel.text = model.writer
      actorsLabel.text = model.actors
      languageLabel.text = model.language
      awardsLabel.text = model.awards
    }
    
    FirebaseEventManager.shared.movieDetailEvent(movie: model)
  }
}

