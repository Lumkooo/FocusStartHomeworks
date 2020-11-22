//
//  Router.swift
//  Homework_№6
//
//  Created by Андрей Шамин on 11/20/20.
//

import UIKit

protocol IViewControllerRouter {
    static func createModule() -> UINavigationController
    func showSecondViewController(on view:IViewControllerUI)
}

final class ViewControllerRouter {

}

extension ViewControllerRouter: IViewControllerRouter {
    static func createModule() -> UINavigationController {

        let presenter = ViewControllerPresenter()
        let viewController = ViewController(presenter: presenter)
        let navController = UINavigationController(rootViewController: viewController)

        viewController.presenter = presenter
        viewController.presenter.router = ViewControllerRouter()
        viewController.presenter.interactor = ViewControllerInteractor()

        return navController
    }

    func showSecondViewController(on view:IViewControllerUI) {
        let secondViewController = SecondViewControllerRouter.createModule()
        guard let viewController = (view  as? CustomView)?.findViewController() as? ViewController else { fatalError("Произошла ошибка!")}
        viewController.navigationController?.show(secondViewController, sender: self)
    }
}
