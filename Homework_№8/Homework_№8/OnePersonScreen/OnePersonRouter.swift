//
//  OnePersonRouter.swift
//  Homework_№8
//
//  Created by Андрей Шамин on 12/6/20.
//

import UIKit

protocol IOnePersonRouter {
    func showAddNewCompanyAlert(withMessage message: String)
    func popViewController()
}

final class OnePersonRouter {
    weak var vc: UIViewController?
}

// MARK: - IOnePersonRouter

extension OnePersonRouter: IOnePersonRouter {

    func showAddNewCompanyAlert(withMessage message: String) {
        let alert = UIAlertController(title: "Ошибка",
                                      message: message,
                                      preferredStyle: .alert)
        let okAlertAction = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(okAlertAction)
        self.vc?.navigationController?.present(alert, animated: true)
    }

    func popViewController() {
        self.vc?.navigationController?.popViewController(animated: true)
    }
}
