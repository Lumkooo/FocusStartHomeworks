//
//  DetailRouter.swift
//  Homework_№4
//
//  Created by Андрей Шамин on 11/13/20.
//

import UIKit

class DetailRouter: PresenterToRouterDetailProtocol {

    static func createModule(with dataModel: DataModel) -> UIViewController {
        print("DetailRouter создает DetailViewController.")
        let viewController = DetailViewController()

        let presenter: ViewToPresenterDetailProtocol & InteractorToPresenterDetailProtocol = DetailPresenter()

        viewController.presenter = presenter
        viewController.presenter?.router = DetailRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = DetailInteractor()
        viewController.presenter?.interactor?.dataModel = dataModel
        viewController.presenter?.interactor?.presenter = presenter

        return viewController
    }
}
