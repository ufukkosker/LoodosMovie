//  
//  SplashInteractor.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 13.03.2022.
//

import UIKit
import FirebaseRemoteConfig

class SplashInteractor: SplashModule.Interactor {
  
  private let remoteConfig = RemoteConfig.remoteConfig()
  var presenter: SplashModule.Presenter!
  
  func getSplashAnimationFromFirebase() {
    let defaults: [String: NSObject] = [
      "splashAnimation": false as NSObject
    ]
    
    remoteConfig.setDefaults(defaults)
    
    let settings = RemoteConfigSettings()
    settings.minimumFetchInterval = 0
    remoteConfig.configSettings = settings
    
    self.remoteConfig.fetch(withExpirationDuration: 0) { status, error in
      if status == .success, error == nil {
        self.remoteConfig.activate { _, error in
          guard error == nil else { return }
          let value = self.remoteConfig.configValue(forKey: "splashAnimation")
          let str = String(decoding: value.dataValue, as: UTF8.self)
          
          DispatchQueue.main.async {
            self.presenter.hideLoading()
            self.presenter.didGetSplashAnimationFromFirebase(animationJson: str)
            self.presenter.saveJsonAnimation(json: str)
          }
        }
      } else {
        
      }
    }
  }
}

