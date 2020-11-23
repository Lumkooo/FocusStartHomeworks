//
//  Router.swift
//  Homework_№6
//
//  Created by Андрей Шамин on 11/20/20.
//

import UIKit

protocol IViewControllerRouter {
    func showSecondViewController()
}

final class ViewControllerRouter {
    private let coordinatingController: CoordinatingController

    init(coordinatingController: CoordinatingController) {
        self.coordinatingController = coordinatingController
    }
}

extension ViewControllerRouter: IViewControllerRouter {

    func showSecondViewController() {
        self.coordinatingController.push(module: .second, animated: true)
    }
}
