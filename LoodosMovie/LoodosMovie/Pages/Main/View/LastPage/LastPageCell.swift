//
//  LastPageCell.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 16.03.2022.
//

import UIKit
import Lottie

class LastPageCell: UITableViewCell, NibLoadable {
  
  @IBOutlet weak var animationView: AnimationView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    animationView.loopMode = .loop
    animationView.play()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  func prepareMessage() {
    BaseInAppAlertManager.shared.prepareAlert(for: .lastPage, .lastPage, .lastPageDescription) { alertModel in
      titleLabel.text = alertModel.title
      descriptionLabel.text = alertModel.description
      animationView.animation = alertModel.icon
      animationView.loopMode = .loop
      animationView.play()
    }
  }
}
