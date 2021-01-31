//
//  CompanyVCAssembly.swift
//  Homework_№8
//
//  Created by Андрей Шамин on 12/6/20.
//

import UIKit

enum CompanyVCAssembly {
    static func createVC() -> UIViewController{
        let router = CompanyRouter()
        let interactor = CompanyInteractor()
        let presenter = CompanyPresenter(router: router, interactor: interactor)
        let companyViewController = CompanyViewController(presenter: presenter)

        interactor.presenter = presenter
        router.vc = companyViewController
        router.presenter = presenter

        return companyViewController
    }
}
