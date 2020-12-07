//
//  OnePersonPresenter.swift
//  Homework_№8
//
//  Created by Андрей Шамин on 12/6/20.
//

import Foundation

protocol IOnePersonPresenter {
    func viewDidLoad(ui: IOnePersonView)
}

final class OnePersonPresenter {
    private var interactor: IOnePersonInteractor
    private var router: IOnePersonRouter
    private weak var ui: IOnePersonView?

    init(router: IOnePersonRouter, interactor: IOnePersonInteractor) {
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - IOnePersonPresenter

extension OnePersonPresenter: IOnePersonPresenter {
    func viewDidLoad(ui: IOnePersonView) {
        self.ui = ui
        self.ui?.goToAlert = { [weak self] message in
            self?.router.showAddNewCompanyAlert(withMessage: message)
        }
        self.ui?.doneButtonTapped = { [weak self] personEntity in
            self?.interactor.saveChanges(person: personEntity)
        }
        self.interactor.loadInitialData()
    }
}

// MARK: - IOnePersonInteractorOuter

extension OnePersonPresenter: IOnePersonInteractorOuter {
    func goToPreviousVC() {
        self.router.popViewController()
    }

    func setupUIForPerson(person: Person) {
        self.ui?.setupUIForPerson(person: person)
    }
}
