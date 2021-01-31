//
//  PersonsTableViewDataSource.swift
//  Homework_№8
//
//  Created by Андрей Шамин on 12/6/20.
//

import UIKit

final class PersonsTableViewDataSource: NSObject {

    // MARK: Properties
    var persons: [Person] = []
    weak var delegate: ITableViewDataSource?

    // MARK: - Init

    init(delegate: ITableViewDataSource?) {
        self.delegate = delegate
    }

}

// MARK: UITableViewDataSource

extension PersonsTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.persons.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.personsTableViewCellID, for: indexPath)

        let person = persons[indexPath.row]
        cell.textLabel?.text = person.name

        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.delegate?.cellRemoved(indexPath: indexPath)
        }
    }
}
