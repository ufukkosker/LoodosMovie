//
//  CenterAlertView.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 14.03.2022.
//

import UIKit
import Lottie
class CenterAlertView: UIViewController {
  
  @IBOutlet weak var alertView: BaseViewConfig!
  @IBOutlet weak var animationView: AnimationView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  
  private var alertTitle: String?
  private var alertDescription: String?
  private var onAction: (() -> ())?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    animationView.play()
    animationView.loopMode = .loop
  }
  
  func showAlert(title: String? = nil, description: String? = nil, onAction: (() -> ())? = nil) {
    self.alertTitle = title
    self.alertDescription = description
    self.onAction = onAction
  }
  
  @IBAction func actionButtonTapped(_ sender: Any) {
    onAction?()
    dismiss(animated: true, completion: nil)
  }
}
