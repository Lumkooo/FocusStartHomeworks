//
//  DetailRouter.swift
//  Homework_№4
//
//  Created by Андрей Шамин on 11/13/20.
//

import UIKit

protocol IDetailRouter: class {
    static func createModule(with dataModel: DataModel) -> UIViewController
}

final class DetailRouter {

}

// MARK: - IDetailRouter

extension DetailRouter: IDetailRouter {
    static func createModule(with dataModel: DataModel) -> UIViewController {
        DetailAssembly.createModule(with: dataModel)
    }
}
