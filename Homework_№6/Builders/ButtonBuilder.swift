//
//  ButtonBuilder.swift
//  Homework_№6
//
//  Created by Андрей Шамин on 11/20/20.
//

import UIKit

protocol IButtonBuilder {
    func setText(_ text: String) -> ButtonBuilder.Builder
    func setTextColor(_ color: UIColor) -> ButtonBuilder.Builder
    func setBackgroundColor(_ color: UIColor) -> ButtonBuilder.Builder
    func setShadow(color: CGColor) -> ButtonBuilder.Builder
    func setCornerRadius(_ cornerRadius: CGFloat) -> ButtonBuilder.Builder
    func setTarget(selector:Selector) -> ButtonBuilder.Builder
    func setImage(image:UIImage) -> ButtonBuilder.Builder
    func setBackgroundImage(image:UIImage) -> ButtonBuilder.Builder
    func setTintColor(color:UIColor) -> ButtonBuilder.Builder
    func build() -> ButtonBuilder
}

final class ButtonBuilder: UIButton {
    init() {
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    class Builder: IButtonBuilder {

        // MARK: - Constants

        private enum Constants {
            static let shadowRadius:CGFloat = 5
            static let shadowOpacity:Float = 1
        }

        private var innerBuilder = ButtonBuilder()

        func setText(_ text: String) -> Builder {
            innerBuilder.self.setTitle(text, for: .normal)
            return self
        }

        func setImage(image: UIImage) -> ButtonBuilder.Builder {
            innerBuilder.self.setImage(image, for: .normal)
            return self
        }

        func setTintColor(color:UIColor) -> ButtonBuilder.Builder {
            innerBuilder.self.tintColor = color
            return self
        }

        func setBackgroundImage(image: UIImage) -> ButtonBuilder.Builder {
            innerBuilder.self.setBackgroundImage(image, for: .normal)
            return self
        }

        func setTextColor(_ color: UIColor) -> Builder {
            innerBuilder.self.setTitleColor(color, for: .normal)
            return self
        }

        func setBackgroundColor(_ color: UIColor) -> Builder {
            innerBuilder.self.backgroundColor = color
            return self
        }

        func setShadow(color: CGColor) -> Builder {
            innerBuilder.self.layer.shadowColor = color
            innerBuilder.self.layer.shadowOpacity = Constants.shadowOpacity
            innerBuilder.self.layer.shadowOffset = .zero
            innerBuilder.self.layer.shadowRadius = Constants.shadowRadius
            return self
        }

        func setCornerRadius(_ cornerRadius: CGFloat) -> Builder {
            innerBuilder.self.layer.cornerRadius = cornerRadius
            return self
        }


        func setTarget(selector:Selector) -> Builder {
            innerBuilder.self.addTarget(self, action: selector, for: .touchUpInside)
            return self
        }

        func build() -> ButtonBuilder {
            return innerBuilder
        }
    }
}
