//
//  PersonsRouter.swift
//  Homework_№8
//
//  Created by Андрей Шамин on 12/6/20.
//

import UIKit

protocol IPeronsRouter {
    func showEditPersonVC(editingPersonIndex index: Int,
                          companyIndex: Int,
                          personsScreenDelegate: PersonsScreenDelegate)
    func showAddNewPersonVC(companyIndex: Int,
                            personsScreenDelegate: PersonsScreenDelegate)
}

final class PersonsRouter {
    weak var vc: UIViewController?
}

// MARK: - IPeronsRouter

extension PersonsRouter: IPeronsRouter {
    func showEditPersonVC(editingPersonIndex index: Int,
                          companyIndex: Int,
                          personsScreenDelegate: PersonsScreenDelegate) {
        let personVC = OnePersonVCAssembly.createVC(personIndex: index,
                                                    companyIndex: companyIndex,
                                                    personsScreenDelegate: personsScreenDelegate)
        self.vc?.navigationController?.pushViewController(personVC, animated: true)
    }
    
    func showAddNewPersonVC(companyIndex: Int,
                            personsScreenDelegate: PersonsScreenDelegate) {
        let personVC = OnePersonVCAssembly.createVC(companyIndex: companyIndex,
                                                    personsScreenDelegate: personsScreenDelegate)
        self.vc?.navigationController?.pushViewController(personVC, animated: true)
        
    }
}
