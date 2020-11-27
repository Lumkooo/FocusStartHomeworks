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
        interactor.presenter = presenter
        router.vc = masterController
        return masterController
    }
}
