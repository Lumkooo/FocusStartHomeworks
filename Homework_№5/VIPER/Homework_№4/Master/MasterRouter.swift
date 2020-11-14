//
//  MainRouter.swift
//  Homework_№4
//
//  Created by Андрей Шамин on 11/13/20.
//

import UIKit

class MasterRouter: PresenterToRouterProtocol {

    static func createModule() -> UISplitViewController {
        print("MasterRouter инициализирует UISplitViewController.")

        let masterController = MasterViewController()
        let navMasterController = UINavigationController(rootViewController: masterController)

        let detailController = DetailViewController()
        let navigationDetailController = UINavigationController(rootViewController: detailController)

        let splitViewController = UISplitViewController()
        splitViewController.viewControllers = [navMasterController, navigationDetailController]
        splitViewController.preferredDisplayMode = .oneBesideSecondary

        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = MasterPresenter()

        masterController.presenter = presenter
        masterController.presenter?.router = MasterRouter()
        masterController.presenter?.view = masterController
        masterController.presenter?.interactor = MasterInteractor()
        masterController.presenter?.interactor?.presenter = presenter

        return splitViewController
    }

    // MARK: - Navigation

    func showDetailViewController(on view: MasterViewPresenter, with dataModel: DataModel) {
        print("MasterRouter начинает показ DetailViewController как DetailViewController SplitViewController-а.")
        let detailViewController = DetailRouter.createModule(with: dataModel)
        guard let viewController = view as? MasterViewController else { fatalError("Произошла ошибка!")}
        viewController.splitViewController?.showDetailViewController(detailViewController, sender: nil)
    }
}
