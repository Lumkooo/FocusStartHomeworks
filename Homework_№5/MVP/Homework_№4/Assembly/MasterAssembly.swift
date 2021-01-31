//
//  MasterAssembly.swift
//  Homework_№5_MVP
//
//  Created by Андрей Шамин on 11/15/20.
//

import UIKit

enum MasterAssembly {

    static func createMasterController() -> UIViewController {
        let presenter = MasterPresenter()
        let masterController = MasterViewController(presenter: presenter)
        return masterController
    }
}
