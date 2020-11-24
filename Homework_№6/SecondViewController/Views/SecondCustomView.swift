//
//  SecondCustomView.swift
//  Homework_№6
//
//  Created by Андрей Шамин on 11/20/20.
//

import UIKit

protocol  ISecondViewControllerUI {
    var didTapButton:(() -> Void)? { get set }
    var didTapSecondButton:(() -> Void)? { get set }
    func stateChanged(toState state:Subject.States)
}

final class SecondCustomView: UIView {

    // MARK: - Properties

    var didTapButton: (() -> Void)?
    var didTapSecondButton: (() -> Void)?
    var customView:UIView?

    //MARK: - Init

    init() {
        super.init(frame: .zero)
        self.addCustomViewToView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        self.didTapSecondButton?()
    }

    // MARK: - Обработка нажатия на кнопку

    @objc func buttonTapped(gesture:UIGestureRecognizer) {
        self.didTapButton?()
    }

    @objc func secondButtonTapped(gesture:UIGestureRecognizer) {
        self.didTapSecondButton?()
    }
}

extension SecondCustomView: ISecondViewControllerUI {
    // В 0 элементе массива лежит Label, если произойдет, что его там нет,
    // то Observer будет выводить в консоль результат смены state
    func stateChanged(toState state:Subject.States) {
        guard let firstLabel = self.customView?.subviews[0] as? UILabel else {
            print("State changed to \n\(state)")
            return
        }
        firstLabel.text = "State changed to \n\(state)"
    }
}

// MARK: -

private extension SecondCustomView {
    func addCustomViewToView() {
        let viewBuilder = ViewBuilder()
        let viewDirector = ViewDirector(builder: viewBuilder)

        let firstTarget = #selector(buttonTapped(gesture:))
        let secondTarget = #selector(secondButtonTapped(gesture:))
        self.customView = viewDirector.createSecondCustomView(firstTarget: firstTarget, secondTarget: secondTarget)

        guard let customView = self.customView else { fatalError("Error") }
        self.addSubview(customView)
        customView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: self.topAnchor),
            customView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            customView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            customView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
