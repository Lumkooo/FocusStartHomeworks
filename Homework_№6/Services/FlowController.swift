//
//  FlowController.swift
//  Homework_№6
//
//  Created by Андрей Шамин on 11/23/20.
//

final class FlowController {
    let firstVC: INavigationSeed

    private let coordinatingController: CoordinatingController
    private var modules = [INavigationSeed]()

    init(coordinatingController: CoordinatingController) {
        self.coordinatingController = coordinatingController

        let presenter = ViewControllerPresenter()
        let viewController = ViewController(presenter: presenter)

        viewController.presenter = presenter
        viewController.presenter.router = ViewControllerRouter(coordinatingController: coordinatingController)
        viewController.presenter.interactor = ViewControllerInteractor()

        self.firstVC = viewController
        self.coordinatingController.registerFirst(module: .first, seed: self.firstVC)
        self.modules.append(self.makeSecond())
    }
}

private extension FlowController {
    func makeSecond() -> INavigationSeed {
        let presenter = SecondViewControllerPresenter()
        let viewController = SecondViewController(presenter: presenter)
        viewController.presenter = presenter
        self.coordinatingController.register(module: .second, seed: viewController)
        return viewController
    }
}
