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

        return self.builder
            .setBackgroundColor(color: .white)
            .addLabel(label: firstLabel)
            .addLabel(label: secondLabel)
            .addButton(button: firstButton)
            .build()
    }

    func createSecondCustomView(firstTarget target:Selector, secondTarget: Selector) -> UIView {
        let labelBuilder = LabelBuilder()
        let labelDirector = LabelDirector(builder: labelBuilder)
        let firstLabel = labelDirector.createThirdTypeOfLabels()

        let buttonBuilder = ButtonBuilder()
        let buttonDirector = ButtonDirector(builder: buttonBuilder)
        let firstButton = buttonDirector.createSecondTypeOfButtons(withTarget: target)
        let secondButton = buttonDirector.createThirdTypeOfButtons(withTarget: secondTarget)


        return self.builder
            .setBackgroundColor(color: .white)
            .addLabel(label: firstLabel)
            .addButton(button: firstButton)
            .addButton(button: secondButton)
            .build()
    }
}
