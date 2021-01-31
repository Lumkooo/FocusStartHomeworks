//
//  CustomAssembly.swift
//  Homework_№7
//
//  Created by Андрей Шамин on 11/28/20.
//

import UIKit

enum CustomAssembly {
    static func createCustomViewController() -> UIViewController {
        let interactor = CustomInteractor()
        let presenter = CustomPresenter(interactor: interactor)
        let customViewController = CustomViewController(presenter: presenter)

        interactor.presenter = presenter

        return customViewController
    }
}
