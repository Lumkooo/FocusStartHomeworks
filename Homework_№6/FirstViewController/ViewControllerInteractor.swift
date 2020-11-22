//
//  Interactor.swift
//  Homework_№6
//
//  Created by Андрей Шамин on 11/20/20.
//

import Foundation

protocol  IViewControllerInteractor {
    func load() -> String
}

final class ViewControllerInteractor {
}

extension ViewControllerInteractor: IViewControllerInteractor {
    func load() -> String {
        // Загрузка данных
        return "пусто"
    }
}
