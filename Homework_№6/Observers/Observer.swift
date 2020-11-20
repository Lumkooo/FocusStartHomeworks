//
//  Observer.swift
//  Homework_№6
//
//  Created by Андрей Шамин on 11/20/20.
//

import Foundation


protocol IObserver: class {
    func update(subject: Subject)
}

final class Observer: IObserver {

    var ui: ISecondViewControllerUI?

    init(forUI ui:ISecondViewControllerUI) {
        self.ui = ui
    }
    
    func update(subject: Subject) {
        ui?.stateChanged(toState: subject.state)
    }
}
