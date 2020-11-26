//
//  MainRouter.swift
//  Homework_№4
//
//  Created by Андрей Шамин on 11/13/20.
//

import UIKit

protocol IMasterRouter: class {
    func showDetailViewController(on view: IMasterView, with dataModel: DataModel)
    static func createMasterController() -> UIViewController
    static func createDetailController() -> UIViewController
    static func createSplitViewController() -> UISplitViewController
}

final class MasterRouter {

}

// MARK: - IMasterRouter

extension MasterRouter: IMasterRouter {
    static func createMasterController() -> UIViewController {
        MasterAssembly.createMasterController()
    }

    static func createDetailController() -> UIViewController {
        MasterAssembly.createDetailController()
    }

    static func createSplitViewController() -> UISplitViewController {
        MasterAssembly.createSplitViewController()
    }

    func showDetailViewController(on view: IMasterView, with dataModel: DataModel) {
        MasterAssembly.showDetailViewController(on: view, with: dataModel)
    }
}
