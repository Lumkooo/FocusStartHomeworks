//
//  SecondViewControllerPresenter.swift
//  Homework_№6
//
//  Created by Андрей Шамин on 11/20/20.
//

import Foundation


protocol  ISecondViewControllerPresenter {
    var ui:ISecondViewControllerUI? { get set }
    func viewDidLoad(ui:ISecondViewControllerUI)
    func buttonTapped()
    func stopButtonTapped()
}

final class SecondViewControllerPresenter  {
    private let subject = Subject(state: .randomState())
    private var observer:IObserver?
    var ui: ISecondViewControllerUI?
    var timer:Timer?
}

extension SecondViewControllerPresenter : ISecondViewControllerPresenter  {
    func viewDidLoad(ui: ISecondViewControllerUI) {
        self.ui = ui

        observer = Observer(forUI: ui)
        if observer == nil { fatalError("Something went wrong") }
        subject.subscribe(observer!)
        
        self.ui?.didTapButton = { [weak self] in
            self?.buttonTapped()
        }
        self.ui?.didTapSecondButton = { [weak self] in
            self?.stopButtonTapped()
        }
    }

    func buttonTapped() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.subject.state = Subject.States.randomState()
        }
    }

    func stopButtonTapped() {
        self.timer?.invalidate()
    }
}
