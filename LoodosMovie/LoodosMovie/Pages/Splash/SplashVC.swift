//  
//  SplashVC.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 13.03.2022.
//

import UIKit
import Lottie
import FirebaseRemoteConfig

class SplashVC: UIViewController, SplashModule.View {
  
  @IBOutlet weak var animationView: AnimationView!
  
  private let jsonAnimation = JSONAnimation()
  var presenter: SplashModule.Presenter!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedAnimationView))
    animationView.addGestureRecognizer(tapGesture)
    presenter.notifyViewLoaded()
  }
  
  @objc func tappedAnimationView() {
    presenter.prepareNavigationToMovieSearchVC()
  }
  
  func updateAnimationView(animationJson: String) {
    
    self.jsonAnimation.readJsonAnimationFromFile(fileName: "splashAnimation.json") { jsonAnimation in
      DispatchQueue.main.async {
        self.animationView.animation = Animation.filepath(jsonAnimation)
        self.animationView.loopMode = .playOnce
        self.animationView.play()
      }
    }
  }
}
