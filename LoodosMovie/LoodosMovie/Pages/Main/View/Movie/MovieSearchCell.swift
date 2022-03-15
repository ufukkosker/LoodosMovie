//
//  MovieSearchCell.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 15.03.2022.
//

import UIKit
import Kingfisher

class MovieSearchCell: UITableViewCell, NibLoadable {
  
  @IBOutlet weak var posterImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var yearLabel: UILabel!
  @IBOutlet weak var typeLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    selectionStyle = .none
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  func prepareMovieCell(for model: MovieSearchModule.MovieViewModel) {
    if let url = URL(string: model.poster) {
      posterImageView.kf.setImage(with: url)
    }
    titleLabel.text = model.title
    yearLabel.text = model.year
    typeLabel.text = model.type
  }
}
