//
//  CoordinatingController.swift
//  Homework_№6
//
//  Created by Андрей Шамин on 11/23/20.
//

import UIKit

protocol INavigationSeed: class {
    var vc: UIViewController { get }
}

enum NavigationModule {
    case first
    case second
}

protocol ICoordinatingController: class {
    func push(module: NavigationModule,  animated: Bool)
}

final class CoordinatingController {
    private var modules = [NavigationModule: INavigationSeed]()
    private var stack = [INavigationSeed]()

    func register(module: NavigationModule, seed: INavigationSeed) {
        self.modules[module] = seed
    }

    func registerFirst(module: NavigationModule, seed: INavigationSeed) {
        self.modules[module] = seed
        self.stack.append(seed)
    }
}

extension CoordinatingController: ICoordinatingController {
    func push(module: NavigationModule, animated: Bool) {
        guard let nextModule = self.modules[module] else {
            assertionFailure("Следующий модуль не зарегестрирован")
            return
        }
        if self.stack.last?.vc === nextModule.vc { self.stack.removeLast() }
        guard let navigationController = self.stack.last?.vc.navigationController else {
            assertionFailure("something went wrong with self.stack.last?.vc.navigationController")
            return
        }
        navigationController.pushViewController(nextModule.vc, animated: animated)
        self.stack.append(nextModule)
    }
}
