//
//  MasterAssembly.swift
//  Homework_№5_CLEAN
//
//  Created by Андрей Шамин on 11/26/20.
//

import UIKit

enum MasterAssembly {
    static func createMasterController() -> UIViewController {
        let useCaseOne = MasterUseCaseOne()
        let interactor = MasterInteractor(useCaseOne: useCaseOne)
        let router = MasterRouter()
        let presenter = MasterPresenter(interactor: interactor, router: router)
        let masterController = MasterViewController(presenter: presenter)
        return masterController
    }

    static func createDetailController() -> UIViewController {
        let interactor = DetailInteractor()
        let router = DetailRouter()
        let presenter = DetailPresenter(interactor: interactor, router: router)
        let viewController = DetailViewController(presenter: presenter)
        return viewController
    }

    static func createSplitViewController() -> UISplitViewController {
        let splitViewController = UISplitViewController()

        let masterController = MasterAssembly.createMasterController()
        let navMasterController = UINavigationController(rootViewController: masterController)

        let detailController = MasterAssembly.createDetailController()
        let navigationDetailController = UINavigationController(rootViewController: detailController)

        splitViewController.viewControllers = [navMasterController, navigationDetailController]
        splitViewController.preferredDisplayMode = .oneBesideSecondary
        return splitViewController
    }

    static func showDetailViewController(on view: IMasterView, with dataModel: DataModel) {
        let detailViewController = DetailRouter.createModule(with: dataModel)
        guard let viewController = (view  as? MasterView)?.findViewController() else {
            fatalError("Произошла ошибка!")
        }
        viewController.splitViewController?.showDetailViewController(detailViewController, sender: nil)
    }
}
