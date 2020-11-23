//
//  Presenter.swift
//  Homework_№6
//
//  Created by Андрей Шамин on 11/20/20.
//

import Foundation

protocol  IViewControllerPresenter {
    var ui:IViewControllerUI? { get set }
    var router:IViewControllerRouter? { get set }
    var interactor:IViewControllerInteractor? { get set }
    func viewDidLoad(ui:IViewControllerUI)
    func buttonTapped()
}

final class ViewControllerPresenter  {
    var ui: IViewControllerUI?
    var router:IViewControllerRouter?
    var interactor:IViewControllerInteractor?
}

extension ViewControllerPresenter : IViewControllerPresenter  {

    func viewDidLoad(ui:IViewControllerUI) {
        self.ui = ui
        self.ui?.didTapButton = { [weak self] in
            self?.buttonTapped()
        }
    }

    func buttonTapped() {
        router?.showSecondViewController()
    }
}
