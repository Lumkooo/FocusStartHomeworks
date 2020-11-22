//
//  Presenter.swift
//  Homework_№6
//
//  Created by Андрей Шамин on 11/20/20.
//

import Foundation

protocol  IPresenter {
    var ui:IUI? { get set }
    var router:IRouter? { get set }
    var interactor:IInteractor? { get set }
    func viewDidLoad(ui:IUI)
    func buttonTapped()
}

final class ViewControllerPresenter  {
    var ui: IUI?
    var router:IRouter?
    var interactor:IInteractor?
}

extension ViewControllerPresenter : IPresenter  {

    func viewDidLoad(ui:IUI) {
        self.ui = ui
        self.ui?.didTapButton = { [weak self] in
            self?.buttonTapped()
        }
    }

    func buttonTapped() {
        router?.showSecondViewController()
    }
}
