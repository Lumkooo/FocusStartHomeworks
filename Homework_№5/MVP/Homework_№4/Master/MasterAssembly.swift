//
//  MasterAssembly.swift
//  Homework_№5_MVP
//
//  Created by Андрей Шамин on 11/15/20.
//

import UIKit

enum MasterAssembly {
    static func createSecondModule(with dataModel:DataModel) -> UIViewController {
        let viewController = DetailViewController()
        let presenter: ViewToPresenterDetailProtocol = DetailPresenter(dataModel: dataModel)
        viewController.presenter = presenter
        viewController.presenter?.ui = DetailView()
        return viewController
    }

    static func createFirstModule() -> UISplitViewController {
        let presenter: ViewToPresenterProtocol = MasterPresenter()

        let masterController = MasterViewController(presenter: presenter)
        let navMasterController = UINavigationController(rootViewController: masterController)

        let detailController = DetailViewController()
        let navigationDetailController = UINavigationController(rootViewController: detailController)

        let splitViewController = UISplitViewController()
        splitViewController.viewControllers = [navMasterController, navigationDetailController]
        splitViewController.preferredDisplayMode = .oneBesideSecondary

        masterController.presenter = presenter

        return splitViewController

    }
}
