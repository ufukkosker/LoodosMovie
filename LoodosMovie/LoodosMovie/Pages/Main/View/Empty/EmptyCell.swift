//
//  EmptyCell.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 15.03.2022.
//

import UIKit
import Lottie

class EmptyCell: UITableViewCell, NibLoadable {
  
  @IBOutlet weak var animationView: AnimationView!
  @IBOutlet weak var errorTitleLabel: UILabel!
  @IBOutlet weak var errorDescriptionLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    selectionStyle = .none
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  func prepareErrorText(description: ServiceError) {
    BaseAlertManager.shared.prepareAlert(for: description) { alertModel in
      errorTitleLabel.text = alertModel.title
      errorDescriptionLabel.text = alertModel.description
      animationView.animation = alertModel.icon
      animationView.play()
    }
  }
}
