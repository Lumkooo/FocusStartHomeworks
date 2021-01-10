//
//  PersonsPresenter.swift
//  Homework_№8
//
//  Created by Андрей Шамин on 12/6/20.
//

import Foundation


protocol IPersonsPresenter {
    func viewDidLoad(ui: IPersonsView)
    func addNewPerson()
}

protocol PersonsScreenDelegate: class {
    func reloadView()
}

final class PersonsPresenter {
    weak var ui: IPersonsView?
    private var interactor: IPersonsInteractor
    private var router: IPeronsRouter

    // MARK: - Init

    init(router: IPeronsRouter, interactor: IPersonsInteractor) {
        self.router = router
        self.interactor = interactor
    }
}

// MARK: - IPersonsPresenter

extension PersonsPresenter: IPersonsPresenter {
    func viewDidLoad(ui: IPersonsView) {
        self.ui = ui

        self.ui?.cellRemoved = { [weak self] indexPath in
            self?.interactor.removePerson(atIndex: indexPath.row)
        }

        self.ui?.cellTapped = { [weak self] indexPath in
            guard let self = self else { return }
            let companyIndex = self.interactor.getCompanyIndex()
            let personIndex = indexPath.row
            self.router.showEditPersonVC(editingPersonIndex: personIndex,
                                          companyIndex: companyIndex,
                                          personsScreenDelegate: self)
        }

        self.interactor.loadInitialData()
    }

    func addNewPerson() {
        let companyIndex = self.interactor.getCompanyIndex()
        self.router.showAddNewPersonVC(companyIndex: companyIndex,
                                       personsScreenDelegate: self)
    }
}

// MARK: - IPersonsInteractorOuter

extension PersonsPresenter: IPersonsInteractorOuter {
    func showDataOnScreen(persons: [Person]) {
        self.ui?.showDataOnScreen(persons: persons)
    }
}

// MARK: - PersonsScreenDelegate

extension PersonsPresenter: PersonsScreenDelegate {
    func reloadView() {
        self.interactor.loadInitialData()
    }
}
