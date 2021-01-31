//
//  CompanyPresenter.swift
//  Homework_№8
//
//  Created by Андрей Шамин on 12/6/20.
//

import Foundation

protocol ICompanyPresenter {
    func viewDidLoad(ui: ICompanyView)
    func addingNewCompany()
}

final class CompanyPresenter {
    weak var ui: ICompanyView?
    private var interactor: ICompanyInteractor
    private var router: ICompanyRouter

    init(router: ICompanyRouter, interactor: ICompanyInteractor) {
        self.router = router
        self.interactor = interactor
    }
}

extension CompanyPresenter: ICompanyPresenter {
    func viewDidLoad(ui: ICompanyView) {
        self.ui = ui

        self.ui?.cellRemoved = { [weak self] indexPath in
            self?.interactor.removeCompany(atIndexPath: indexPath)
        }

        self.ui?.cellTapped = { [weak self] indexPath in
            self?.interactor.cellTapped(atIndexPath: indexPath)
        }

        self.interactor.loadInitialData()
    }

    func addingNewCompany() {
        self.router.showAddNewCompanyAlert()
    }
}

// MARK: - ICompanyInteractorOuter

extension CompanyPresenter: ICompanyInteractorOuter {
    func goToPersonsScreen(withCompanyIndex index: Int) {
        self.router.showPersonsScreen(atCompanyIndex: index)
    }

    func showDataOnScreen(companies: [Company]) {
        self.ui?.showDataOnScreen(companies: companies)
    }
}

// MARK: - ICompanyRouterOuter

extension CompanyPresenter: ICompanyRouterOuter {
    func addCompany(companyName: String) {
        self.interactor.appendCompany(companyName: companyName)
    }
}
