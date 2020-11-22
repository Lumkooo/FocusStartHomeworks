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
        self.ui?.didTapSecondButton = {
            print("Эта кнопка не умеет ничего =)\nПросто создание элементов при помощи Builder-ов")
        }
    }

    func buttonTapped() {
        guard let ui = self.ui else { fatalError("Something went wrong")}
        router?.showSecondViewController(on: ui)
    }
}
