//
//  AlertAssembly.swift
//  Homework_№8
//
//  Created by Андрей Шамин on 12/7/20.
//

import UIKit

enum AlertAssembly {
    static func createAlert(completion: @escaping ((String) -> Void)) -> UIAlertController {
        let alert = UIAlertController(title: "Добавление компании",
                                      message: "Введите название компании",
                                      preferredStyle: .alert)
        alert.addTextField()
        let addAlertAction = UIAlertAction(title: "Добавить", style: .default) { (action) in
            guard let companyTF = alert.textFields?[0],
                  let companyName = companyTF.text else {
                fatalError("ooops")
            }
            completion(companyName)
        }
        let cancelAlertAction = UIAlertAction(title: "Отменить", style: .cancel)
        alert.addAction(addAlertAction)
        alert.addAction(cancelAlertAction)

        return alert
    }
}
