//
//  NavigationControllerAssembly.swift
//  Homework_№7
//
//  Created by Андрей Шамин on 11/28/20.
//

import UIKit

enum NavigationControllerAssembly {
    static func createNavigationController(for viewController:UIViewController) -> UINavigationController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        return navController
    }
}
