//
//  Person+CoreDataProperties.swift
//  Homework_№8
//
//  Created by Андрей Шамин on 12/5/20.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String
    @NSManaged public var age: Int16
    @NSManaged public var position: String
    @NSManaged public var education: String?
    @NSManaged public var expirience: String?
    @NSManaged public var company: Company?

}

extension Person : Identifiable {

}
