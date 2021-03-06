//
//  CircleView.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 15.03.2022.
//

import UIKit

//@IBDesignable
class CircleView: UIView {
  
  var progressLayer = CAShapeLayer()
  var trackLayer = CAShapeLayer()
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    makeCircularPath()
  }
  
  @IBInspectable var progressColor: UIColor? {
    get {
      return UIColor(cgColor: progressLayer.strokeColor ?? UIColor.yellow.cgColor)
    }
    set {
      progressLayer.strokeColor = newValue?.cgColor
    }
  }
  
  @IBInspectable var trackColor: UIColor? {
    get {
      return UIColor(cgColor: trackLayer.strokeColor ?? UIColor.red.cgColor)
    }
    set {
      trackLayer.strokeColor = newValue?.cgColor
    }
  }
  
  func makeCircularPath() {
    self.backgroundColor = UIColor.clear
    self.layer.cornerRadius = self.frame.size.width / 2
    let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2, y: frame.size.height / 2), radius: (frame.size.width - 1.5) / 2, startAngle: CGFloat(-0.5 * .pi), endAngle: CGFloat(1.5 * .pi), clockwise: true)
    trackLayer.path = circlePath.cgPath
    trackLayer.fillColor = UIColor.clear.cgColor
    trackLayer.strokeColor = trackColor?.cgColor
    trackLayer.lineWidth = 5.0
    trackLayer.strokeEnd = 1.0
    layer.addSublayer(trackLayer)
    progressLayer.path = circlePath.cgPath
    progressLayer.fillColor = UIColor.clear.cgColor
    progressLayer.strokeColor = progressColor?.cgColor
    progressLayer.lineWidth = 6.0
    progressLayer.strokeEnd = 0.0
    layer.addSublayer(progressLayer)
  }
  
  func setProgressWithAnimation(duration: TimeInterval, value: Float) {
    let animation = CABasicAnimation(keyPath: "strokeEnd")
    animation.duration = duration
    animation.fromValue = 0
    animation.toValue = value
    animation.timingFunction = CAMediaTimingFunction(name: .linear)
    progressLayer.strokeEnd = CGFloat(value)
    progressLayer.add(animation, forKey: "animateprogress")
  }
}

