//
//  SceneDelegate.swift
//  Homework_№6
//
//  Created by Андрей Шамин on 11/20/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let winScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: winScene)

        window?.backgroundColor = .white
        let navController = ViewControllerRouter.createModule()
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}

