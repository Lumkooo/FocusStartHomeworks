//
//  OnePersonView.swift
//  Homework_№8
//
//  Created by Андрей Шамин on 12/6/20.
//

import UIKit

protocol IOnePersonView: class {
    var doneButtonTapped: ((PersonEntity) -> Void)? { get set }
    var goToAlert: ((String) -> Void)? { get set }

    func setupUIForPerson(person: Person)
}

final class OnePersonView: UIView {

    // MARK: - Views

    private let nameTextField: UITextField = {
        let myTextField = UITextField()
        myTextField.placeholder = "Имя"
        myTextField.borderStyle = .roundedRect
        return myTextField
    }()

    private let ageTextField: UITextField = {
        let myTextField = UITextField()
        myTextField.placeholder = "Возраст"
        myTextField.keyboardType = .numberPad
        myTextField.borderStyle = .roundedRect
        return myTextField
    }()

    private let positionTextField: UITextField = {
        let myTextField = UITextField()
        myTextField.placeholder = "Должность"
        myTextField.borderStyle = .roundedRect
        return myTextField
    }()

    private let educationTextField: UITextField = {
        let myTextField = UITextField()
        myTextField.placeholder = "Образование"
        myTextField.borderStyle = .roundedRect
        return myTextField
    }()

    private let expirienceTextField: UITextField = {
        let myTextField = UITextField()
        myTextField.placeholder = "Опыт работы"
        myTextField.borderStyle = .roundedRect
        return myTextField
    }()

    private let doneButton: UIButton = {
        let myButton = UIButton()
        myButton.setTitle("Сохранить", for: .normal)
        myButton.setTitleColor(.white, for: .normal)
        myButton.backgroundColor = .black
        myButton.layer.cornerRadius = Constants.cornerRadius
        myButton.addTarget(self, action: #selector(doneButtonTapped(gesture:)), for: .touchUpInside)
        return myButton
    }()


    // MARK: - Properties

    var doneButtonTapped: ((PersonEntity) -> Void)?
    var goToAlert: ((String) -> Void)?

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupElements()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - ButtonAction

    @objc func doneButtonTapped(gesture: UIGestureRecognizer) {
        checkTextFields { (personEntity) in
            self.doneButtonTapped?(personEntity)
        }
    }

    private func checkTextFields(completion: (PersonEntity) -> Void) {
        guard let name = self.nameTextField.text,
              name.count > 0 else {
            self.goToAlert?("Необходимо заполнить поле имя")
            return
        }

        guard let ageString = self.ageTextField.text,
              ageString.count > 0,
              let age = Int(ageString) else {
            self.goToAlert?("Необходимо заполнить поле возраст(должно быть число)")
            return
        }

        guard let position = self.positionTextField.text,
              position.count > 0 else {
            self.goToAlert?("Необходимо заполнить поле должность")
            return
        }

        let education = self.educationTextField.text ?? ""
        let expirience = self.expirienceTextField.text ?? ""


        let personEntity = PersonEntity(name: name,
                                        age: age,
                                        position: position,
                                        education: education,
                                        expirience: expirience)
        completion(personEntity)
    }
}

// MARK: - IOnePersonView

extension OnePersonView: IOnePersonView {
    func setupUIForPerson(person: Person) {
        self.nameTextField.text = person.name
        self.ageTextField.text = String(person.age)
        self.positionTextField.text = person.position
        self.expirienceTextField.text = person.expirience
        self.educationTextField.text = person.education
    }
}

// MARK: - UISetup

private extension OnePersonView {
    func setupElements() {
        self.backgroundColor = .systemBackground
        self.setupNameTextField()
        self.setupAgeTextField()
        self.setupPositionTextField()
        self.setupEducationTextField()
        self.setupExpirienctTextField()
        self.setupDoneButton()
    }

    func setupNameTextField() {
        self.addSubview(self.nameTextField)
        self.nameTextField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.nameTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
                                                        constant: Constants.anchorConstant),
            self.nameTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
                                                        constant: -Constants.anchorConstant),
            self.nameTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
                                                        constant: Constants.anchorConstant),
        ])
    }

    func setupAgeTextField() {
        self.addSubview(self.ageTextField)
        self.ageTextField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.ageTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
                                                        constant: Constants.anchorConstant),
            self.ageTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
                                                        constant: -Constants.anchorConstant),
            self.ageTextField.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor,
                                                        constant: Constants.anchorConstant),
        ])
    }

    func setupPositionTextField() {
        self.addSubview(self.positionTextField)
        self.positionTextField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.positionTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
                                                        constant: Constants.anchorConstant),
            self.positionTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
                                                        constant: -Constants.anchorConstant),
            self.positionTextField.topAnchor.constraint(equalTo: self.ageTextField.bottomAnchor,
                                                        constant: Constants.anchorConstant),
        ])
    }

    func setupEducationTextField() {
        self.addSubview(self.educationTextField)
        self.educationTextField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.educationTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
                                                        constant: Constants.anchorConstant),
            self.educationTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
                                                        constant: -Constants.anchorConstant),
            self.educationTextField.topAnchor.constraint(equalTo: self.positionTextField.bottomAnchor,
                                                        constant: Constants.anchorConstant),
        ])
    }

    func setupExpirienctTextField() {
        self.addSubview(self.expirienceTextField)
        self.expirienceTextField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.expirienceTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
                                                        constant: Constants.anchorConstant),
            self.expirienceTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
                                                        constant: -Constants.anchorConstant),
            self.expirienceTextField.topAnchor.constraint(equalTo: self.educationTextField.bottomAnchor,
                                                        constant: Constants.anchorConstant),
        ])
    }

    func setupDoneButton() {
        self.addSubview(self.doneButton)
        self.doneButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.doneButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
                                                        constant: Constants.anchorConstant),
            self.doneButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
                                                        constant: -Constants.anchorConstant),
            self.doneButton.topAnchor.constraint(equalTo: self.expirienceTextField.bottomAnchor,
                                                        constant: Constants.anchorConstant),
            self.doneButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight)
        ])
    }
}
