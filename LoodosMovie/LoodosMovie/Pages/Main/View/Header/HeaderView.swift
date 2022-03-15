//
//  HeaderView.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 15.03.2022.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView {
  
  lazy var containerView: UIView = {
    let view = UIView()
    view.backgroundColor = .secondarySystemBackground
    return view
  }()
  
  lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.SFPro(.heavy, size: 16)
    return label
  }()

  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)
    prepareSubViews()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    prepareSubViews()
  }
  
  
  private func prepareSubViews() {
    backgroundColor = .clear
    addSubviewForAutoLayout(containerView)
    containerView.addSubviewForAutoLayout(titleLabel)
    
    NSLayoutConstraint.activate([
      containerView.heightAnchor.constraint(equalToConstant: 30),
      titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
      titleLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
    ])
  }
}
