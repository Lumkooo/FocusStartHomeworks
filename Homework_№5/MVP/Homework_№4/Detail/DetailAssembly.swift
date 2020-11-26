//
//  DetailAssembly.swift
//  Homework_№5_MVP
//
//  Created by Андрей Шамин on 11/26/20.
//

import UIKit

enum DetailAssembly {
    static func createModule(with dataModel: DataModel) -> UIViewController {
        print("DetailRouter создает DetailViewController.")

        let presenter = DetailPresenter(dataModel: dataModel)
        let viewController = DetailViewController(presenter: presenter)

        return viewController
    }
}
