//
//  VIew.swift
//  Homework_№6
//
//  Created by Андрей Шамин on 11/24/20.
//

import UIKit

protocol IViewBuilder {
    func setBackgroundColor(color:UIColor) -> Self
    func addLabel(label:UILabel) -> Self
    func addButton(button:UIButton) -> Self

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

    init() {
        self.topConstraint = self.myView.safeAreaLayoutGuide.topAnchor
    }
}

extension ViewBuilder: IViewBuilder {

    func setBackgroundColor(color:UIColor) -> Self {
        self.myView.backgroundColor = color
        return self
    }

    func addLabel(label: UILabel) -> Self {
        self.addLabelOnView(label: label)
        return self
    }

    func addButton(button: UIButton) -> Self {
        self.addButtonOnView(button: button)
        return self
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
            button.topAnchor.constraint(equalTo: self.topConstraint, constant: Constants.constraintConstant),
            button.leadingAnchor.constraint(equalTo: self.myView.leadingAnchor, constant: Constants.constraintConstant),
            button.trailingAnchor.constraint(equalTo: self.myView.trailingAnchor, constant: -Constants.constraintConstant),
            button.heightAnchor.constraint(equalToConstant: Constants.buttonHeight)
        ])

        self.topConstraint = button.bottomAnchor
    }
}
