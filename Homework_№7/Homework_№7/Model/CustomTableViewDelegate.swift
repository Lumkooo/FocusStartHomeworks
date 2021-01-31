//
//  CustomTableViewDelegate.swift
//  Homework_№7
//
//  Created by Андрей Шамин on 11/28/20.
//

import UIKit

final class CustomTableViewDelegate: NSObject {

    // MARK: - Constants

    private enum Constants {
        static let tableViewEstimatedHeight: CGFloat = 44
    }

    weak var delegate: MasterViewControllerDelegate?

    // MARK: - Init

    init(withDelegate delegate: MasterViewControllerDelegate) {
        self.delegate = delegate
    }
}

// MARK: - UITableViewDelegate

extension CustomTableViewDelegate: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selectedCell(index: indexPath.row)
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.tableViewEstimatedHeight
    }
}
