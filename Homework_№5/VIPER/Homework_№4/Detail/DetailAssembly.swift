//
//  DetailAssembly.swift
//  Homework_№5_VIPER
//
//  Created by Андрей Шамин on 11/26/20.
//

import UIKit

enum DetailAssembly {
    static func createModule(with dataModel: DataModel) -> UIViewController {
        print("DetailRouter создает DetailViewController.")

        let interactor = DetailInteractor(dataModel: dataModel)
        let router = DetailRouter()
        let presenter = DetailPresenter(interactor: interactor, router: router)
        let viewController = DetailViewController(presenter: presenter)

        return viewController
    }
}
