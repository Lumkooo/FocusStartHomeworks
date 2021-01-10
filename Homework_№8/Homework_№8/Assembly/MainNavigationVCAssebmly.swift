//
//  MainNavigationVCAssebmly.swift
//  Homework_№8
//
//  Created by Андрей Шамин on 12/6/20.
//

import UIKit

enum MainNavigationVCAssembly {
    static func createNavigaitionVC()  -> UINavigationController{
        let companyVC = CompanyVCAssembly.createVC()
        let navigationVCController = UINavigationController(rootViewController: companyVC)

        return navigationVCController
    }
}
