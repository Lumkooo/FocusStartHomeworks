//
//  OnePersonInteractor.swift
//  Homework_№8
//
//  Created by Андрей Шамин on 12/6/20.
//

import Foundation

protocol IOnePersonInteractor {
    func loadInitialData()
    func saveChanges(person: PersonEntity)
}

protocol IOnePersonInteractorOuter: class {
    func setupUIForPerson(person: Person)
    func goToPreviousVC()
}

final class OnePersonInteractor {
    private var personIndex: Int?
    private var companyIndex: Int
    private var delegate: PersonsScreenDelegate
    weak var presenter: IOnePersonInteractorOuter?

    init(personIndex: Int? = nil,
         companyIndex: Int,
         personsScreenDelegate: PersonsScreenDelegate) {
        self.personIndex = personIndex
        self.companyIndex = companyIndex
        self.delegate = personsScreenDelegate
    }
}

// MARK: - IOnePersonInteractor

extension OnePersonInteractor: IOnePersonInteractor {
    func loadInitialData() {
        if let personIndex = personIndex {
            // MARK: - Редактирование существующего работника, который записан под номером - personIndex
            let persons = CoreDataManager.sharedInstance.getPersonsForCompany(atCompanyIndex: companyIndex)
            let person = persons[personIndex]
            self.presenter?.setupUIForPerson(person: person)
        }
    }

    func saveChanges(person: PersonEntity) {
        if let personIndex = personIndex {
            // MARK: - Редактирование существующего работника, который записан под номером - personIndex
            CoreDataManager.sharedInstance.editPersonForCompany(newPerson: person,
                                                                personIndex: personIndex,
                                                                companyIndex: companyIndex)
        } else {
            // MARK: - Создание работника
            CoreDataManager.sharedInstance.appendPerson(person,
                                                        atCompanyIndex: self.companyIndex)
        }
        self.presenter?.goToPreviousVC()
        self.delegate.reloadView()
    }
}
