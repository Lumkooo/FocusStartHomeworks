//
//  CustomView.swift
//  Homework_№6
//
//  Created by Андрей Шамин on 11/20/20.
//

import UIKit

protocol  IViewControllerUI {
    var didTapButton:(() -> Void)? { get set }
}

final class CustomView: UIView {

    // MARK: - Constants

    private enum Constants {
        static let buttonsCornerRadius:CGFloat = 8
        static let shadowRadius:CGFloat = 5
        static let shadowOpacity:Float = 1
        static let constraintConstant:CGFloat = 16
        static let labelsConstraintConstant:CGFloat = 4
        static let buttonHeight:CGFloat = 40
    }

    // MARK: - Properties

    private var firstLabel:UILabel?
    private var secondLabel:UILabel?
    private var firstButton:UIButton?
    private var secondButton:UIButton?
    var didTapButton: (() -> Void)?

    //MARK: - Init

    init() {
        super.init(frame: .zero)
        self.setupElements()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Обработка нажатия на кнопку

    @objc func buttonTapped(gesture:UIGestureRecognizer) {
        self.didTapButton?()
    }
}

// MARK: - Добавление элементов на view и установление констреинтов

private extension CustomView {
    func setupElements() {
        self.setupLabel()
        self.setupSecondLabel()
        self.setupButton()
    }

    func setupLabel() {
        let labelBuilder = LabelBuilder()
        let labelDirector = LabelDirector(builder: labelBuilder)
        self.firstLabel = labelDirector.createFirstTypeOfLabels()

        guard let firstLabel = firstLabel else { fatalError("Проблема с Label-ом") }
        self.addSubview(firstLabel)
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        firstLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
                                        constant: Constants.labelsConstraintConstant).isActive = true
        firstLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
                                            constant: Constants.labelsConstraintConstant).isActive = true
        firstLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
                                             constant: -Constants.labelsConstraintConstant).isActive = true
    }

    func setupSecondLabel() {
        let labelBuilder = LabelBuilder()
        let labelDirector = LabelDirector(builder: labelBuilder)
        self.secondLabel = labelDirector.createSecondTypeOfLabels()

        guard let secondLabel = secondLabel else { fatalError("Проблема с Label-ом") }
        self.addSubview(secondLabel)
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.topAnchor.constraint(equalTo: self.firstLabel?.bottomAnchor ?? self.safeAreaLayoutGuide.topAnchor,
                                        constant: Constants.labelsConstraintConstant).isActive = true
        secondLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
                                            constant: Constants.labelsConstraintConstant).isActive = true
        secondLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
                                             constant: -Constants.labelsConstraintConstant).isActive = true
    }

    func setupButton() {
        let buttonBuilder = ButtonBuilder()
        let buttonDirector = ButtonDirector(builder: buttonBuilder)
        self.firstButton = buttonDirector.createFirstTypeOfButtons()
        self.firstButton?.addTarget(self, action: #selector(buttonTapped(gesture:)), for: .touchUpInside)

        guard let firstButton = firstButton else { fatalError("Проблема с кнопкой") }
        self.addSubview(firstButton)
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        firstButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,
                                            constant: -Constants.constraintConstant).isActive = true
        firstButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
                                             constant: Constants.constraintConstant).isActive = true
        firstButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
                                              constant: -Constants.constraintConstant).isActive = true
        firstButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight).isActive = true
    }
}


extension CustomView: IViewControllerUI {

}
