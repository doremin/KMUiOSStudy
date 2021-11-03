//
//  SceneDelegate.swift
//  Routine
//
//  Created by doremin on 2021/11/02.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    self.window = UIWindow(windowScene: windowScene)
    self.window?.rootViewController = RoutineViewController()
    self.window?.makeKeyAndVisible()
  }
}
