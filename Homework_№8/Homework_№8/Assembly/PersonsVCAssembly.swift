//
//  PersonsVCAssembly.swift
//  Homework_№8
//
//  Created by Андрей Шамин on 12/6/20.
//

import UIKit

enum PersonsVCAssembly {
    static func createVC(atCompanyIndex index: Int) -> UIViewController{
        let router = PersonsRouter()
        let interactor = PersonsInteractor(companyIndex: index)
        let presenter = PersonsPresenter(router: router, interactor: interactor)
        let companyViewController = PersonsViewController(presenter: presenter)

        interactor.presenter = presenter
        router.vc = companyViewController

        return companyViewController
    }
}
