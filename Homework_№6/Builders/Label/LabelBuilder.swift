//
//  Builder.swift
//  Homework_№6
//
//  Created by Андрей Шамин on 11/20/20.
//

import UIKit

protocol ILabelBuilder {
    func reset()
    func setText(_ text:String)
    func setAlignment()
    func setTextColor(_ color:UIColor)
    func setNumberOfLines(_ number:Int)
    func setTextFont(_ font:UIFont)
    func build() -> UILabel
}

final class LabelBuilder {

    private var myLabel = UILabel()
}

extension LabelBuilder: ILabelBuilder {

    func reset() {
        self.myLabel = UILabel()
    }

    func setText(_ text:String) {
        self.myLabel.text = text
    }

    func setAlignment() {
        self.myLabel.textAlignment = .center
    }

    func setTextColor(_ color: UIColor) {
        self.myLabel.textColor  = color
    }

    func setNumberOfLines(_ number: Int) {
        self.myLabel.numberOfLines = number
    }

    func setTextFont(_ font:UIFont) {
        self.myLabel.font = font
    }

    func build() -> UILabel {
        self.myLabel
    }
}
