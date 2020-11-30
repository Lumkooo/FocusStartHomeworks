//
//  CustomTableViewDataSource.swift
//  Homework_№7
//
//  Created by Андрей Шамин on 11/28/20.
//

import UIKit

final class CustomTableViewDataSource: NSObject {

    // MARK: Properties
    var dataArray = [UIImage]()
}

// MARK: UITableViewDataSource
extension CustomTableViewDataSource: UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CustomTableViewCell.reuseIdentifier,
                for: indexPath) as? CustomTableViewCell
        else {
            assertionFailure(); return UITableViewCell()
        }

        if indexPath.row < dataArray.count {
            let image = dataArray[indexPath.row]
            cell.setupCell(image:image)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dataArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
