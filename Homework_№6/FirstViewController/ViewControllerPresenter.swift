//
//  Presenter.swift
//  Homework_№6
//
//  Created by Андрей Шамин on 11/20/20.
//

import Foundation

protocol  IViewControllerPresenter {
    var router:IViewControllerRouter? { get set }
    var interactor:IViewControllerInteractor? { get set }
    func buttonTapped()
}

final class ViewControllerPresenter  {
    var router:IViewControllerRouter?
    var interactor:IViewControllerInteractor?
}

extension ViewControllerPresenter : IViewControllerPresenter  {

    func buttonTapped() {
        router?.showSecondViewController()
    }
}
