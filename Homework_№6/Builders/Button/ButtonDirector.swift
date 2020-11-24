//
//  ButtonDirector.swift
//  Homework_№6
//
//  Created by Андрей Шамин on 11/23/20.
//

import UIKit

final class ButtonDirector {

    // MARK: Properties

    private var builder: IButtonBuilder

    // MARK: - Constants

    private enum Constants {
        static let firstButtonCornerRadius:CGFloat = 15
        static let secondButtonCornerRadius:CGFloat = 17
        static let thirdButtonCornerRadius:CGFloat = 17
    }

    init(builder:IButtonBuilder) {
        self.builder = builder
    }

    func createFirstTypeOfButtons(withTarget target:Selector) -> UIButton {
        self.builder.reset()
        self.builder.setText("Кнопка для перехода")
        self.builder.setBackgroundColor(.black)
        self.builder.setTextColor(.white)
        self.builder.setAction(self, action: target, for: .touchUpInside)
        self.builder.setShadow(UIColor.black.cgColor)
        self.builder.setCornerRadius(Constants.firstButtonCornerRadius)
        return self.builder.build()
    }

    func createSecondTypeOfButtons(withTarget target:Selector) -> UIButton {
        self.builder.reset()
        self.builder.setText("Запустить таймер")
        self.builder.setBackgroundColor(.white)
        self.builder.setTextColor(.red)
        self.builder.setShadow(UIColor.red.cgColor)
        self.builder.setAction(self, action: target, for: .touchUpInside)
        self.builder.setCornerRadius(Constants.secondButtonCornerRadius)
        return self.builder.build()
    }

    func createThirdTypeOfButtons(withTarget target:Selector) -> UIButton {
        self.builder.reset()
        self.builder.setText("Остановить таймер")
        self.builder.setBackgroundColor(.white)
        self.builder.setTextColor(.red)
        self.builder.setShadow(UIColor.red.cgColor)
        self.builder.setAction(self, action: target, for: .touchUpInside)
        self.builder.setCornerRadius(Constants.thirdButtonCornerRadius)
        return self.builder.build()
    }
}
