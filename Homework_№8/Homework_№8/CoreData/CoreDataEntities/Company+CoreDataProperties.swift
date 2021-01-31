//
//  Company+CoreDataProperties.swift
//  Homework_№8
//
//  Created by Андрей Шамин on 12/5/20.
//
//

import Foundation
import CoreData


extension Company {

    @nonobjc public class func fetch() -> NSFetchRequest<Company> {
        return NSFetchRequest<Company>(entityName: "Company")
    }

    @NSManaged public var name: String
    @NSManaged public var persons: NSSet?

}

// MARK: Generated accessors for persons
extension Company {

    @objc(addPersonsObject:)
    @NSManaged public func addToPersons(_ value: Person)

    @objc(removePersonsObject:)
    @NSManaged public func removeFromPersons(_ value: Person)

    @objc(addPersons:)
    @NSManaged public func addToPersons(_ values: NSSet)

    @objc(removePersons:)
    @NSManaged public func removeFromPersons(_ values: NSSet)

}

extension Company : Identifiable {

}
