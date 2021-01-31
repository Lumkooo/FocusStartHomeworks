//
//  CompanyRouter.swift
//  Homework_№8
//
//  Created by Андрей Шамин on 12/6/20.
//

import UIKit

protocol ICompanyRouter {
    func showPersonsScreen(atCompanyIndex index: Int)
    func showAddNewCompanyAlert()
}

protocol ICompanyRouterOuter: class {
    func addCompany(companyName: String)
}

final class CompanyRouter {
    weak var vc: UIViewController?
    weak var presenter: ICompanyRouterOuter?
}

// MARK: - ICompanyRouter

extension CompanyRouter: ICompanyRouter {
    func showPersonsScreen(atCompanyIndex index: Int) {
        let personVC = PersonsVCAssembly.createVC(atCompanyIndex: index)
        self.vc?.navigationController?.pushViewController(personVC, animated: true)
    }

    func showAddNewCompanyAlert() {
        let alert = AlertAssembly.createAlert { (companyName) in
            self.presenter?.addCompany(companyName: companyName)
        }
        self.vc?.navigationController?.present(alert, animated: true)
    }
}
