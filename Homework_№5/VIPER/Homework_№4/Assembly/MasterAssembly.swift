//
//  MasterAssembly.swift
//  Homework_№5_VIPER
//
//  Created by Андрей Шамин on 11/26/20.
//

import UIKit

enum MasterAssembly {
    static func createMasterController() -> UIViewController {
        let interactor = MasterInteractor()
        let router = MasterRouter()
        let presenter = MasterPresenter(interactor: interactor, router: router)
        let masterController = MasterViewController(presenter: presenter)
        return masterController
    }
}
