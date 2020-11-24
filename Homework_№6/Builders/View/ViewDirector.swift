//
//  ViewDirector.swift
//  Homework_№6
//
//  Created by Андрей Шамин on 11/24/20.
//

import UIKit

protocol IViewDirector {
    func createFirstCustomView(firstTarget target:Selector) -> UIView
    func createSecondCustomView(firstTarget target:Selector, secondTarget: Selector) -> UIView
}


final class ViewDirector {

    private var builder: IViewBuilder

    init(builder:IViewBuilder) {
        self.builder = builder
    }
}

extension ViewDirector: IViewDirector {
    func createFirstCustomView(firstTarget target: Selector) -> UIView{
        let labelBuilder = LabelBuilder()
        let labelDirector = LabelDirector(builder: labelBuilder)
        let firstLabel = labelDirector.createFirstTypeOfLabels()
        let secondLabel = labelDirector.createSecondTypeOfLabels()

        let buttonBuilder = ButtonBuilder()
        let buttonDirector = ButtonDirector(builder: buttonBuilder)
        let firstButton = buttonDirector.createFirstTypeOfButtons(withTarget: target)

        self.builder.setBackgroundColor(color: .white)
        self.builder.addLabel(label: firstLabel)
        self.builder.addLabel(label: secondLabel)
        self.builder.addButton(button: firstButton)
        return self.builder.build()
    }

    func createSecondCustomView(firstTarget target:Selector, secondTarget: Selector) -> UIView {
        let labelBuilder = LabelBuilder()
        let labelDirector = LabelDirector(builder: labelBuilder)
        let firstLabel = labelDirector.createThirdTypeOfLabels()

        let buttonBuilder = ButtonBuilder()
        let buttonDirector = ButtonDirector(builder: buttonBuilder)
        let firstButton = buttonDirector.createSecondTypeOfButtons(withTarget: target)
        let secondButton = buttonDirector.createThirdTypeOfButtons(withTarget: secondTarget)

        self.builder.setBackgroundColor(color: .white)
        self.builder.addLabel(label: firstLabel)
        self.builder.addButton(button: firstButton)
        self.builder.addButton(button: secondButton)
        return self.builder.build()
    }
}
