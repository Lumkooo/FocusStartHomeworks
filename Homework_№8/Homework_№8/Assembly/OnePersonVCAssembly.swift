//
//  OnePersonVCAssembly.swift
//  Homework_№8
//
//  Created by Андрей Шамин on 12/6/20.
//

import UIKit

enum OnePersonVCAssembly {
    static func createVC(personIndex: Int? = nil,
                         companyIndex: Int,
                         personsScreenDelegate: PersonsScreenDelegate) -> UIViewController {
        let router = OnePersonRouter()
        let interactor = OnePersonInteractor(personIndex: personIndex,
                                             companyIndex: companyIndex,
                                             personsScreenDelegate: personsScreenDelegate)
        let presenter = OnePersonPresenter(router: router, interactor: interactor)
        let viewController = OnePersonViewController(presenter: presenter)

        interactor.presenter = presenter
        router.vc = viewController

        return viewController
    }
}
