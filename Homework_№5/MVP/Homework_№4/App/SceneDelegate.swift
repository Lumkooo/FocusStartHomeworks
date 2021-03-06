//
//  SceneDelegate.swift
//  Homework_№4
//
//  Created by Андрей Шамин on 11/4/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let winScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: winScene)

        window?.backgroundColor = .white
        let splitViewController = SplitAssembly.createSplitViewController()
        splitViewController.delegate = self
        window?.rootViewController = splitViewController
        window?.makeKeyAndVisible()
    }
}

extension SceneDelegate: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
            return true
    }
}
