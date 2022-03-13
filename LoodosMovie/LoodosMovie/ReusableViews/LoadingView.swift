//
//  LoadingView.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 11.03.2022.
//

import Foundation
import UIKit
import Lottie

class LoadingView: UIView {
  
  private(set) lazy var animatedImageView: AnimationView = {
    let view = AnimationView(name: "loading")
    view.loopMode = .loop
    view.contentMode = .scaleAspectFit
    return view
  }()
  
  init() {
    super.init(frame: .zero)
    setup()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

// MARK: - Public

extension LoadingView {
  func showIn(view: UIView?) {
    guard let view = view else { return }

    animatedImageView.play()
    
    view.endEditing(true)
    frame = view.bounds
    autoresizingMask = [.flexibleWidth, .flexibleHeight]
    view.addSubview(self)
  }
}

// MARK: - Private

private extension LoadingView {
  func setup() {
    backgroundColor = UIColor.black.withAlphaComponent(0.6)
    
    let container = UIView()
    container.backgroundColor = .clear
    container.clipsToBounds = true
    container.cornerRadius = 20
    
    addSubview(container)
    container.addSubview(animatedImageView)
    
    container.translatesAutoresizingMaskIntoConstraints = false
    animatedImageView.translatesAutoresizingMaskIntoConstraints = false
    
    let margin: CGFloat = 20
    NSLayoutConstraint.activate([
      container.centerXAnchor.constraint(equalTo: centerXAnchor),
      container.centerYAnchor.constraint(equalTo: centerYAnchor),
      container.widthAnchor.constraint(equalTo: container.heightAnchor),
      
      animatedImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2),
      animatedImageView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: margin),
      animatedImageView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -margin),
      animatedImageView.topAnchor.constraint(equalTo: container.topAnchor, constant: margin),
      animatedImageView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -margin)
    ])
  }
}
