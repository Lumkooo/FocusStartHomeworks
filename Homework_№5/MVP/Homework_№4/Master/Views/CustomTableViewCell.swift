//
//  CustomTableViewCell.swift
//  Homework_№4
//
//  Created by Андрей Шамин on 11/4/20.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {

    // MARK: - Fonts

    private enum Fonts {
        static let textFont = UIFont.italicSystemFont(ofSize: 16)
        static let headingFont = UIFont.systemFont(ofSize: 22, weight: .bold)
    }

    // MARK: - Constants

    private enum Constants {
        static let notEmptyTimeLabelWidth: CGFloat = 60
        static let headingLeadingAnchor: CGFloat = 16
        static let anchorConstant: CGFloat = 8
        static let labelsNumberOfLines = 0
    }

    // MARK: - Properties
    static var reuseIdentifier: String {
        return String(describing: CustomTableViewCell.self)
    }

    private let headingLabel = UILabel()
    private let myTextLabel = UILabel()
    private let timeLabel = UILabel()
    private var timeLabelWidth:NSLayoutConstraint?

    // MARK: - Метод для конфигурации TableViewCell извне

    func setupCell(heading:String, text:String, time:String) {
        self.headingLabel.text = heading
        self.myTextLabel.text = text
        self.timeLabel.text = time
        if time.isEmpty {
            timeLabelWidth?.constant = 0
        }
    }

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupElements()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Добавление элементов на ContentView и добавление их Constraint-ов

private extension CustomTableViewCell {
    func setupElements() {
        self.setupHeadingLabel()
        self.setupMyTextLabel()
        self.setupTimeLabel()
        self.setupConstraints()
    }

    func setupHeadingLabel() {
        self.headingLabel.translatesAutoresizingMaskIntoConstraints = false
        self.headingLabel.font = Fonts.headingFont
        self.headingLabel.numberOfLines = Constants.labelsNumberOfLines
        contentView.addSubview(headingLabel)
    }

    func setupMyTextLabel() {
        self.myTextLabel.translatesAutoresizingMaskIntoConstraints = false
        self.myTextLabel.font = Fonts.textFont
        self.myTextLabel.numberOfLines = Constants.labelsNumberOfLines
        contentView.addSubview(myTextLabel)
    }

    func setupTimeLabel() {
        self.timeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.timeLabel.font = Fonts.textFont
        self.timeLabelWidth = timeLabel.widthAnchor.constraint(equalToConstant: Constants.notEmptyTimeLabelWidth)
        contentView.addSubview(timeLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.headingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.headingLeadingAnchor),
            self.headingLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.anchorConstant),
            self.headingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            self.myTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.anchorConstant),
            self.myTextLabel.topAnchor.constraint(equalTo: headingLabel.bottomAnchor, constant: Constants.anchorConstant),
            self.myTextLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.anchorConstant),

            self.timeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.anchorConstant),
            self.timeLabelWidth ?? timeLabel.widthAnchor.constraint(equalToConstant: Constants.notEmptyTimeLabelWidth),
            self.timeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.anchorConstant),

            self.myTextLabel.trailingAnchor.constraint(equalTo: timeLabel.leadingAnchor),
        ])
    }
}
