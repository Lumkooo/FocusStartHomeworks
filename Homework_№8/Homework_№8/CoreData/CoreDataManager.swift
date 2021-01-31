//
//  CoreDataManager.swift
//  Homework_№8
//
//  Created by Андрей Шамин on 12/5/20.
//

import UIKit
import CoreData

final class CoreDataManager {

    // MARK: - Properties

    // Использование синглтона, чтобы на каждом из экранов не создавать экземпляр класса
    static let sharedInstance = CoreDataManager()
    private var companies: [Company] = []
    private let context: NSManagedObjectContext

    // MARK: - Init

    init() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Can not get appDelegate during Init")
        }
        self.context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Company> = Company.fetch()
        do {
            self.companies = try self.context.fetch(fetchRequest)
        } catch {
            // MARK: - Можно вывести ошибку пользователю
            assertionFailure("Can not fetch")
        }
    }

}

// MARK: - Работа с компаниями

extension CoreDataManager {
    
    // MARK: - Добавление компании

    func appendCompany(_ companyEntitie: CompanyEntitie) {
        let company = Company(context: self.context)
        company.name = companyEntitie.name
        self.companies.append(company)
        do {
            try self.context.save()
        } catch {
            self.context.rollback()
            assertionFailure("Can not append company")
        }
    }

    // MARK: - Удаление компании

    func removeCompany(atIndex index: Int) {
        if self.companies.count > index {
            self.companies.remove(at: index)
            let fetchRequest: NSFetchRequest<Company> = Company.fetch()
            do {
                let entitie = try self.context.fetch(fetchRequest)[index]
                self.context.delete(entitie)
                try self.context.save()
            } catch {
                self.context.rollback()
                assertionFailure("Can not remove company at index: \(index)")
            }
        } else {
            assertionFailure("Can not remove company at index: \(index).\nIndex is out of range")
        }
    }

    func getCompanies() -> [Company] {
        return self.companies
    }
}

// MARK: - Работа с работниками (Person)

extension CoreDataManager {
    
    // MARK: - Добавление работника
    
    func appendPerson(_ personEntity: PersonEntity, atCompanyIndex index: Int) {
        if self.companies.count > index {
            let company = companies[index]
            let person = Person(context: self.context)
            person.company = company
            person.name = personEntity.name
            person.age = Int16(personEntity.age)
            person.position = personEntity.position
            person.education = personEntity.education
            person.expirience = personEntity.expirience
            
            company.addToPersons(person)
            do {
                try self.context.save()
            } catch {
                self.context.rollback()
                assertionFailure("Can not append Person")
            }
        } else {
            fatalError("Can not append Perons at company with index: \(index).\nIndex is out of range")
        }
    }
    
    // MARK: - Удаление работника
    
    func removePersonAtIndex(_ index: Int, atCompanyIndex companyIndex: Int) {
        if self.companies.count > companyIndex {
            let company = companies[companyIndex]
            guard let persons = company.persons?.allObjects as? [Person] else {
                fatalError("oops, error during removing Person")
            }
            let person = persons[index]
            company.removeFromPersons(person)
            do {
                try self.context.save()
            } catch {
                self.context.rollback()
                assertionFailure("Can not remove Person at index \(index)")
            }
        } else {
            fatalError("Can not remove Perons at company with index: \(index).\nIndex is out of range")
        }
    }
    
    // MARK: - Получение списка работников
    
    func getPersonsForCompany(atCompanyIndex index: Int) -> [Person] {
        if self.companies.count > index {
            let company = companies[index]
            guard let persons = company.persons?.allObjects as? [Person] else {
                fatalError("oops, error during removing Person")
            }
            return persons
        } else {
            fatalError("Can not append Perons at company with index: \(index).\nIndex is out of range")
        }
    }
    
    // MARK: - Редактирование работника
    
    func editPersonForCompany(newPerson: PersonEntity, personIndex: Int, companyIndex: Int) {
        if self.companies.count > companyIndex {
            let company = companies[companyIndex]
            guard let persons = company.persons?.allObjects as? [Person] else {
                fatalError("oops, error during removing Person")
            }
            let person = persons[personIndex]
            
            person.name = newPerson.name
            person.age = Int16(newPerson.age)
            person.position = newPerson.position
            person.expirience = newPerson.expirience
            person.education = newPerson.education
            
            do {
                try self.context.save()
            } catch {
                self.context.rollback()
                assertionFailure("Error oocured during editing Person")
            }
        } else {
            fatalError("Can not edit Perons with index \(personIndex) at company with index: \(companyIndex).\nIndex is out of range")
        }
    }
}
