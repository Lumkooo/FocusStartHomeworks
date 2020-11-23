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

    // MARK: - Constants

    private enum Constants {
        static let buttonsCornerRadius:CGFloat = 8
        static let shadowRadius:CGFloat = 5
        static let shadowOpacity:Float = 1
        static let constraintConstant:CGFloat = 16
        static let labelsConstraintConstant:CGFloat = 4
        static let buttonHeight:CGFloat = 40
        static let firstButtonTappedLabelText = "Секундочку...\nСейчас изменится состояние и покажется здесь"
        static let labelBasicText = "Label для отображения State-ов объекта"
    }

    // MARK: - Properties

    private var firstLabel:UILabel?
    private var firstButton:UIButton?
    private var secondButton:UIButton?
    var didTapButton: (() -> Void)?
    var didTapSecondButton: (() -> Void)?

    //MARK: - Init

    init() {
        super.init(frame: .zero)
        self.setupElements()
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
        self.firstLabel?.text = Constants.firstButtonTappedLabelText
    }

    @objc func secondButtonTapped(gesture:UIGestureRecognizer) {
        self.didTapSecondButton?()
        self.firstLabel?.text = Constants.labelBasicText
    }
}

// MARK: - Добавление элементов на view и установление констреинтов

private extension SecondCustomView {
    func setupElements() {
        self.backgroundColor = .white
        setupLabel()
        setupButton()
        setupSecondButton()
    }

    func setupLabel() {
        let labelBuilder = LabelBuilder()
        let labelDirector = LabelDirector(builder: labelBuilder)
        self.firstLabel = labelDirector.createThirdTypeOfLabels()

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

    func setupButton() {
        let buttonBuilder = ButtonBuilder()
        let buttonDirector = ButtonDirector(builder: buttonBuilder)
        self.firstButton = buttonDirector.createSecondTypeOfButtons()
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

    func setupSecondButton() {
        let buttonBuilder = ButtonBuilder()
        let buttonDirector = ButtonDirector(builder: buttonBuilder)
        self.secondButton = buttonDirector.createThirdTypeOfButtons()
        self.secondButton?.addTarget(self, action: #selector(secondButtonTapped(gesture:)), for: .touchUpInside)


        guard let secondButton = secondButton else { fatalError("Проблема со второй кнопкой") }
        self.addSubview(secondButton)
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.bottomAnchor.constraint(equalTo: self.firstButton?.topAnchor ?? self.safeAreaLayoutGuide.bottomAnchor,
                                            constant: -Constants.constraintConstant).isActive = true
        secondButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
                                             constant: Constants.constraintConstant).isActive = true
        secondButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
                                              constant: -Constants.constraintConstant).isActive = true
        secondButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight).isActive = true
    }

}


extension SecondCustomView: ISecondViewControllerUI {
    func stateChanged(toState state:Subject.States) {
        self.firstLabel?.text = "State изменен на :\n\(state)"
    }
}
