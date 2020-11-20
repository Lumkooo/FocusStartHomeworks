//
//  Builder.swift
//  Homework_№6
//
//  Created by Андрей Шамин on 11/20/20.
//

import UIKit

protocol ILabelBuilder {
    func setText(_ text:String) -> LabelBuilder.Builder
    func setTextColor(_ color: UIColor) -> LabelBuilder.Builder
    func setBackgroundColor(_ color: UIColor) -> LabelBuilder.Builder
    func setAlignment(_ textAlignment: NSTextAlignment) -> LabelBuilder.Builder
    func build() -> LabelBuilder
}

final class LabelBuilder: UILabel {
    init() {
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    class Builder: ILabelBuilder {
        private var innerBuilder = LabelBuilder()

        func setText(_ text: String) -> Builder {
            innerBuilder.self.text = text
            return self
        }

        func setTextColor(_ color: UIColor) -> Builder {
            innerBuilder.self.textColor = color
            return self
        }

        func setBackgroundColor(_ color: UIColor) -> Builder {
            innerBuilder.self.backgroundColor = color
            return self
        }

        func setAlignment(_ textAlignment: NSTextAlignment) -> Builder {
            innerBuilder.self.textAlignment = textAlignment
            return self
        }

        func setNumberOfLines(_ numberOfLines:Int = 0) -> Builder {
            innerBuilder.self.numberOfLines = numberOfLines
            return self
        }

        func build() -> LabelBuilder {
            return innerBuilder
        }
    }
}
