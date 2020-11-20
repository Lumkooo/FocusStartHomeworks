//
//  Interactor.swift
//  Homework_№6
//
//  Created by Андрей Шамин on 11/20/20.
//

import Foundation

protocol  IViewControllerInteractor {
    var presenter: IViewControllerPresenter? { get set }
    func load() -> String
}

final class ViewControllerInteractor {
    var presenter: IViewControllerPresenter?
    private var someData:String?
}

extension ViewControllerInteractor: IViewControllerInteractor {
    func load() -> String {
        // Загрузка данных
        return "пусто"
    }
}
