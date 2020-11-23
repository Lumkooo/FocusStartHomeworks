//
//  SceneDelegate.swift
//  Homework_№6
//
//  Created by Андрей Шамин on 11/20/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private let coordinatingController = CoordinatingController()
    private lazy var flowController = FlowController(coordinatingController: self.coordinatingController)
    private lazy var nc: UINavigationController = {
        UINavigationController(rootViewController: self.flowController.firstVC.vc)
    }()


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let winScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: winScene)

        window?.backgroundColor = .white
        self.window?.rootViewController = self.nc
        window?.makeKeyAndVisible()
    }
}

