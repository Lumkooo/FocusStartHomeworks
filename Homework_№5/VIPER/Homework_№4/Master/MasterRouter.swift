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
    weak var vc: UIViewController?
}

// MARK: - IMasterRouter

extension MasterRouter: IMasterRouter {
    func showDetailViewController(on view: IMasterView, with dataModel: DataModel) {
        let detailViewController = DetailAssembly.createDetailController(with: dataModel)
        vc?.showDetailViewController(detailViewController, sender: nil)
    }
}
