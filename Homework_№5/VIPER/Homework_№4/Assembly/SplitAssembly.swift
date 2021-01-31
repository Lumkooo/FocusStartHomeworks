//
//  SplitAssembly.swift
//  Homework_№5_VIPER
//
//  Created by Андрей Шамин on 11/27/20.
//

import UIKit

enum SplitAssembly {
    static func createSplitViewController() -> UISplitViewController {
        let splitViewController = UISplitViewController()

        let masterController = MasterAssembly.createMasterController()
        let navMasterController = UINavigationController(rootViewController: masterController)

        let detailController = DetailAssembly.createDetailController()
        let navigationDetailController = UINavigationController(rootViewController: detailController)

        splitViewController.viewControllers = [navMasterController, navigationDetailController]
        splitViewController.preferredDisplayMode = .oneBesideSecondary
        return splitViewController
    }
}
