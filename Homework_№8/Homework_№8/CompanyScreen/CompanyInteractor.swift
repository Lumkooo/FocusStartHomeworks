//
//  CompanyInteractor.swift
//  Homework_№8
//
//  Created by Андрей Шамин on 12/6/20.
//

import Foundation

protocol ICompanyInteractor {
    func loadInitialData()
    func appendCompany(companyName: String)
    func removeCompany(atIndexPath indexPath: IndexPath)
    func cellTapped(atIndexPath indexPath: IndexPath)
}

protocol ICompanyInteractorOuter: class {
    func showDataOnScreen(companies: [Company])
    func goToPersonsScreen(withCompanyIndex index: Int)
}

final class CompanyInteractor {
    weak var presenter: ICompanyInteractorOuter?
}

// MARK: - ICompanyInteractor

extension CompanyInteractor: ICompanyInteractor {
    func loadInitialData() {
        self.showDataOnScreen()
    }

    func appendCompany(companyName: String) {
        let company = CompanyEntitie(name: companyName)
        CoreDataManager.sharedInstance.appendCompany(company)
        self.showDataOnScreen()
    }

    func removeCompany(atIndexPath indexPath: IndexPath) {
        CoreDataManager.sharedInstance.removeCompany(atIndex: indexPath.row)
        self.showDataOnScreen()
    }

    func cellTapped(atIndexPath indexPath: IndexPath) {
        self.presenter?.goToPersonsScreen(withCompanyIndex: indexPath.row)
    }
}

private extension CompanyInteractor {
    func showDataOnScreen() {
        let companies = CoreDataManager.sharedInstance.getCompanies()
        self.presenter?.showDataOnScreen(companies: companies)
    }
}
