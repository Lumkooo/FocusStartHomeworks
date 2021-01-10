//
//  PersonsInteractor.swift
//  Homework_№8
//
//  Created by Андрей Шамин on 12/6/20.
//

import Foundation

protocol IPersonsInteractor {
    func loadInitialData()
    func getCompanyIndex() -> Int
    func removePerson(atIndex index: Int)
    func reloadData()
}

protocol IPersonsInteractorOuter: class {
    func showDataOnScreen(persons: [Person])
}

final class PersonsInteractor {

    // MARK: - Properties

    private var companyIndex: Int
    weak var presenter: IPersonsInteractorOuter?

    // MARK: - Init

    init(companyIndex: Int) {
        self.companyIndex = companyIndex
    }
}

// MARK: - IPersonsInteractor

extension PersonsInteractor: IPersonsInteractor {
    func loadInitialData() {
        let persons = CoreDataManager.sharedInstance.getPersonsForCompany(atCompanyIndex: self.companyIndex)
        self.presenter?.showDataOnScreen(persons: persons)
    }

    func getCompanyIndex() -> Int {
        return self.companyIndex
    }

    func removePerson(atIndex index: Int) {
        CoreDataManager.sharedInstance.removePersonAtIndex(index, atCompanyIndex: companyIndex)
        self.reload()
    }

    func reloadData() {
        self.reload()
    }
}


private extension PersonsInteractor {
    func reload() {
        let persons = CoreDataManager.sharedInstance.getPersonsForCompany(atCompanyIndex: self.companyIndex)
        self.presenter?.showDataOnScreen(persons: persons)
    }
}
