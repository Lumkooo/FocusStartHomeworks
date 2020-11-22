//
//  SecondViewControllerRouter.swift
//  Homework_№6
//
//  Created by Андрей Шамин on 11/20/20.
//

import UIKit

protocol ISecondViewControllerRouter {
    static func createModule() -> UIViewController
}

final class SecondViewControllerRouter: ISecondViewControllerRouter {

    static func createModule() -> UIViewController {

        let presenter = SecondViewControllerPresenter()
        let viewController = SecondViewController(presenter: presenter)

        viewController.presenter = presenter

        return viewController
    }
}
