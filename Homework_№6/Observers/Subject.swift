//
//  Subject.swift
//  Homework_№6
//
//  Created by Андрей Шамин on 11/20/20.
//

import Foundation
class Subject {

    // MARK: - States

    enum States: Int {
        case first
        case second
        case third

        private static let count: States.RawValue = {
            var maxValue: Int = 0
            while let _ = States(rawValue: maxValue) {
                maxValue += 1
            }
            return maxValue
        }()

        static func randomState() -> States {
            let rand = arc4random_uniform(UInt32(count))
            return States(rawValue: Int(rand)) ?? States.first
        }
    }

    // MARK: - Properties

    private lazy var observers = [IObserver]()
    var state : States {
            didSet {
            self.notify()
        }
    }

    init(state:States) {
        self.state = state
    }

    //MARK: - Методы Observer-а

    func subscribe(_ observer: IObserver) {
        observers.append(observer)
    }

    func unsibscribe(_ observer: IObserver) {
        if let index = observers.firstIndex(where: { $0 === observer }) {
            observers.remove(at: index)
        }
    }

    func notify() {
        observers.forEach({ $0.update(subject: self)})
    }
}
