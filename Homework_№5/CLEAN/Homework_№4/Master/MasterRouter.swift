//
//  MainRouter.swift
//  Homework_№4
//
//  Created by Андрей Шамин on 11/13/20.
//

import UIKit

protocol IMasterRouter: class {
    func showDetailViewController(on view: IMasterView, with dataModel: DataModel)
}

final class MasterRouter {

}

// MARK: - IMasterRouter

extension MasterRouter: IMasterRouter {
    func showDetailViewController(on view: IMasterView, with dataModel: DataModel) {
        let detailViewController = DetailAssembly.createDetailController(with: dataModel)
        guard let viewController = (view  as? MasterView)?.findViewController() else {
            fatalError("Произошла ошибка!")
        }
        viewController.splitViewController?.showDetailViewController(detailViewController, sender: nil)
    }
}
