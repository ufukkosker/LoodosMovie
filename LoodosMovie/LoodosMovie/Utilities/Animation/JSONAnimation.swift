//
//  JSONAnimation.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 14.03.2022.
//

import Foundation

class JSONAnimation {
  
  static var shared = JSONAnimation()
  
  func saveJsonAnimationInFile(fileName: String, _ json: String) {
    do {
      if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
        let fileURL = documentDirectory.appendingPathComponent(fileName)
        let text = json
        try text.write(to: fileURL, atomically: false, encoding: .utf8)
        let savedText = try String(contentsOf: fileURL)
      }
    } catch {
      print("error:", error)
    }
  }
  
  func readJsonAnimationFromFile(fileName: String, completion: (String) -> ()) {
    if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
      let pathWithFileName = documentDirectory.appendingPathComponent(fileName)
      completion(pathWithFileName.path)
    }
  }
}
