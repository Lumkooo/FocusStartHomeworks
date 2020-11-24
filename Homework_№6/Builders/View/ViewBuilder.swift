//
//  VIew.swift
//  Homework_№6
//
//  Created by Андрей Шамин on 11/24/20.
//

import UIKit

protocol IViewBuilder {
    func setBackgroundColor(color:UIColor)
    func addLabel(label:UILabel)
    func addButton(button:UIButton)

    func build() -> UIView
}

final class ViewBuilder {

    // MARK: - Constants

    private enum Constants {
        static let constraintConstant:CGFloat = 16
        static let buttonHeight:CGFloat = 50
    }
    
    // MARK: - Views

    private var myView = UIView()

    // MARK: - Properties
    private var topConstraint:NSLayoutYAxisAnchor
    private var bottomConstraint:NSLayoutYAxisAnchor

    init() {
        self.topConstraint = self.myView.safeAreaLayoutGuide.topAnchor
        self.bottomConstraint = self.myView.safeAreaLayoutGuide.bottomAnchor
    }
}

extension ViewBuilder: IViewBuilder {

    func setBackgroundColor(color:UIColor) {
        self.myView.backgroundColor = color
    }

    func addLabel(label: UILabel) {
        self.addLabelOnView(label: label)
    }

    func addButton(button: UIButton) {
        self.addButtonOnView(button: button)
    }

    func build() -> UIView {
        return self.myView
    }
}


private extension ViewBuilder {
    func addLabelOnView(label: UILabel) {
        self.myView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topConstraint, constant: Constants.constraintConstant),
            label.leadingAnchor.constraint(equalTo: self.myView.leadingAnchor, constant: Constants.constraintConstant),
            label.trailingAnchor.constraint(equalTo: self.myView.trailingAnchor, constant: -Constants.constraintConstant)
        ])

        self.topConstraint = label.bottomAnchor
    }

    func addButtonOnView(button: UIButton) {
        self.myView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: self.bottomConstraint, constant: -Constants.constraintConstant),
            button.leadingAnchor.constraint(equalTo: self.myView.leadingAnchor, constant: Constants.constraintConstant),
            button.trailingAnchor.constraint(equalTo: self.myView.trailingAnchor, constant: -Constants.constraintConstant),
            button.heightAnchor.constraint(equalToConstant: Constants.buttonHeight)
        ])

        self.bottomConstraint = button.topAnchor
    }
}
