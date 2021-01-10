//
//  SceneDelegate.swift
//  Homework_№8
//
//  Created by Андрей Шамин on 12/5/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let winScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: winScene)
        let navigationController = MainNavigationVCAssembly.createNavigaitionVC()
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
}

