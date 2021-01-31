//
//  SceneDelegate.swift
//  Homework_№7
//
//  Created by Андрей Шамин on 11/28/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let winScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: winScene)

        let customVC = CustomAssembly.createCustomViewController()
        let navigationController = NavigationControllerAssembly.createNavigationController(for: customVC)
        self.window?.rootViewController = navigationController

        self.window?.makeKeyAndVisible()
    }
}

