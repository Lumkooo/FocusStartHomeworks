//
//  CompanyTableViewDataSource.swift
//  Homework_№8
//
//  Created by Андрей Шамин on 12/6/20.
//

import UIKit

final class CompanyTableViewDataSource: NSObject {

    // MARK: Properties
    var companies: [Company] = []
    weak var delegate: ITableViewDataSource?

    // MARK: - Init

    init(delegate: ITableViewDataSource?) {
        self.delegate = delegate
    }
}

// MARK: UITableViewDataSource

extension CompanyTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.companies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.companyTableViewCellID, for: indexPath)

        let company = companies[indexPath.row]
        cell.textLabel?.text = company.name

        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.delegate?.cellRemoved(indexPath: indexPath)
        }
    }
}
