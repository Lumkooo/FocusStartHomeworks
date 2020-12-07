//
//  CompanyTableViewDelegate.swift
//  Homework_№8
//
//  Created by Андрей Шамин on 12/6/20.
//

import UIKit

protocol ITableViewDelegate: class {
    func selectedCell(indexPath: IndexPath)
}

final class CustomTableViewDelegate: NSObject {

    // MARK: - Properties

    weak var delegate: ITableViewDelegate?

    // MARK: - Init

    init(withDelegate delegate: ITableViewDelegate) {
        self.delegate = delegate
    }
}

// MARK: - UITableViewDelegate

extension CustomTableViewDelegate: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.selectedCell(indexPath: indexPath)
    }
}
