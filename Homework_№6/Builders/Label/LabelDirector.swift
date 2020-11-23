//
//  LabelDirector.swift
//  Homework_№6
//
//  Created by Андрей Шамин on 11/23/20.
//

import UIKit

final class LabelDirector {
    private var builder: ILabelBuilder

    init(builder:ILabelBuilder) {
        self.builder = builder
    }

    func createFirstTypeOfLabels() -> UILabel {
        self.builder.reset()
        self.builder.setNumberOfLines(1)
        self.builder.setText("Заголовок")
        self.builder.setTextFont(.systemFont(ofSize: 26, weight: .bold))
        self.builder.setTextColor(.red)
        self.builder.setAlignment()
        return self.builder.build()
    }

    func createSecondTypeOfLabels() -> UILabel {
        self.builder.reset()
        self.builder.setNumberOfLines(0)
        self.builder.setText("Нижний Label, который что-то содержит. И он может быть на несколько строчек\nПродолжение...")
        self.builder.setTextColor(.black)
        self.builder.setAlignment()
        return self.builder.build()
    }

    func createThirdTypeOfLabels() -> UILabel {
        self.builder.reset()
        self.builder.setNumberOfLines(0)
        self.builder.setText("Label на втором экране, который\nтакже в несколько строчек и с измененным Font-ом")
        self.builder.setTextColor(.black)
        self.builder.setTextFont(.systemFont(ofSize: 20, weight: .bold))
        self.builder.setAlignment()
        return self.builder.build()
    }
}
