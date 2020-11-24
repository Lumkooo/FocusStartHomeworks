//
//  ButtonBuilder.swift
//  Homework_№6
//
//  Created by Андрей Шамин on 11/20/20.
//

import UIKit

protocol IButtonBuilder {
    func reset()
    func setText(_ text: String)
    func setTextColor(_ color: UIColor)
    func setBackgroundColor(_ color: UIColor)
    func setShadow(_ color: CGColor)
    func setCornerRadius(_ cornerRadius: CGFloat)
    func setAction(_ target: Any?, action: Selector, for event: UIControl.Event)
    func setImage(_ image:UIImage)
    func setBackgroundImage(_ image:UIImage)
    func setTintColor(_ color:UIColor)
    func build() -> UIButton
}

final class ButtonBuilder {

    // MARK: - Views

    private var myButton = UIButton()

    // MARK: - Constants

    private enum Constants {
        static let shadowRadius:CGFloat = 5
        static let shadowOpacity:Float = 1
    }

}

extension ButtonBuilder: IButtonBuilder {

    func reset() {
        self.myButton = UIButton()
    }

    func setText(_ text: String) {
        self.myButton.setTitle(text, for: .normal)
    }

    func setTextColor(_ color: UIColor) {
        self.myButton.setTitleColor(color, for: .normal)
    }

    func setAction(_ target: Any?, action: Selector, for event: UIControl.Event) {
        self.myButton.addTarget(target, action: action, for: event)
    }

    func setBackgroundColor(_ color: UIColor) {
        self.myButton.backgroundColor = color
    }

    func setShadow(_ color: CGColor) {
        self.myButton.layer.shadowColor = color
        self.myButton.layer.shadowOpacity = Constants.shadowOpacity
        self.myButton.layer.shadowOffset = .zero
        self.myButton.layer.shadowRadius = Constants.shadowRadius
    }

    func setCornerRadius(_ cornerRadius: CGFloat) {
        self.myButton.layer.cornerRadius = cornerRadius
    }

    func setImage(_ image: UIImage) {
        self.myButton.setImage(image, for: .normal)
    }

    func setBackgroundImage(_ image: UIImage) {
        self.myButton.setBackgroundImage(image, for: .normal)
    }

    func setTintColor(_ color: UIColor) {
        self.myButton.tintColor = color
    }

    func build() -> UIButton {
        self.myButton
    }
}
